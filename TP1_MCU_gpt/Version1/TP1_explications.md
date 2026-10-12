# TP1 — Testeur de composants logiques et casiers (STM32F103RB)

## But du TP

Creer le programme C du STM32 pour deux usages :
1. Tester un composant logique serie 4000 branche sur un support ZIF16 en imposant des valeurs, en lisant 16 broches, puis en renvoyant le resultat au logiciel PC (Processing).
2. Commander les LEDs rouges/vertes de 16 casiers et recuperer l'etat de leurs contacts Reed (DIP-switch pendant le TP).

Code ecrit directement avec les registres RCC, GPIO, USART et SysTick deja definis par CMSIS / stm32f10x.h : **sans HAL, LL ni StdPeriph**.

## Fichiers

- `main.c` : implementation du TP avec fonctions courtes.
- `tp_composants_logique.uvprojx` : projet Keil de depart conserve.
- `RTE/Device/STM32F103RB/*` : fichiers de demarrage et configuration d'origine.
- `I2C_materiel_original_NON_UTILISE.txt` : exemple d'origine utilisant I2C1 materiel. Il **n'est pas utilise**, puisque le TP impose le bit banging.

## Le schema logique

```text
Ordinateur (Processing)
        | USB / ST-LINK / USART2 9600 8N1
STM32F103RB
   |-- GPIO PC0..PC7  -> pattes ZIF 1..8
   |-- GPIO PB8..PB15 -> pattes ZIF 9..16
   |-- GPIO PB6/7 -> I2C par logiciel -> 4 PCF8574 LEDs (16 casiers)
   |                               \--> 2 PCF8574 capteurs (16 contacts)
```

## Correspondance des broches

| Fonction | GPIO | Configuration |
|---|---|---|
| TX serie vers ST-LINK | PA2 | fonction alternative push-pull |
| RX serie depuis ST-LINK | PA3 | entree flottante |
| ZIF pattes 1..8 | PC0..PC7 | entree pull-up/pull-down ou sortie |
| ZIF pattes 9..16 | PB8..PB15 | entree pull-up/pull-down ou sortie |
| SCL PCF8574 (choix provisoire) | PB6 | sortie open-drain |
| SDA PCF8574 (choix provisoire) | PB7 | sortie open-drain |

**Important : PB6 et PB7 ne sont PAS imposes par l'enonce.** Ils sont choisis ici pour leur usage adapte a un I2C logiciel ; modifier les `#define` si la maquette est cablee autrement. Prevoir les resistances de tirage au positif sur le bus I2C externe : une sortie open-drain ne peut pas forcer le niveau haut.

## Les 6 PCF8574 — adresses PROVISOIRES

| Adresse I2C (7 bits) | Fonction |
|---|---|
| 0x20 | LEDs casiers 0 a 3 |
| 0x21 | LEDs casiers 4 a 7 |
| 0x22 | LEDs casiers 8 a 11 |
| 0x23 | LEDs casiers 12 a 15 |
| 0x24 | Contact casiers 0 a 7 |
| 0x25 | Contact casiers 8 a 15 |

Le TP ne fournit **pas** les valeurs des adresses A0/A1/A2, ni le schema du montage des casiers. Les valeurs ci-dessus constituent une proposition de cablage, a confirmer avant tout essai (et a modifier dans `main.c` si besoin). Elles supposent des PCF8574 standard, pas des PCF8574A.

Pour les LEDs d'un PCF (4 casiers) :
- bits 0, 2, 4, 6 = LEDs rouges (casiers n, n+1, n+2, n+3) ;
- bits 1, 3, 5, 7 = LEDs vertes ;
- une LED s'allume avec **0** en sortie du PCF8574 (active a l'etat bas).

Pour les contacts, un bit lu a `0` signifie fermeture du contact vers la masse ; `1` signifie ouverture du contact. Cela correspond a l'etat electrique brut ; l'interpretation physique « casier ouvert » / « casier ferme » depend de la position de l'aimant et du Reed.

