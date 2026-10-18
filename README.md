# TP1 MCU — Gestion de casiers et testeur de composants logiques avec le STM32F103RB

**Polytech Sorbonne — Électronique et Informatique — S7 — Microcontrôleur 2**  
**Année universitaire : 2026-2027**  
**Enseignant : Francis BRAS**  
**Auteur : Youssef EL KATTOUFI**

## 1. Présentation du TP

Dans ce TP, le but était de réaliser une partie d'un système de rangement pour les composants logiques de la série 4000. L'idée était de pouvoir repérer les casiers avec des LED bicolores, lire les contacts qui simulent leur ouverture ou leur fermeture, puis tester les broches d'un composant avec un support ZIF16.

Pour la maquette, j'ai travaillé avec une carte **NUCLEO STM32-F103RB**, **six LED bicolores rouge/vert**, **trois PCF8574** et des **DIP-switchs**. Deux PCF8574 servent à commander les LED, tandis que le troisième lit les huit entrées correspondant aux interrupteurs. Le sujet prévoit seize casiers, mais je n'ai pas câblé les seize sur la maquette : le programme et Processing conservent néanmoins des mots de 16 bits pour rester compatibles avec le protocole demandé.

J'ai développé le programme C avec **Visual Studio Code**, puis utilisé **Keil µVision** pour compiler et téléverser le programme sur le STM32. Pour suivre ce qui circulait sur les fils, j'ai utilisé un **analyseur logique avec PulseView**, ainsi que **Processing** pour envoyer les commandes et afficher les réponses.

J'ai fait les essais progressivement : configuration des GPIO, réalisation de l'I²C en logiciel, commande des LED, lecture des DIP-switchs, gestion du ZIF16, puis communication UART avec Processing. Le but n'était pas juste d'obtenir des valeurs à l'écran, mais aussi de comprendre comment elles étaient envoyées, traitées et renvoyées.

## 2. Fonctionnement général

Le STM32 assure le lien entre le PC, les circuits d'entrées/sorties et le support ZIF16.

```text
                   Ordinateur — Processing
                (interface casiers et ZIF16)
                            │
                       UART / USART2
                       9600 bauds, 8N1
                            │
                      PA2 TX / PA3 RX
                            │
                   NUCLEO STM32F103RB
                    /               \
          I²C logiciel              GPIO directs
          PB6 SCL / PB7 SDA          PC0..PC7 / PB8..PB15
                 │                         │
          ┌──────┼──────┐                  ▼
          │      │      │                ZIF16
         0x20   0x21   0x23         16 pattes configurables
          │      │      │
       3 LED   3 LED   DIP-switchs
       rouge/  rouge/  (8 entrées)
        vert    vert
```

Le bus **I²C est programmé à la main**, en *bit banging*. Le STM32 agit directement sur SCL et SDA au lieu d'utiliser le périphérique I²C matériel. Les trois PCF8574 sont branchés sur les mêmes lignes, mais chacun possède une adresse différente.

L'analyseur logique est branché **en parallèle sur les fils à observer** : SCL/SDA pour l'I²C et les lignes UART pour les commandes et les réponses. Cela m'a permis de comparer les octets vus dans PulseView avec ceux que le code était censé transmettre.

## 3. Matériel et logiciels utilisés

### 3.1. Matériel

| Matériel | Rôle |
| --- | --- |
| **NUCLEO STM32-F103RB** | Contrôleur principal du montage. |
| **Deux PCF8574 pour les LED** | Trois LED bicolores par circuit. |
| **Un PCF8574 pour les contacts** | Lecture des huit entrées DIP-switchs. |
| **Six LED rouge/vert** | Visualisation des états demandés pour les casiers câblés. |
| **Deux blocs DIP-switchs** | Simulation de l'ouverture/fermeture des casiers. |
| **Support ZIF16** | Mise en entrée/sortie et lecture de 16 pattes. |
| **Plaque Labdec, fils et résistances** | Réalisation du câblage et rappel des lignes I²C. |
| **Analyseur logique** | Observation et décodage des trames I²C et UART. |

J'ai aussi commencé le câblage du TP2 sur la même plaque pendant que je travaillais sur le TP1. Certaines photos du montage peuvent donc montrer des fils ou des éléments de l'autre TP : ils ne participent pas forcément au fonctionnement des casiers ou du ZIF16.

### 3.2. Logiciels

| Logiciel | Ce que j'en ai fait |
| --- | --- |
| **Visual Studio Code** | Écriture et modification du fichier `main.c`. |
| **Keil µVision 5** | Compilation, débogage et téléversement sur le STM32. |
| **Processing** | Interface graphique `casiers.pde` : commandes et états. |
| **PulseView** | Enregistrement et décodage des signaux I²C et UART. |
| **Git** | Conservation des versions du projet et publication des sources. |

## 4. Organisation et arborescence du projet

### 4.1. Emplacement du TP sur mon ordinateur

