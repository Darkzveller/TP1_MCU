/*
 * TP1 - Testeur ZIF16 et casiers de composants logiques
 * Carte : NUCLEO-F103RB / Keil uVision
 * Acces direct aux registres (CMSIS), sans HAL, LL ou StdPeriph.
 *
 * IMPORTANT : les adresses des PCF8574 et PB6/PB7 sont des choix
 * de cablage a confirmer sur la maquette (non precises dans le sujet).
 */
#include "stm32f10x.h"
#include <stdint.h>

#define NB_CASIERS         16U
#define TAILLE_FIFO        16U
#define VITESSE_UART       9600U

/* Bit banging I2C : PB6=SCL, PB7=SDA (sorties open-drain). */
#define SCL_PIN            6U
#define SDA_PIN            7U
#define CLK_PCF            (1U << SCL_PIN)
#define SDA_PCF            (1U << SDA_PIN)

/* Adresses 7 bits PROPOSEES ; verifier les broches A0, A1, A2. */
#define PCF_LED_0          0x20U  /* casiers 0 a 3   */
#define PCF_LED_1          0x21U  /* casiers 4 a 7   */
#define PCF_LED_2          0x22U  /* casiers 8 a 11  */
#define PCF_LED_3          0x23U  /* casiers 12 a 15 */
#define PCF_REED_0         0x24U  /* capteurs 0 a 7 */
#define PCF_REED_1         0x25U  /* capteurs 8 a 15 */

/* Valeurs CRL/CRH du STM32F103 : MODE[1:0] et CNF[1:0]. */
typedef enum {
    GPIO_INPUT_ANALOG      = 0x0,
    GPIO_INPUT_FLOATING    = 0x4,
    GPIO_INPUT_PULL        = 0x8,
    GPIO_OUTPUT_PP_10MHZ   = 0x1,
    GPIO_OUTPUT_PP_2MHZ    = 0x2,
    GPIO_OUTPUT_PP_50MHZ   = 0x3,
    GPIO_OUTPUT_OD_10MHZ   = 0x5,
    GPIO_OUTPUT_OD_2MHZ    = 0x6,
    GPIO_OUTPUT_OD_50MHZ   = 0x7,
    GPIO_AF_PP_10MHZ       = 0x9,
    GPIO_AF_PP_2MHZ        = 0xA,
    GPIO_AF_PP_50MHZ       = 0xB,
    GPIO_AF_OD_10MHZ       = 0xD,
    GPIO_AF_OD_2MHZ        = 0xE,
    GPIO_AF_OD_50MHZ       = 0xF
} GPIO_Config_t;

typedef enum { GPIO_LOW = 0, GPIO_HIGH = 1 } GPIO_State_t;

/* Protocole de reception : etats 1-4 pour casiers, 5-8 pour ZIF. */
static volatile uint8_t MaeRcp = 0;
static volatile uint8_t entete = 0;
static volatile uint8_t octets_recus[4];
static volatile uint8_t commande_casiers[4];
static volatile uint8_t commande_zif[4];
static volatile uint8_t casiers_prets = 0;
static volatile uint8_t zif_pret = 0;

/* FIFO d'emission : modifiee seulement dans main(). */
static uint8_t Fifo[TAILLE_FIFO];
static uint8_t IwFifo = 0;
static uint8_t IrFifo = 0;
static uint8_t FifoLibre = TAILLE_FIFO;
static volatile uint8_t pcfs_initialises = 0; /* visible dans le debogueur */

static const uint8_t adresses_leds[4] = {
    PCF_LED_0, PCF_LED_1, PCF_LED_2, PCF_LED_3
};

