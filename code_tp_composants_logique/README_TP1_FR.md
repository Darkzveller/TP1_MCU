# TP1 — Testeur de composants logiques et casiers (STM32F103RB)

## But du TP

Creer le programme C du STM32 pour deux usages :
1. Tester un composant logique serie 4000 branche sur un support ZIF16 en imposant des valeurs, en lisant 16 broches, puis en renvoyant le resultat au logiciel PC (Processing).
2. Commander **6 LED bicolores rouge/vert** (3 par PCF8574), tout en conservant la lecture de **16 capteurs Reed** (hypothese inchangee : confirmer le nombre de capteurs effectivement cables).

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
   |-- GPIO PB6/7 -> I2C par logiciel -> 2 PCF8574 LEDs (6 LED RV)
   |                               \--> 2 PCF8574 capteurs (16 contacts, si cables)
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

## Les 4 PCF8574 — adresses PROVISOIRES

| Adresse I2C (7 bits) | Fonction |
|---|---|
| 0x20 | 3 LED RV numeros 1, 2 et 3 |
| 0x21 | 3 LED RV numeros 4, 5 et 6 |
| 0x24 | Contact casiers 0 a 7 |
| 0x25 | Contact casiers 8 a 15 |

Le TP ne fournit **pas** les valeurs des adresses A0/A1/A2, ni le schema du montage des casiers. Les valeurs ci-dessus constituent une proposition de cablage, a confirmer avant tout essai (et a modifier dans `main.c` si besoin). Elles supposent des PCF8574 standard, pas des PCF8574A.

Pour les 3 LED RV de chaque PCF :

| Broche PCF | Fonction |
|---|---|
| P0 | rouge LED n°1 (ou n°4 sur le second PCF) |
| P1 | vert LED n°1 (ou n°4) |
| P2 | rouge LED n°2 (ou n°5) |
| P3 | vert LED n°2 (ou n°5) |
| P4 | rouge LED n°3 (ou n°6) |
| P5 | vert LED n°3 (ou n°6) |
| P6 / P7 | non utilisees : maintenues a 1 |

Une sortie a **0** allume la couleur correspondante (LED active a l'etat bas), a condition que le cablage et les resistances de limitation soient adaptes. Un `1` l'eteint.

Le protocole serie du TP conserve deux masques de **16 bits** pour les LED, mais seuls **les bits 0 a 5** sont utilises pour les 6 LED installees. Les autres bits sont ignores par le programme.

Le code garde la lecture des **16 capteurs de casiers**, via les PCF `0x24` et `0x25`. Si votre maquette ne comporte que 6 capteurs, il faudra egalement adapter cette partie.

Pour les contacts, un bit lu a `0` signifie fermeture du contact vers la masse ; `1` signifie ouverture du contact. Cela correspond a l'etat electrique brut ; l'interpretation physique « casier ouvert » / « casier ferme » depend de la position de l'aimant et du Reed.

## Organisation du code — fonctions courtes

- `GPIO_InitPin(port, pin, config, etat)` : configure UNE broche en modifiant CRL/CRH ; choisit pull-up ou pull-down avec l'etat du registre ODR.
- `ZIF_Config(directions, niveaux)` : configure les 16 pattes. Bit de direction a 1 = entree, 0 = sortie forte.
- `ZIF_Lire()` : lit l'etat des 16 broches et renvoie un `uint16_t`.
- `ZIF_DirectionsValides(...)` : securite : pas plus de deux sorties fortes.
- `I2C_Start`, `I2C_Stop`, `I2C_EcrireBit`, `I2C_LireBit`, `I2C_EcrireOctet`, `I2C_LireOctet` : bus I2C emule avec GPIO.
- `PCF_Ecrire`, `PCF_Lire` : echange un octet avec une adresse I2C.
- `LEDs_CalculerOctet` : calcule un octet pour 3 LED RV (6 sorties utilisees, 2 bits libres).
- `Casiers_LEDs` : transforme les deux masques de 16 bits en 2 octets, envoyes aux 2 PCF de LEDs.
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
- Le PCF 0x20 recoit `0xFD` (bit P1 a 0 pour allumer la LED verte n°1) ; le PCF 0x21 recoit `0xFF` (toutes les autres couleurs eteintes).

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
3. Tester le bus I2C en regardant SCL/SDA a l'oscilloscope ; verifier adresses et ACK (la variable `pcfs_initialises` doit valoir 1 si les quatre PCF supposes repondent).
4. Envoyer une consigne LED et verifier l'etat des 2 PCF de sorties (3 LED RV chacun).
5. Lire des DIP-switchs et verifier les 16 bits des capteurs.
6. Tester uniquement la liaison USART2 : temporairement envoyer 0x55 en boucle ; verifier environ 104 microsecondes par bit et le caractere ASCII `U` (comme demande page 5). **Retirer ce test** avant les trames binaires.
7. Tester les deux exemples de trames puis la reception des resultats ; insister sur une perte d'octet et une nouvelle entete pour verifier la resynchronisation.
8. Faire des tests de fonctions logiques en variant les tirages faibles H/L sur les broches d'entree du circuit, avec les deux broches d'alimentation choisies correctement.

## Limites importantes

- **Cablage non fourni** : 6 LED RV confirmees par l'utilisateur ; les 16 capteurs du TP restent une hypothese de projet.
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