Le projet est rangé dans l'arborescence de mes cours :

```text
H:\Mon Drive\2026-2027_polytech_sorbonne\S7\UE_Informatique\Micro_controleur2\TP_1
```

Le chemin correspond à mon poste Windows et à mon dossier synchronisé. Il n'est pas nécessaire de disposer du même lecteur `H:` pour exécuter le projet sur un autre ordinateur.

### 4.2. Arborescence principale

Voici l'organisation des fichiers **présents dans l'archive `TP_1.zip`**. J'ai regroupé les fichiers techniques générés automatiquement par Keil pour que le schéma reste lisible ; leur rôle est détaillé ensuite.

```text
TP_1/
│
├── tp_composants_logique/                   # Programme C et projet Keil
│   ├── main.c                               # Code STM32 : GPIO, I²C, PCF, ZIF, UART
│   ├── tp_composants_logique.uvprojx         # Projet Keil à ouvrir
│   ├── tp_composants_logique.uvoptx          # Options de session Keil
│   ├── tp_composants_logique.uvguix.elkat   # Paramètres d'interface Keil utilisateur
│   ├── README_TP1_FR.md                     # Ancien README, à ne pas prendre comme référence finale
│   ├── I2C_materiel_original_NON_UTILISE.txt # Exemple matériel I²C non utilisé
│   ├── Tuto_initialisation.pdf              # Tutoriel d'initialisation
│   ├── EventRecorderStub.scvd               # Fichier de description pour Keil
│   ├── caca.txt                             # Fichier texte annexe (utilité non documentée)
│   ├── DebugConfig/                         # Configuration du débogueur
│   │   └── Target_1_STM32F103RB_1.0.0.dbgconf
│   ├── RTE/                                 # Environnement et fichiers de démarrage STM32
│   │   ├── _Target_1/
│   │   │   └── RTE_Components.h
│   │   └── Device/STM32F103RB/
│   │       ├── RTE_Device.h
│   │       ├── startup_stm32f10x_md.s
│   │       └── system_stm32f10x.c
│   ├── Objects/                             # Fichiers générés par la compilation
│   │   ├── projet_keil_neuf.axf             # Exécutable ARM avec informations de débogage
│   │   ├── projet_keil_neuf.build_log.htm   # Journal de compilation Keil
│   │   ├── main.o, system_stm32f10x.o ...   # Fichiers objets et dépendances
│   │   └── autres fichiers générés
│   └── Listings/                            # Fichiers intermédiaires et carte mémoire
│       ├── main.i
│       ├── system_stm32f10x.i
│       └── projet_keil_neuf.map
│
├── Session_pulse_view/                      # Sessions enregistrées avec PulseView
│   ├── I2C/
│   │   ├── IDC.pvs                          # Configuration de session PulseView
│   │   └── IDC.sr                           # Acquisition enregistrée
│   └── UART/
│       ├── UART.pvs                         # Configuration de session PulseView
│       ├── UART.sr                          # Acquisition enregistrée
│       ├── Photo_preuve.jpg                 # Capture ou photo de preuve
│       ├── UART_chrono.kdt                  # Fichier lié aux relevés UART
│       ├── UART_digital.txt                 # Export texte de données UART
│       ├── UART_hexa.txt                    # Export texte de données UART
│       └── UART_Micro.wav                   # Fichier audio présent dans les ressources
│
├── casiers.pde                              # Code source de l'interface Processing
├── sketch.properties                       # Paramètres du sketch Processing
├── TP1.pdf                                  # Énoncé du TP1
├── RAPPORT_TP1_MCU2.docx                    # Compte rendu Word présent dans l'archive
├── Rapport_TP1_gpt.docx                     # Autre version de travail du compte rendu
├── Dessin_rapport.pptx                      # Présentation / dessins utilisés pour le rapport
├── Organiseur_électronique_intelligent_en_atelier.png
│                                            # Illustration du principe d'organiseur
├── pcf8574.pdf                              # Documentation des PCF8574
├── Tutoriel_USART.pdf                       # Tutoriel sur la communication série
├── Nucleo_Schematic.pdf - Raccourci.lnk     # Raccourci vers le schéma NUCLEO
├── User manuel UM1724 NUCLEO-F103RB.pdf - Raccourci.lnk
│                                            # Raccourci vers le manuel de la carte
├── RESUME_STM32F103xx.pdf - Raccourci.lnk   # Raccourci vers le résumé STM32
├── stm32f103xx_UM.pdf - Raccourci.lnk       # Raccourci vers le manuel STM32
├── stm32f103errata.pdf - Raccourci.lnk      # Raccourci vers les errata STM32
├── TP_1_micro_controleur2.gsheet           # Raccourci Google Sheets
├── git_push.bat                             # Script local de mise à jour Git
└── .gitignore                               # Exclusions Git
```