/* ------------------------ GPIO ------------------------ */
void GPIO_InitPin(GPIO_TypeDef *port, uint8_t pin,
                  GPIO_Config_t config, GPIO_State_t etat)
{
    volatile uint32_t *registre;
    uint32_t decalage;
    uint32_t masque;

    if (pin > 15U || (uint32_t)config > 15U)
        return;

    if (port == GPIOA)      RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;
    else if (port == GPIOB) RCC->APB2ENR |= RCC_APB2ENR_IOPBEN;
    else if (port == GPIOC) RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;
    else return;

    registre = (pin < 8U) ? &port->CRL : &port->CRH;
    decalage = ((uint32_t)pin % 8U) * 4U;
    masque = 0xFU << decalage;

    /* Pour un changement sortie -> pull-up/down, liberer la patte
       avant de changer le bit ODR : pas de niveau fort parasite. */
    if (config == GPIO_INPUT_PULL) {
        *registre = (*registre & ~masque) | (0x4U << decalage);
    }

    if (etat == GPIO_HIGH) port->BSRR = 1U << pin;
    else                   port->BRR  = 1U << pin;

    *registre = (*registre & ~masque) | ((uint32_t)config << decalage);
}

static void GPIO_Ecrire(GPIO_TypeDef *port, uint8_t pin, uint8_t niveau)
{
    if (niveau) port->BSRR = 1U << pin;
    else        port->BRR  = 1U << pin;
}

/* Temporisation en microsecondes : SysTick reserve a ce TP. */
static void Attendre_us(uint32_t us)
{
    uint32_t ticks;
    if (us == 0U) return;
    ticks = (SystemCoreClock / 1000000U) * us;
    if (ticks == 0U || ticks > 0x1000000U) return;

    SysTick->CTRL = 0U;
    SysTick->LOAD = ticks - 1U;
    SysTick->VAL = 0U;
    SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_ENABLE_Msk;
    while ((SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk) == 0U) { }
    SysTick->CTRL = 0U;
}

/* ------------------------ ZIF16 ------------------------ */
/* B0..B7 = PC0..PC7 (pattes ZIF 1..8).
   B8..B15 = PB8..PB15 (pattes ZIF 9..16). */
static void ZIF_Config(uint16_t directions, uint16_t niveaux)
{
    uint8_t i;
    GPIO_TypeDef *port;
    uint8_t pin;

    /* D'abord liberer toutes les pattes, pour eviter des conflits. */
    for (i = 0; i < 16U; i++) {
        port = (i < 8U) ? GPIOC : GPIOB;
        pin = i;
        GPIO_InitPin(port, pin, GPIO_INPUT_FLOATING, GPIO_LOW);
    }

    for (i = 0; i < 16U; i++) {
        port = (i < 8U) ? GPIOC : GPIOB;
        pin = i;
        if (directions & (1U << i)) {
            GPIO_InitPin(port, pin, GPIO_INPUT_PULL,
                         (niveaux & (1U << i)) ? GPIO_HIGH : GPIO_LOW);
        } else {
            GPIO_InitPin(port, pin, GPIO_OUTPUT_PP_2MHZ,
                         (niveaux & (1U << i)) ? GPIO_HIGH : GPIO_LOW);
        }
    }
}

static uint16_t ZIF_Lire(void)
{
    uint16_t broches_PC = (uint16_t)(GPIOC->IDR & 0x00FFU);
    uint16_t broches_PB = (uint16_t)(GPIOB->IDR & 0xFF00U);
    return (uint16_t)(broches_PB | broches_PC);
}

/* Ne pas permettre plus de deux sorties fortes (deux alimentations). */
static uint8_t ZIF_DirectionsValides(uint16_t directions)
{
    uint8_t sorties = 0;
    uint8_t i;
    for (i = 0; i < 16U; i++) {
        if ((directions & (1U << i)) == 0U) sorties++;
    }
    return (uint8_t)(sorties <= 2U);
}

/* ------------------------ I2C logiciel ------------------------ */
static void I2C_Init(void)
{
    /* 1 = relachement de ligne en open-drain, PAS une sortie forte. */
    GPIO_InitPin(GPIOB, SCL_PIN, GPIO_OUTPUT_OD_2MHZ, GPIO_HIGH);
    GPIO_InitPin(GPIOB, SDA_PIN, GPIO_OUTPUT_OD_2MHZ, GPIO_HIGH);
}