## Organisation du code — fonctions courtes

- `GPIO_InitPin(port, pin, config, etat)` : configure UNE broche en modifiant CRL/CRH ; choisit pull-up ou pull-down avec l'etat du registre ODR.
- `ZIF_Config(directions, niveaux)` : configure les 16 pattes. Bit de direction a 1 = entree, 0 = sortie forte.
- `ZIF_Lire()` : lit l'etat des 16 broches et renvoie un `uint16_t`.
- `ZIF_DirectionsValides(...)` : securite : pas plus de deux sorties fortes.
- `I2C_Start`, `I2C_Stop`, `I2C_EcrireBit`, `I2C_LireBit`, `I2C_EcrireOctet`, `I2C_LireOctet` : bus I2C emule avec GPIO.
- `PCF_Ecrire`, `PCF_Lire` : echange un octet avec une adresse I2C.
- `Casiers_LEDs` : transforme 2 masques de 16 bits en 4 octets de sorties actives a 0.
- `Casiers_Lire` : lit 16 contacts via 2 PCF.
- `UART_Init` : 9600 bauds, 8 bits, 1 stop, aucune parite, sans controle de flux.
- `USART2_IRQHandler` : reconstruit les messages de 5 octets avec une machine a etats ; re-synchronisation sur une entete.
- `FIFO_AjouterReponse` : insere les trois octets de reponse (FIFO 16 octets).
- `FIFO_Emettre` : ecrit un octet quand TXE est positionne.
- `main` : initialise, traite les commandes recues, et emet les reponses.

## Format des messages (consigne page 2-3 et page 5)

**PC -> STM32 : 5 octets**
- entete : base `0x80` (ZIF) ou `0xC0` (casiers) ; les bits 0..3 contiennent le bit 7 de chacun des quatre octets utiles ; seul cet octet a bit 7 = 1 ;
- quatre octets utiles : chacun est envoye avec son bit 7 efface.

**ZIF** : les 4 octets complets sont `directions PB8..15`, `directions PC0..7`, `niveaux PB8..15`, `niveaux PC0..7`.

**Casiers** : les 4 octets complets sont `vert PB8..15`, `vert PC0..7`, `rouge PB8..15`, `rouge PC0..7`. Les references aux ports ici concernent le **numero des bits logiques**, pas le pilotage physique des LEDs ; celles-ci sont sur les PCF8574.

**STM32 -> PC : 3 octets**
- entete : `0x80` (ZIF) ou `0xC0` (casiers) avec les 2 bits hauts transferes dans les bits 0 et 1 ;
- octet fort sur 7 bits ;
- octet faible sur 7 bits.

### Exemple 1 : mettre toutes les broches ZIF en entree pull-down

- `directions = 0xFFFF` (16 entrees) ; `niveaux = 0x0000` (pull-down partout).
- L'ordinateur doit envoyer **`83 7F 7F 00 00`** en hexadecimal.
- Si toutes les broches sont lues a 1, la reponse sera **`83 7F 7F`**. En pratique avec pull-down et rien qui pilote ces lignes, on attend plutot un etat bas.

### Exemple 2 : allumer seulement la LED verte du casier 0

- `vert = 0x0001` et `rouge = 0x0000`.
- Envoyer **`C0 00 01 00 00`**.
- Pour le montage d'adresses propose, le PCF 0x20 recevra la valeur `0xFD` (bit 1 a 0 pour allumer la LED verte du premier casier).

## Pourquoi 0xFFFF au demarrage ?

`ZIF_Config(0xFFFF, 0x0000)` :
- `0xFFFF` = 16 **entrees**, pas de sorties fortes (aucun risque de forcer une alimentation a cet instant) ;
- `0x0000` = pull-down sur les 16 broches. L'etat est defini, sans tension forte imposee par une sortie.