Les fichiers `desktop.ini` et ceux commençant par `~$` sont des éléments temporaires ou liés à Windows/Office. Ils ne servent pas au fonctionnement du TP. Les fichiers `.lnk` sont des **raccourcis Windows** : ils ne contiennent pas les PDF eux-mêmes. De la même manière, le fichier `.gsheet` n'est pas une copie autonome d'un tableau Google Sheets.

**À noter :** le rapport PDF le plus récent, les nouvelles captures envoyées séparément dans la conversation et ce README ne figuraient pas nécessairement dans l'archive `TP_1.zip` d'origine. Il faut les ajouter dans le dossier local si je veux qu'ils apparaissent sur le dépôt Git.

### 4.3. Dans quel dossier faut-il travailler ?

- Pour modifier le **programme du STM32**, j'ouvre `tp_composants_logique/main.c`.
- Pour compiler et téléverser, j'ouvre `tp_composants_logique/tp_composants_logique.uvprojx` dans Keil.
- Pour modifier l'interface, j'ouvre le sketch `casiers.pde` dans Processing.
- Pour retrouver les mesures, j'ouvre les sessions du dossier `Session_pulse_view` dans PulseView.
- Pour consulter l'analyse complète, je me reporte au compte rendu `RAPPORT_TP1_MCU2` et à ses figures.

L'ancien fichier `tp_composants_logique/README_TP1_FR.md` décrit un câblage provisoire avec **quatre PCF8574** et des adresses qui ne correspondent plus au programme final. C'est **le présent README** et le code `main.c` qui servent de référence pour la maquette décrite ici.

## 5. Bilan des entrées/sorties et câblage

### 5.1. Broches du STM32

| Fonction | Broche | Mode utilisé dans le code | Rôle |
| --- | --- | --- | --- |
| I²C SCL | **PB6** | Sortie open-drain, 2 MHz | Horloge logicielle des PCF8574. |
| I²C SDA | **PB7** | Sortie open-drain, 2 MHz | Données I²C dans les deux sens. |
| USART2 TX | **PA2** | Fonction alternative push-pull, 2 MHz | Réponses STM32 vers PC. |
| USART2 RX | **PA3** | Entrée flottante | Commandes envoyées par Processing. |
| ZIF16 pattes 1 à 8 | **PC0 à PC7** | Entrées avec pull-up/down ou sorties push-pull | Testeur ZIF16. |
| ZIF16 pattes 9 à 16 | **PB8 à PB15** | Entrées avec pull-up/down ou sorties push-pull | Testeur ZIF16. |

Au total, cela représente **20 GPIO** : deux pour l'I²C, deux pour la communication série et seize pour le ZIF16. Les LED et les DIP-switchs passent par les PCF8574 : ils n'occupent donc pas directement d'autres broches du STM32.

Les deux lignes I²C doivent disposer de résistances de rappel au niveau haut. Une sortie open-drain peut forcer un 0, mais elle ne force pas directement un 1 : lorsqu'elle est relâchée, c'est le rappel qui ramène la ligne au niveau haut.

### 5.2. Adresses et utilisation des PCF8574

| Nom dans `main.c` | Adresse I²C (7 bits) | Utilisation |
| --- | --- | --- |
| `PCF_LED_0` | **0x20** | LED 1, 2 et 3. |
| `PCF_LED_1` | **0x21** | LED 4, 5 et 6. |
| `PCF_REED_0` | **0x23** | Lecture des entrées P0 à P7 du bloc DIP-switchs. |

Les trois adresses sont définies dans `main.c` par des expressions. Certains commentaires juste à côté des `#define` indiquent encore d'anciennes adresses ; ce sont bien les **valeurs calculées** `0x20`, `0x21` et `0x23` qu'il faut retenir. Je les retrouve dans les décodages I²C de PulseView.

Sur chaque PCF utilisé pour les LED, la correspondance est la même :

| Broche du PCF | Fonction |
| --- | --- |
| P0 | Rouge LED 1 (ou LED 4 pour le deuxième PCF). |
| P1 | Vert LED 1 (ou LED 4). |
| P2 | Rouge LED 2 (ou LED 5). |
| P3 | Vert LED 2 (ou LED 5). |
| P4 | Rouge LED 3 (ou LED 6). |
| P5 | Vert LED 3 (ou LED 6). |
| P6 et P7 | Non utilisées dans cette commande ; maintenues à 1. |

Les LED ont une **anode commune** et les sorties sont **actives à 0** : une couleur est allumée lorsque la sortie correspondante passe au niveau bas.

### 5.3. Lecture des DIP-switchs

Pour le PCF de lecture, j'ai utilisé les entrées suivantes :

| Entrée PCF | Interrupteur / usage |
| --- | --- |
| P0, P1, P2 | Trois contacts du premier bloc DIP-switchs, associés aux LED 1 à 3 dans le mode de test local. |
| P3 | Entrée lue, mais non exploitée dans `Maj_LEDs_Casiers()`. |
| P4, P5, P6 | Trois contacts du deuxième bloc DIP-switchs, associés aux LED 4 à 6 dans le mode de test local. |
| P7 | Entrée lue, mais non exploitée dans `Maj_LEDs_Casiers()`. |