static void I2C_Start(void)
{
    GPIO_Ecrire(GPIOB, SDA_PIN, 1);
    GPIO_Ecrire(GPIOB, SCL_PIN, 1);
    Attendre_us(5);
    GPIO_Ecrire(GPIOB, SDA_PIN, 0);
    Attendre_us(5);
    GPIO_Ecrire(GPIOB, SCL_PIN, 0);
}

static void I2C_Stop(void)
{
    GPIO_Ecrire(GPIOB, SDA_PIN, 0);
    Attendre_us(5);
    GPIO_Ecrire(GPIOB, SCL_PIN, 1);
    Attendre_us(5);
    GPIO_Ecrire(GPIOB, SDA_PIN, 1);
    Attendre_us(5);
}

static void I2C_EcrireBit(uint8_t bit)
{
    GPIO_Ecrire(GPIOB, SDA_PIN, bit);
    Attendre_us(5);
    GPIO_Ecrire(GPIOB, SCL_PIN, 1);
    Attendre_us(5);
    GPIO_Ecrire(GPIOB, SCL_PIN, 0);
    Attendre_us(5);
}

static uint8_t I2C_LireBit(void)
{
    uint8_t bit;
    GPIO_Ecrire(GPIOB, SDA_PIN, 1); /* SDA relachee */
    Attendre_us(5);
    GPIO_Ecrire(GPIOB, SCL_PIN, 1);
    Attendre_us(5);
    bit = (GPIOB->IDR & SDA_PCF) ? 1U : 0U;
    GPIO_Ecrire(GPIOB, SCL_PIN, 0);
    Attendre_us(5);
    return bit;
}

/* Retourne 1 si le recepteur a acquitte (ACK = 0 sur SDA). */
static uint8_t I2C_EcrireOctet(uint8_t valeur)
{
    int8_t i;
    for (i = 7; i >= 0; i--)
        I2C_EcrireBit((uint8_t)((valeur >> i) & 1U));
    return (uint8_t)(I2C_LireBit() == 0U);
}

/* Lecture du dernier octet : le maitre repond NACK. */
static uint8_t I2C_LireOctet(void)
{
    uint8_t valeur = 0;
    uint8_t i;
    for (i = 0; i < 8U; i++)
        valeur = (uint8_t)((valeur << 1) | I2C_LireBit());
    I2C_EcrireBit(1); /* NACK */
    return valeur;
}

static uint8_t PCF_Ecrire(uint8_t adresse, uint8_t valeur)
{
    uint8_t ok;
    I2C_Start();
    ok = I2C_EcrireOctet((uint8_t)(adresse << 1));
    if (ok) ok = I2C_EcrireOctet(valeur);
    I2C_Stop();
    return ok;
}

static uint8_t PCF_Lire(uint8_t adresse, uint8_t *valeur)
{
    uint8_t ok;
    I2C_Start();
    ok = I2C_EcrireOctet((uint8_t)((adresse << 1) | 1U));
    if (ok) *valeur = I2C_LireOctet();
    I2C_Stop();
    return ok;
}

/* ------------------------ Casiers ------------------------ */
static uint8_t Casiers_Initialiser(void)
{
    uint8_t i;
    uint8_t ok = 1;
    for (i = 0; i < 4U; i++)
        if (!PCF_Ecrire(adresses_leds[i], 0xFFU)) ok = 0; /* LEDs eteintes */

    /* Capteurs : ecrire 1 sur tous les bits = entree avec pull-up. */
    if (!PCF_Ecrire(PCF_REED_0, 0xFFU)) ok = 0;
    if (!PCF_Ecrire(PCF_REED_1, 0xFFU)) ok = 0;
    return ok;
}

