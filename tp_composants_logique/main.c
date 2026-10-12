#include "stm32f10x.h"
#include <stdint.h>

typedef enum
{
    GPIO_INPUT_ANALOG = 0x0,
    GPIO_OUTPUT_PP_10MHZ = 0x1,
    GPIO_OUTPUT_PP_2MHZ = 0x2,
    GPIO_OUTPUT_PP_50MHZ = 0x3,

    GPIO_INPUT_FLOATING = 0x4,
    GPIO_OUTPUT_OD_10MHZ = 0x5,
    GPIO_OUTPUT_OD_2MHZ = 0x6,
    GPIO_OUTPUT_OD_50MHZ = 0x7,

    GPIO_INPUT_PULL = 0x8,

    GPIO_AF_PP_10MHZ = 0x9,
    GPIO_AF_PP_2MHZ = 0xA,
    GPIO_AF_PP_50MHZ = 0xB,

    GPIO_AF_OD_10MHZ = 0xD,
    GPIO_AF_OD_2MHZ = 0xE,
    GPIO_AF_OD_50MHZ = 0xF

} GPIO_Config_t;

typedef enum
{
    GPIO_LOW = 0,
    GPIO_HIGH = 1

} GPIO_State_t;

void GPIO_InitPin(GPIO_TypeDef *GPIOx, uint8_t pin, GPIO_Config_t config, GPIO_State_t defaultState)
{
    uint32_t shift;

    if (pin > 15)
        return;

    /* ==========================
       Activation horloge GPIO
       ========================== */

    if (GPIOx == GPIOA)
    {
        RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;
    }
    else if (GPIOx == GPIOB)
    {
        RCC->APB2ENR |= RCC_APB2ENR_IOPBEN;
    }
    else if (GPIOx == GPIOC)
    {
        RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;
    }
    else if (GPIOx == GPIOD)
    {
        RCC->APB2ENR |= RCC_APB2ENR_IOPDEN;
    }
    else
    {
        return;
    }

    /* ==========================
       Etat par d�faut
       ========================== */

    if (defaultState == GPIO_HIGH)
    {
        GPIOx->BSRR = (1U << pin);
    }
    else
    {
        GPIOx->BRR = (1U << pin);
    }

    /* ==========================
       Configuration
       ========================== */

    if (pin < 8)
    {
        shift = pin * 4;

        GPIOx->CRL &= ~(0xFU << shift);
        GPIOx->CRL |= ((uint32_t)config << shift);
    }
    else
    {
        shift = (pin - 8) * 4;

        GPIOx->CRH &= ~(0xFU << shift);
        GPIOx->CRH |= ((uint32_t)config << shift);
    }
}

void delay_ms(uint32_t ms)
{
    uint32_t ticks;

    /*
     * Nombre de cycles nécessaires pour 1 ms.
     * SystemCoreClock contient la fréquence du processeur.
     */
    ticks = SystemCoreClock / 1000U;

    /*
     * SysTick est un compteur 24 bits.
     * LOAD contient la valeur de départ.
     */
    SysTick->LOAD = ticks - 1U;

    /*
     * Remise à zéro du compteur.
     */
    SysTick->VAL = 0U;

    /*
     * CLKSOURCE = 1 : horloge processeur
     * ENABLE    = 1 : active SysTick
     * TICKINT   = 0 : aucune interruption
     */
    SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk |
                    SysTick_CTRL_ENABLE_Msk;

    while (ms > 0U)
    {
        /*
         * COUNTFLAG passe à 1 lorsque SysTick
         * atteint zéro.
         */
        if (SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk)
        {
            ms--;
        }
    }

    /*
     * Arrêt de SysTick
     */
    SysTick->CTRL = 0U;
}


int main(void)
{
    GPIO_InitPin(GPIOA, 5, GPIO_OUTPUT_PP_50MHZ, GPIO_LOW);

    while (1)
    {
			static int time = 5000;
        GPIOA->BSRR = (1U << 5);
        delay_ms(time);

        GPIOA->BRR = (1U << 5);
        delay_ms(time);
    }
}