Au départ, j'avais relié les interrupteurs au niveau haut et les lectures restaient à `0xFF`. J'ai ensuite modifié le câblage pour que les contacts se ferment vers la masse. Il faut d'abord écrire `0xFF` dans le PCF de lecture pour relâcher les huit lignes. Ensuite, **contact ouvert = 1** et **contact fermé vers la masse = 0**.

La lecture est renvoyée sous forme d'un mot de 16 bits, mais dans cette maquette seul l'**octet faible** provient d'un PCF de capteurs. L'octet fort vaut 0 parce qu'il n'y a pas de second PCF de lecture.

### 5.4. ZIF16 et état initial

Le support ZIF16 est relié directement aux GPIO, sans passer par les PCF8574. Le bit `0` du mot représente la **patte 1**, et le bit `15` la **patte 16**.

Le programme initialise ce support avec :

```c
ZIF_Config(0xFFFFU, 0x0000U);
```

- Un bit à **1** dans `directions` signifie **entrée** ; un bit à **0** signifie **sortie forte**.
- Pour une **entrée**, le bit correspondant de `niveaux` choisit un rappel faible **H** (1) ou **L** (0).
- Pour une **sortie**, le bit de `niveaux` impose le niveau **1** ou **0**.

Au démarrage, les seize pattes sont donc en entrée avec rappel vers le bas. Le programme limite aussi le nombre de sorties fortes à **deux au maximum**, en utilisant `ZIF_DirectionsValides()`.

## 6. Explication du programme C

### 6.1. Principe général

J'ai séparé le programme en plusieurs petites fonctions pour pouvoir vérifier chaque partie sans tout mélanger. Le programme travaille directement avec les registres du STM32 via CMSIS : il n'utilise pas HAL ou LL pour gérer les GPIO, l'USART ou le bus I²C.

Le code actif commence par configurer les GPIO du ZIF16, initialiser l'I²C et les PCF, préparer l'USART2, puis réaliser un test de démarrage des LED. Il entre ensuite dans un `while(1)` qui traite les commandes reçues et prépare les réponses.

### 6.2. Les 28 fonctions présentes dans `main.c`

J'ai repris **toutes les fonctions déclarées dans le fichier C**. Cela permet de retrouver leur rôle sans recopier les 649 lignes du programme.

| N° | Fonction | Rôle |
| ---: | --- | --- |
| 1 | `GPIO_InitPin()` | Configure une broche avec les registres CRL/CRH et son état demandé. |
| 2 | `GPIO_Ecrire()` | Force ou relâche un niveau sur une broche en utilisant BSRR/BRR. |
| 3 | `delay_us()` | Temporisation en microsecondes à partir de SysTick. |
| 4 | `delay_ms()` | Temporisation en millisecondes en répétant `delay_us()`. |
| 5 | `ZIF_Config()` | Configure les 16 pattes du ZIF en entrée ou en sortie. |
| 6 | `ZIF_Lire()` | Lit GPIOC/GPIOB et recompose les 16 états. |
| 7 | `ZIF_DirectionsValides()` | Refuse plus de deux sorties fortes. |
| 8 | `I2C_Init()` | Configure PB6 et PB7 en sorties open-drain. |
| 9 | `I2C_Start()` | Génère la condition START. |
| 10 | `I2C_Stop()` | Génère la condition STOP. |
| 11 | `I2C_EcrireBit()` | Émet un bit sur SDA, cadencé par SCL. |
| 12 | `I2C_LireBit()` | Lit un bit sur SDA après l'avoir relâchée. |
| 13 | `I2C_EcrireOctet()` | Transmet huit bits et vérifie l'ACK. |
| 14 | `I2C_LireOctet()` | Lit huit bits et envoie NACK en fin de lecture. |
| 15 | `PCF_Ecrire()` | Envoie un octet à un PCF8574 d'adresse donnée. |
| 16 | `PCF_Lire()` | Lit l'octet présent sur les entrées d'un PCF8574. |
| 17 | `Casiers_Initialiser()` | Éteint les LED et prépare les entrées du PCF des contacts. |
| 18 | `LEDs_CalculerOctet()` | Transforme les masques rouge/vert en octet actif à 0 pour un PCF. |
| 19 | `Casiers_LEDs()` | Met à jour les deux PCF de commande des LED. |
| 20 | `Casiers_Lire()` | Lit les DIP-switchs et renvoie leur état sur 16 bits. |
| 21 | `UART_Init()` | Configure USART2 en 9600 bauds, 8N1, avec réception par interruption. |
| 22 | `Reception_Reconstituer()` | Restaure le bit 7 des octets de données depuis l'en-tête UART. |
| 23 | `USART2_IRQHandler()` | Reçoit les octets et reconstruit les commandes casiers/ZIF. |
| 24 | `FIFO_AjouterReponse()` | Dépose une réponse de trois octets dans la FIFO UART. |
| 25 | `FIFO_Emettre()` | Transmet l'octet suivant quand l'USART est prête. |
| 26 | `Allumer_Toutes_LEDs()` | Séquence de test des couleurs au démarrage. |
| 27 | `Maj_LEDs_Casiers()` | Mode de test local : lit les contacts et commande les LED. |
| 28 | `main()` | Initialise le montage et traite les commandes dans la boucle principale. |