/* Le bit k vaut 1 si la LED du casier k doit etre allumee. */
static uint8_t Casiers_LEDs(uint16_t vertes, uint16_t rouges)
{
    uint8_t etats[4] = { 0xFFU, 0xFFU, 0xFFU, 0xFFU };
    uint8_t casier;
    uint8_t i;
    uint8_t ok = 1;

    for (casier = 0; casier < NB_CASIERS; casier++) {
        uint8_t composant = casier / 4U;
        uint8_t bit_rouge = (casier % 4U) * 2U;
        uint8_t bit_vert  = bit_rouge + 1U;
        if (rouges & (1U << casier))
            etats[composant] &= (uint8_t)~(1U << bit_rouge);
        if (vertes & (1U << casier))
            etats[composant] &= (uint8_t)~(1U << bit_vert);
    }

    for (i = 0; i < 4U; i++)
        if (!PCF_Ecrire(adresses_leds[i], etats[i])) ok = 0;
    return ok;
}

/* Lecture brute : 1 = contact ouvert, 0 = contact vers la masse. */
static uint8_t Casiers_Lire(uint16_t *etat)
{
    uint8_t bas, haut;
    if (!PCF_Lire(PCF_REED_0, &bas)) return 0;
    if (!PCF_Lire(PCF_REED_1, &haut)) return 0;
    *etat = (uint16_t)(((uint16_t)haut << 8) | bas);
    return 1;
}

/* ------------------------ UART2 et protocole ------------------------ */
static void UART_Init(void)
{
    uint32_t pclk1;
    uint32_t apb1;
    SystemCoreClockUpdate();
    RCC->APB1ENR |= RCC_APB1ENR_USART2EN;
    GPIO_InitPin(GPIOA, 2, GPIO_AF_PP_2MHZ, GPIO_HIGH); /* TX */
    GPIO_InitPin(GPIOA, 3, GPIO_INPUT_FLOATING, GPIO_HIGH); /* RX */

    /* Horloge USART2 = PCLK1. APB1 prescaler dans RCC->CFGR[10:8]. */
    apb1 = (RCC->CFGR >> 8) & 7U;
    pclk1 = SystemCoreClock;
    if (apb1 >= 4U) pclk1 >>= (apb1 - 3U);

    USART2->CR1 = 0U;
    USART2->CR2 = 0U; /* un seul bit de stop */
    USART2->CR3 = 0U; /* pas de controle de flux */
    USART2->BRR = (pclk1 + VITESSE_UART / 2U) / VITESSE_UART;
    USART2->CR1 = USART_CR1_UE | USART_CR1_TE | USART_CR1_RE |
                  USART_CR1_RXNEIE; /* 8 donnees, sans parite */
    NVIC_EnableIRQ(USART2_IRQn);
}

/* Reconstruit le bit 7 de l'octet recu depuis l'entete. */
static uint8_t Reception_Reconstituer(uint8_t octet, uint8_t numero)
{
    return (uint8_t)((octet & 0x7FU) |
                     (((entete >> numero) & 1U) << 7));
}

/* Fonction appelee automatiquement a la reception d'un octet. */
void USART2_IRQHandler(void)
{
    uint32_t etat = USART2->SR;
    uint8_t octet;
    uint8_t i;

    if ((etat & (USART_SR_RXNE | USART_SR_ORE | USART_SR_NE |
                 USART_SR_FE | USART_SR_PE)) == 0U) return;
    octet = (uint8_t)USART2->DR; /* lecture SR puis DR : acquitte RXNE/erreurs */

    if (etat & (USART_SR_ORE | USART_SR_NE | USART_SR_FE | USART_SR_PE)) {
        MaeRcp = 0;
        return;
    }

    /* Toute nouvelle entete permet de se resynchroniser. */
    if (octet & 0x80U) {
        if (octet & 0x30U) { MaeRcp = 0; return; }
        entete = octet;
        MaeRcp = (octet & 0x40U) ? 1U : 5U;
        return;
    }

    switch (MaeRcp) {
        case 1: case 2: case 3: case 4:
            octets_recus[MaeRcp - 1U] = Reception_Reconstituer(octet, MaeRcp - 1U);
            if (MaeRcp == 4U) {
                for (i = 0; i < 4U; i++) commande_casiers[i] = octets_recus[i];
                casiers_prets = 1U;
                MaeRcp = 0U;
            } else MaeRcp++;
            break;

        case 5: case 6: case 7: case 8:
            octets_recus[MaeRcp - 5U] = Reception_Reconstituer(octet, MaeRcp - 5U);
            if (MaeRcp == 8U) {
                for (i = 0; i < 4U; i++) commande_zif[i] = octets_recus[i];
                zif_pret = 1U;
                MaeRcp = 0U;
            } else MaeRcp++;
            break;

        default:
            MaeRcp = 0U; /* attente d'une entete */
            break;
    }
}