Ne pas inserer ni retirer un circuit tant que des sorties fortes sont appliquees au ZIF. Les niveaux électriques et l'alimentation doivent etre compatibles avec le composant teste et le montage de protection : le TP ne donne pas de schema de protection detaillle.

## Comment lancer dans Keil

1. Decompresser le ZIP.
2. Ouvrir `tp_composants_logique.uvprojx` dans Keil uVision.
3. Verifier que les packs CMSIS et `STM32F1xx_DFP` sont installes (le projet original fait reference a leur presence).
4. Verifier le fichier `main.c` dans Source Group 1.
5. `Project > Build Target`, puis charger le code avec ST-LINK.
6. Brancher la maquette ZIF/casiers, puis utiliser un terminal serie ou Processing sur le port COM virtuel : **9600, 8N1**.
7. Ne pas tester l'alimentation du ZIF avec un composant inconnu avant d'avoir valide le cablage.

## Ordre de validation conseille

1. Tester `GPIO_InitPin` seule en debugger (CRL, CRH, BSRR, BRR, ODR).
2. Verifier que les 16 GPIO du ZIF sont en entree au demarrage.
3. Tester le bus I2C en regardant SCL/SDA a l'oscilloscope ; verifier adresses et ACK (la variable `pcfs_initialises` doit valoir 1 si les six PCF repondent).
4. Envoyer une consigne LED et verifier l'etat des 4 PCF de sorties.
5. Lire des DIP-switchs et verifier les 16 bits des capteurs.
6. Tester uniquement la liaison USART2 : temporairement envoyer 0x55 en boucle ; verifier environ 104 microsecondes par bit et le caractere ASCII `U` (comme demande page 5). **Retirer ce test** avant les trames binaires.
7. Tester les deux exemples de trames puis la reception des resultats ; insister sur une perte d'octet et une nouvelle entete pour verifier la resynchronisation.
8. Faire des tests de fonctions logiques en variant les tirages faibles H/L sur les broches d'entree du circuit, avec les deux broches d'alimentation choisies correctement.

## Limites importantes

- **Cablage non fourni** : la configuration des adresses PCF et PB6/PB7 est une proposition ; le vrai schema de la carte de casiers n'est pas dans les documents.
- **Securite** : par prudence le programme n'accepte pas plus de deux GPIO du ZIF en sortie forte. Un etat invalide remet les 16 pattes en entree sans reponse d'erreur, car aucune trame d'erreur n'est prevue dans le sujet.
- **Erreur de bus PCF** : en cas de NACK, la requete ne produit pas de reponse casier ; l'enonce ne definit pas de code erreur.
- **Reception serie** : un seul message en attente de traitement pour chaque type. Si le PC envoie plusieurs trames du meme type sans attendre les reponses, des commandes peuvent etre ecrasees ; espacer les commandes est conseille pour ce premier TP.
- **Debits I2C et temporisations** : la temporisation utilise SysTick et doit etre verifiee sur oscilloscope, comme les autres signaux.
- **Horloge carte** : le `system_stm32f10x.c` original demande 72 MHz par HSE/PLL ; les configurations de l'oscillateur varient selon la revision Nucleo. `SystemCoreClockUpdate()` ajuste le calcul de la liaison serie a l'horloge constatee.
- **Incoherence du sujet** : la premiere page annonce 16 casiers mais cite 18 references de composants. Le programme suit l'objectif de 16 casiers et le protocole 16 bits du TP.
- Le document d'errata joint cible les variantes STM32F103xC/D/E et ne suffit donc pas a etablir des errata propres au STM32F103RB (xB).

## Validation realisee

Compilation syntaxique/test unitaire du `main.c` avec une imitation locale des definitions CMSIS (GCC sur ordinateur) : fonctions GPIO, contraintes ZIF, reception de deux trames, resynchronisation et FIFO testes. **Pas de compilation Keil ARM ni d'essai sur Nucleo reelle possibles ici** ; verifier le resultat en classe sur le materiel.