### 6.3. La séquence d'allumage au démarrage

Juste avant le `while(1)`, le code actif appelle :

```c
Allumer_Toutes_LEDs(1);
```

Cette fonction écrit les mêmes valeurs sur les deux PCF des LED, avec environ **une seconde entre chaque état** :

| Octet écrit | Résultat attendu |
| --- | --- |
| `0xFF` | Toutes les LED éteintes. |
| `0xAA` | Les six LED rouges allumées. |
| `0x55` | Les six LED vertes allumées. |

J'ai utilisé cette séquence pour vérifier rapidement le câblage et la réponse des deux PCF8574. Elle ne remplace pas les commandes normales reçues depuis Processing.

### 6.4. La fonction de test local `Maj_LEDs_Casiers()`

Cette fonction a servi à tester les DIP-switchs **sans ordinateur** : elle lit `PCF_REED_0`, puis décide de la couleur des LED en fonction des bits P0–P2 et P4–P6. Un bit à 1 commande la couleur rouge et un bit à 0 commande la couleur verte.

**Attention :** dans la version de `main.c` fournie, cette fonction est bien définie, mais son appel apparaît **uniquement dans une ancienne boucle `main()` commentée**. Elle ne s'exécute pas automatiquement dans le `while(1)` actuellement compilé. Après la séquence de démarrage, les LED sont commandées normalement à partir des trames UART envoyées par Processing.

### 6.5. La boucle `main()` active

Son fonctionnement est le suivant :

1. Mise des 16 pattes ZIF en entrée avec rappel bas.
2. Initialisation de l'I²C, des trois PCF et de l'USART2.
3. Test de démarrage des LED avec `Allumer_Toutes_LEDs(1)`.
4. Attente des commandes préparées par l'interruption UART.
5. Si commande **casiers** : conversion des masques rouge/vert, écriture I²C, lecture des DIP-switchs et mise en file de la réponse.
6. Si commande **ZIF16** : vérification des directions, configuration des broches, attente de 20 µs, lecture de leurs états et mise en file de la réponse.
7. Envoi progressif des octets en attente avec `FIFO_Emettre()`.

Les commandes sont copiées dans la boucle principale pendant une courte période où les interruptions sont désactivées, pour éviter qu'une nouvelle réception les modifie au milieu du traitement. Une FIFO de **16 octets** permet ensuite de transmettre les réponses sans bloquer toute la boucle.

## 7. L'interface Processing — `casiers.pde`

L'interface représente **16 emplacements**, répartis en **deux colonnes de huit**, ainsi qu'un dessin du support **ZIF16**.

Pour les casiers, la **colonne de gauche** correspond aux indices `0` à `7` de `tableau_capteur[]`, donc aux entrées P0–P7 du PCF des DIP-switchs. La colonne de droite correspond aux indices `8` à `15`, mais elle ne dispose pas d'un deuxième PCF de capteurs dans la maquette réalisée. Les **six premières LED** de la colonne de gauche sont les six LED effectivement câblées.

En cliquant sur les ronds, je prépare l'état rouge/vert demandé. Le clic seul n'envoie pas la commande : il faut ensuite appuyer sur **C**. Le nombre au centre des cases est mis à jour à partir de la réponse du STM32 : `0` pour un contact fermé vers la masse et `1` pour un contact ouvert.

Sur le dessin du ZIF16, je peux également modifier l'état de chaque patte en cliquant dessus. L'affichage distingue les entrées avec rappel `H` ou `L` et les sorties fortes `1` ou `0`. Pour envoyer la configuration, j'appuie sur **Z**. La réponse reçue est affichée sous la forme `ZIF16 lu : 0x....`.

| Action | Fonction dans Processing | Effet |
| --- | --- | --- |
| Clic sur une LED | `mousePressed()` | Modifie la couleur demandée dans l'interface. |
| Touche **C** | `sendTrameLED()` | Envoie une trame casiers de 5 octets. |
| Clic sur une patte ZIF | `togglePinBits()` | Modifie direction/niveau demandés. |
| Touche **Z** | `sendTrameDIL()` | Envoie une trame ZIF de 5 octets, si au plus deux sorties fortes. |
| Lecture du port série | `recevoirOctet()` | Décode la réponse de 3 octets et actualise les valeurs affichées. |