/* Depose en FIFO une reponse de 3 octets, comme le demande le TP. */
static uint8_t FIFO_AjouterReponse(uint8_t type, uint16_t valeur)
{
    uint8_t fort = (uint8_t)(valeur >> 8);
    uint8_t faible = (uint8_t)valeur;
    uint8_t message[3];
    uint8_t i;

    if (FifoLibre < 3U) return 0;
    message[0] = (uint8_t)(type | ((fort >> 7) & 1U) |
                           (((faible >> 7) & 1U) << 1));
    message[1] = fort & 0x7FU;
    message[2] = faible & 0x7FU;

    for (i = 0; i < 3U; i++) {
        Fifo[IwFifo] = message[i];
        IwFifo = (uint8_t)((IwFifo + 1U) % TAILLE_FIFO);
        FifoLibre--;
    }
    return 1;
}

/* Envoi d'un octet par tour de boucle si le materiel est disponible. */
static void FIFO_Emettre(void)
{
    if (FifoLibre < TAILLE_FIFO && (USART2->SR & USART_SR_TXE)) {
        USART2->DR = Fifo[IrFifo];
        IrFifo = (uint8_t)((IrFifo + 1U) % TAILLE_FIFO);
        FifoLibre++;
    }
}

/* ------------------------ Programme principal ------------------------ */
int main(void)
{
    uint8_t demande_casiers[4];
    uint8_t demande_zif[4];
    uint8_t traiter_casiers;
    uint8_t traiter_zif;
    uint8_t i;
    uint16_t directions;
    uint16_t niveaux;
    uint16_t lecture;

    SystemCoreClockUpdate();
    /* Securite : toutes les pattes ZIF en entree, tirage vers le bas. */
    ZIF_Config(0xFFFFU, 0x0000U);
    I2C_Init();
    pcfs_initialises = Casiers_Initialiser(); /* 1 = six adresses ACK */
    UART_Init();

    while (1) {
        traiter_casiers = 0;
        traiter_zif = 0;

        /* Copie atomique des commandes preparees par l'interruption. */
        __disable_irq();
        if (casiers_prets) {
            for (i = 0; i < 4U; i++) demande_casiers[i] = commande_casiers[i];
            casiers_prets = 0U;
            traiter_casiers = 1U;
        }
        if (zif_pret) {
            for (i = 0; i < 4U; i++) demande_zif[i] = commande_zif[i];
            zif_pret = 0U;
            traiter_zif = 1U;
        }
        __enable_irq();

        if (traiter_casiers) {
            uint16_t vertes = (uint16_t)(((uint16_t)demande_casiers[0] << 8) |
                                          demande_casiers[1]);
            uint16_t rouges = (uint16_t)(((uint16_t)demande_casiers[2] << 8) |
                                          demande_casiers[3]);
            if (Casiers_LEDs(vertes, rouges) && Casiers_Lire(&lecture))
                (void)FIFO_AjouterReponse(0xC0U, lecture);
        }

        if (traiter_zif) {
            directions = (uint16_t)(((uint16_t)demande_zif[0] << 8) |
                                     demande_zif[1]);
            niveaux = (uint16_t)(((uint16_t)demande_zif[2] << 8) |
                                  demande_zif[3]);
            if (ZIF_DirectionsValides(directions)) {
                ZIF_Config(directions, niveaux);
                Attendre_us(20);
                lecture = ZIF_Lire();
                (void)FIFO_AjouterReponse(0x80U, lecture);
            } else {
                ZIF_Config(0xFFFFU, 0x0000U); /* repli securise */
                /* Aucun message d'erreur n'est defini dans l'enonce. */
            }
        }

        FIFO_Emettre();
    }
}