**Important pour lancer Processing :** dans `setup()`, le code choisit `Serial.list()[0]`. Il faut vérifier dans la console Processing que ce premier port est bien le **port COM virtuel du ST-LINK**. Sinon, il faut modifier cet index pour sélectionner la bonne liaison ; le programme ne choisit pas le port automatiquement par le nom de la carte.

## 8. Protocole de communication UART

### 8.1. Configuration

La liaison avec l'ordinateur utilise **USART2 : 9600 bauds, 8 bits de données, sans parité et 1 bit de stop (8N1)**.

Chaque octet occupe dix temps de bit (start + 8 données + stop). À 9600 bauds, un bit dure théoriquement :

```text
Tbit = 1 / 9600 ≈ 104,17 µs
```

### 8.2. Commandes envoyées par Processing : 5 octets

Le PC envoie une trame de cinq octets : un **en-tête**, suivi de quatre octets de données. L'en-tête commence par `0xC0` pour les **casiers** ou `0x80` pour le **ZIF16**.

Les quatre octets de données doivent garder leur bit 7 à 0 pour ne pas être confondus avec un nouvel en-tête. Leurs quatre bits de poids fort sont donc déplacés dans les bits 0 à 3 de l'en-tête, puis reconstruits à l'arrivée par `Reception_Reconstituer()`.

| Position | Commande casiers | Commande ZIF16 |
| --- | --- | --- |
| 1 | En-tête base `0xC0` + bits reportés | En-tête base `0x80` + bits reportés |
| 2 | Masque LED vertes, octet fort | Directions, octet fort |
| 3 | Masque LED vertes, octet faible | Directions, octet faible |
| 4 | Masque LED rouges, octet fort | Niveaux, octet fort |
| 5 | Masque LED rouges, octet faible | Niveaux, octet faible |

### 8.3. Réponses envoyées par le STM32 : 3 octets

Le STM32 renvoie une réponse plus courte : un en-tête de type `0xC0` ou `0x80`, puis deux octets de données. Les bits 7 des deux octets de données sont reportés dans les bits 0 et 1 de l'en-tête.

Processing refait ensuite l'opération inverse pour reconstituer le mot d'état sur **16 bits**.

## 9. Premier essai — LED et DIP-switchs

### 9.1. Commande envoyée depuis Processing

Sur la capture du rapport, j'ai demandé l'allumage en rouge des **six LED câblées**. Le masque vert vaut `0x0000` et le masque rouge vaut `0x003F`.

La commande envoyée du PC vers le STM32 est :

```text
C0 00 00 00 3F
```

### 9.2. Échanges I²C observés

Après réception de la commande, le STM32 calcule les octets nécessaires pour piloter les LED. Comme les sorties sont actives à 0, le masque donnant trois LED rouges sur chaque PCF correspond à **`0xEA`**, soit `1110 1010`.

Dans PulseView, on retrouve les transactions suivantes :

| Transaction | Donnée | Interprétation |
| --- | --- | --- |
| `0x20` — écriture | `0xEA` | Trois premières LED commandées en rouge. |
| `0x21` — écriture | `0xEA` | Trois autres LED commandées en rouge. |
| `0x23` — lecture | `0x98` | État des huit entrées P0 à P7 du PCF des DIP-switchs. |

Le décodage I²C permet de voir la condition START, l'adresse et le sens de communication, les acquittements ACK, puis la condition STOP. Le PCF de lecture renvoie `0x98` (`1001 1000`), ce qui signifie que **P3, P4 et P7 sont à 1** et **P0, P1, P2, P5 et P6 à 0**.

La valeur de la capture Processing montrée ailleurs dans le rapport est `0x88`, et non `0x98` : elle ne correspond donc pas exactement au même état des entrées. Je préfère signaler ce décalage plutôt que de prétendre que les captures sont strictement synchronisées.

### 9.3. Réponse UART

Pour la valeur lue `0x0098`, la réponse STM32 vers le PC est :

```text
C2 00 18
```

Le `0xC2` est l'en-tête des casiers, avec le bit 7 de l'octet faible reporté dans son bit 1. Processing reconstitue ensuite le mot **`0x0098`**.

Le rôle des fonctions est bien visible dans cet essai : `USART2_IRQHandler()` et `Reception_Reconstituer()` récupèrent la commande ; `Casiers_LEDs()` et `PCF_Ecrire()` commandent les LED ; `PCF_Lire()` et `Casiers_Lire()` lisent les contacts ; enfin `FIFO_AjouterReponse()` et `FIFO_Emettre()` renvoient la réponse.

Cette capture permet de **confirmer les trames**. Pour montrer que les LED physiques ont bien changé d'état, il faut compléter avec une photo ou une vidéo où l'on voit la maquette en même temps que Processing.

## 10. Deuxième essai — ZIF16

Ce deuxième essai sert à montrer que l'on peut piloter et lire les **seize GPIO** du support ZIF16 sans passer par les PCF8574.

Dans le chronogramme, Processing envoie :

```text
8B 7D 3F 6E 17
```

Après reconstitution des bits de poids fort présents dans l'en-tête, le STM32 obtient :

```text
Directions = 0xFDBF
Niveaux    = 0x6E97
```

Avec `directions = 0xFDBF`, **seules les pattes 7 et 10 sont en sorties fortes** ; les quatorze autres sont en entrée avec un rappel choisi par le mot `niveaux`. Le contrôle de sécurité de `ZIF_DirectionsValides()` est donc respecté.

Le STM32 applique la configuration avec `ZIF_Config()`, attend **20 µs**, lit les broches avec `ZIF_Lire()`, puis renvoie :

```text
82 6E 17
```

Processing reconstruit alors la valeur **`0x6E97`**, visible sous le ZIF16 dans la capture. J'ai aussi présenté dans le rapport une première lecture `0x7FFF` pour montrer comment on pouvait interpréter le mot de 16 bits.

Ici, les trames montrent que le protocole fonctionne dans les deux sens et que Processing sait afficher la valeur reçue. En revanche, cela **ne démontre pas encore électriquement** que chaque patte du ZIF applique bien le niveau attendu : ce point demanderait des mesures ciblées ou une vidéo de forçage matériel.

## 11. Vérifications, difficultés rencontrées et solutions

### 11.1. Ce que j'ai pu vérifier

- La **compilation Keil** fournie dans l'archive se termine avec **0 erreur et 0 avertissement**, dans `tp_composants_logique/Objects/projet_keil_neuf.build_log.htm`.
- La séquence de démarrage prévue dans le code commande successivement `0xFF`, `0xAA` et `0x55` sur les PCF de LED.
- Les acquisitions PulseView montrent des écritures sur les PCF `0x20`/`0x21` et une lecture sur `0x23`.
- Les échanges UART des casiers et du ZIF16 sont décodés et expliqués dans le compte rendu.
- Processing affiche les états des contacts et reconstitue un mot de 16 bits pour le ZIF16.

La compilation à elle seule ne prouve pas le comportement électrique du montage : les captures et le plan-séquence de démonstration restent indispensables.

### 11.2. Problème des DIP-switchs

Au départ, j'avais relié les interrupteurs au niveau haut, et je récupérais toujours `0xFF`. J'ai repris le fonctionnement du PCF8574, puis modifié le câblage pour que les interrupteurs ramènent les entrées à la masse. C'est à partir de là que j'ai pu observer des changements de bits lors de la lecture.

### 11.3. Gestion des broches ZIF16

J'ai aussi dû bien distinguer une entrée à rappel faible d'une vraie sortie push-pull. Pour éviter de forcer trop de broches à la fois, le programme refuse les configurations comportant plus de **deux sorties fortes**. Cela ne dispense pas de vérifier que le montage et le composant testé supportent les tensions appliquées.

### 11.4. Utilisation de l'IA

Comme pour le TP2, je n'ai plus l'historique complet de mes échanges avec l'IA. Au début, mes demandes étaient assez vagues, en mode « Fais-moi cette fonction » ou « Pourquoi ça ne marche pas ? ». Puis j'ai commencé à donner davantage de détails : la fonction concernée, les broches utilisées, le résultat attendu et les captures obtenues.

On discutait parfois des différentes solutions, et j'essayais de comprendre pourquoi une manière de faire correspondait mieux à ce qui était demandé dans le TP. Je me suis surtout servi de l'IA pour reprendre les explications sur l'I²C en *bit banging*, la lecture des PCF8574, le protocole UART et la configuration des broches ZIF16.

Voici des **exemples de prompts reformulés**, et non des citations mot pour mot de conversations que je n'ai pas conservées :

> « Explique-moi comment faire l'I²C en bit banging sur le STM32, avec START, STOP et ACK. »
>
> « Pourquoi est-ce que je lis toujours 0xFF lorsque je change l'état de mes DIP-switchs ? »
>
> « Comment les quatre octets de données reçus par UART permettent-ils de configurer les 16 pattes du ZIF16 ? »

Au final, l'idée était de ne pas seulement récupérer du code, mais de le comprendre et de le confronter aux signaux que j'observais sur PulseView et dans Processing.

## 12. Comment lancer le TP

### 12.1. Compiler et téléverser le programme STM32

1. Récupérer le dossier `TP_1` sur le PC.
2. Ouvrir **Keil µVision 5**, puis le fichier `tp_composants_logique/tp_composants_logique.uvprojx`.
3. Vérifier que les composants CMSIS et le pack STM32F1 nécessaires au projet sont installés. Le journal fourni mentionne `ARM.CMSIS 5.7.0` et `Keil.STM32F1xx_DFP 2.4.1`.
4. Ouvrir `main.c` pour vérifier que la configuration et les adresses PCF sont adaptées au câblage.
5. Lancer **Build Target**, vérifier les erreurs/avertissements, puis téléverser via ST-LINK.
6. Brancher le montage, en vérifiant la masse commune, les rappels I²C et les niveaux électriques.

### 12.2. Lancer Processing

1. Ouvrir `casiers.pde` dans Processing.
2. Vérifier dans la console le numéro du port COM virtuel du ST-LINK ; ajuster `Serial.list()[0]` si nécessaire.
3. Lancer le sketch.
4. Cliquer sur les ronds rouge/vert, puis appuyer sur **C** pour envoyer une commande casiers et lire les DIP-switchs.
5. Cliquer sur les pattes du dessin ZIF16, puis appuyer sur **Z** pour envoyer une configuration compatible avec la limite des deux sorties fortes.
6. Vérifier le message `ZIF16 lu : 0x....` et, si besoin, les octets reçus dans la console Processing.

### 12.3. Observer les signaux dans PulseView

1. Brancher les voies de l'analyseur sur **PB6/SCL, PB7/SDA** et les signaux UART concernés, avec une **masse commune**.
2. Ouvrir les sessions `Session_pulse_view/I2C/IDC.pvs` ou `Session_pulse_view/UART/UART.pvs` ; leurs captures correspondantes sont en `.sr`.
3. Régler ou vérifier le décodeur I²C sur SCL/SDA et le décodeur UART sur la voie effectivement surveillée, à **9600 bauds, 8N1**.
4. Faire une capture lors d'une commande **C**, puis une autre lors d'une commande **Z**.
5. Comparer les octets visibles aux deux exemples des sections 9 et 10.

Les noms **TX** et **RX** peuvent être ceux que j'ai donnés aux voies de PulseView lors du branchement. Il faut donc toujours vérifier le **sens réel** : la commande Processing arrive sur **PA3 (RX du STM32)** et la réponse repart sur **PA2 (TX du STM32)**.

## 13. Pièces du rendu et démonstration

Le compte rendu contient le bilan d'entrées/sorties, les tableaux de configuration, l'explication du programme, les photographies du montage, les exemples de trames et les chronogrammes commentés.

Le professeur demande également une **vidéo en plan-séquence**, dans laquelle on voit la fenêtre Processing, celle de PulseView et le câblage. Pour le TP1, elle doit montrer à la fois une action depuis Processing provoquant une modification des LED et des trames, et une action sur les interrupteurs ou les pattes du ZIF16 provoquant un changement sur l'interface.

La vidéo doit être partagée par un **lien de téléchargement grosfichiers.ch**. Le professeur a indiqué qu'un lien Google Docs ou GitHub ne remplaçait **pas** cette remise vidéo.

**Lien vidéo de démonstration :** à compléter après l'envoi sur grosfichiers.ch. Je n'indique pas de lien inventé ici.

## 14. Limites et points à garder en tête

- Les **16 casiers** existent dans l'interface et le protocole, mais la maquette dispose de **six LED réellement câblées** et d'un **seul PCF de lecture**.
- Les positions P3 et P7 du PCF des interrupteurs sont lues, mais non associées à une LED dans le mode de test local `Maj_LEDs_Casiers()`.
- `Maj_LEDs_Casiers()` n'est **pas appelée** dans le `main()` actif.
- Les commentaires de certaines adresses PCF dans le code et l'ancien README sont périmés ; les bonnes valeurs dans ce programme sont `0x20`, `0x21` et `0x23`.
- Les captures de lecture `0x88` et `0x98` ne proviennent pas nécessairement du même instant.
- Les chronogrammes du ZIF16 confirment l'échange logique, pas une mesure physique simultanée des seize niveaux.
- Le choix du port COM dans Processing dépend de l'ordinateur.
- Les fichiers de compilation placés dans `Objects/` et `Listings/` peuvent être régénérés ; ils ne remplacent pas le fichier source `main.c`.

## 15. Conclusion

Pour conclure, ce TP m'a permis de mieux comprendre comment faire communiquer plusieurs composants autour d'un même STM32. Ce qui m'a surtout intéressé, c'était de suivre les informations depuis une action sur Processing jusqu'aux PCF8574, puis de retrouver les réponses dans les trames UART et sur les chronogrammes de PulseView.

J'ai aussi pu travailler sur les registres GPIO, l'I²C logiciel et la configuration des seize broches du ZIF16. Tout n'a pas fonctionné du premier coup, notamment la lecture des DIP-switchs, mais les différents essais m'ont permis de mieux comprendre les erreurs et de les corriger progressivement. Il reste quelques vérifications électriques à faire sur le ZIF16 pour valider complètement le montage, mais la partie communication et la reconstitution des données sont bien documentées par les captures du rapport.

---

**Document de référence :** `RAPPORT_TP1_MCU2.pdf` (compte rendu final à placer avec les sources).  
**Dépôt du projet :** <https://github.com/Darkzveller/TP1_MCU>  
**Remarque :** ce dépôt contient le projet et les sources ; **la vidéo demandée pour le rendu doit disposer de son propre lien grosfichiers.ch**.
