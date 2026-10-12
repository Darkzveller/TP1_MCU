import processing.serial.*;
// Constantes de l'affichage
final int LARGEUR = 800;
final int HAUTEUR = 600;
final int RECT_W = 90;
final int RECT_H = 40;
final int SPACING = 10;
final int START_X = 110;
final int START_Y = 50;

final int boxW = 100;
final int boxH = 400;
final int boxX = LARGEUR - boxW - 100;
final int boxY = (HAUTEUR - boxH) / 4;

int[] led_rouge = new int[16];
int[] led_verte = new int[16];
int[] tableau_capteur = new int[16];

int INOUT = 0x7FBF;   // = 0b0111111110111111// 16 bits
int PULL  = 0x8000;   // = 0b1000000000000000 // 16 bits
int val;
PFont font;
Serial my_port;

void setup() {
  size(LARGEUR, HAUTEUR);
  background(0);
  font = createFont("Arial", 16);
  textFont(font);
  // Initialise les tableaux à 0
  for (int i = 0; i < 16; i++) {
    led_rouge[i] = 0;
    led_verte[i] = 0;
    tableau_capteur[i] = int(random(2)); // Valeurs aléatoires pour le test
  }
  // my_port série
  printArray(Serial.list());
  // Remplace "COM3" par le my_port série correct
  my_port = new Serial(this, Serial.list()[0], 9600);
}



void draw() {
  background(0);
  drawUI();
  drawDIL16();
   fill(255);
   text("cliquez sur les leds pour changer leur état", 200, 500);
   text("cliquez sur 'C' pour envoyer la trame casier", 200, 530);
   text("cliquez sur les PINs pour changer leur état", 600, 500);
   text("cliquez sur 'Z' pour envoyer la trame ZIF16", 600, 530);

  while ( my_port.available() > 0) {  // If data is available,
    val = my_port.read();         // read it and store it in val
    println(val);
  }
}

void drawDIL16() {
  // Boîtier
  fill(80);
  stroke(255);
  rect(boxX, boxY, boxW, boxH);

  // Encoche : demi-cercle rentrant en haut
  fill(0);
  arc(boxX + boxW / 2, boxY, 33, 33,0,PI);

  // Pattes
  int padCount = 8;
  float spacing = boxH / (padCount + 1);

  for (int i = 0; i < padCount; i++) {
    // Côté gauche : pin 1 à 8 (vers le bas)
    int pinL = i + 1;
    float y = boxY + spacing * (i + 1);
    drawPadFull(pinL, boxX, y, true);

    // Côté droit : pin 16 à 9 (vers le haut)
    int pinR = 16 - i;
    drawPadFull(pinR, boxX + boxW, y, false);
  }
}

void drawPadFull(int pinNum, float rectEdgeX, float y, boolean isLeft) {
  int bitIndex = pinNum - 1;

  // Bits
  int inoutBit = (INOUT >> bitIndex) & 1;
  int pullBit = (PULL >> bitIndex) & 1;

  // Déterminer la lettre
  String letter = "0";
  if (inoutBit == 0 && pullBit == 1) letter = "1";
  else if (inoutBit == 1 && pullBit == 0) letter = "L";
  else if (inoutBit == 1 && pullBit == 1) letter = "H";

  // Coordonnées ellipse
  float ellipseX = isLeft ? rectEdgeX - 3 - 5 : rectEdgeX + 3 + 5;

  // Afficher la lettre
  fill(255);
  textAlign(isLeft ? RIGHT : LEFT, CENTER);
  text(letter, isLeft ? ellipseX - 20 : ellipseX + 20, y);

  // Ellipse (patte)
  fill(200);
  stroke(255);
  ellipse(ellipseX, y, 10, 30);

  // Numéro dans le rectangle
  float numX = isLeft ? rectEdgeX + 20 : rectEdgeX - 20;
  fill(0);
  textAlign(CENTER, CENTER);
  text(pinNum, numX, y);
}

// Gérer le clic sur les pattes
void mousePressed() {
  // Clics LED (déjà existants)
  for (int i = 0; i < 16; i++) {
    int col = i / 8;
    int row = i % 8;
    int x = START_X + col * (RECT_W + SPACING);
    int y = START_Y + row * (RECT_H + SPACING);
    int circleY = y + RECT_H / 2;
    int rX = x + 15;
    int vX = x + RECT_W - 15;

    if (dist(mouseX, mouseY, rX, circleY) < 10) {
      led_rouge[i] = 1 - led_rouge[i];
    }
    if (dist(mouseX, mouseY, vX, circleY) < 10) {
      led_verte[i] = 1 - led_verte[i];
    }
  }
  // Clics sur pattes du DIL
 
  float spacing = boxH / 9.0;

  for (int i = 0; i < 8; i++) {
    float y = boxY + spacing * (i + 1);

    // Gauche : pin 1 à 8
    float xL = boxX - 3 - 5;
    if (dist(mouseX, mouseY, xL, y) < 15) {
      togglePinBits(i + 1); // pin 1 à 8
    }

    // Droite : pin 16 à 9
    float xR = boxX + boxW + 3 + 5;
    if (dist(mouseX, mouseY, xR, y) < 15) {
      togglePinBits(16 - i); // pin 16 à 9
    }
  }

}

void togglePinBits(int pinNum) {
  int bit = pinNum - 1;
  int mask = 1 << bit;

  // Lecture actuelle
  int inoutBit = (INOUT >> bit) & 1;
  int pullBit = (PULL >> bit) & 1;

  // Forme un code 2 bits : 0b00, 0b01, 0b10, 0b11 → cycle
  int state = (inoutBit << 1) | pullBit;
  state = (state + 1) % 4;

  // Mise à jour
  inoutBit = (state >> 1) & 1;
  pullBit = state & 1;

  // Set les bits
  if (inoutBit == 1) INOUT |= mask;
  else INOUT &= ~mask;

  if (pullBit == 1) PULL |= mask;
  else PULL &= ~mask;
}

// Envoi trame avec touche Z ou z
void keyPressed() {
  if (key == 'c' || key == 'C') {
    sendTrameLED();
  }
  if (key == 'z' || key == 'Z') {
    sendTrameDIL();
  }
}

void sendTrameDIL() {
  int[] trame = new int[5];

  // Octet 1 : entête 128 + bits manquants
  trame[0] = 128;
  trame[0] += ((INOUT >> 15) & 1) << 3;
  trame[0] += ((INOUT >> 7) & 1) << 2;
  trame[0] += ((PULL >> 15) & 1) << 1;
  trame[0] += ((PULL >> 7) & 1);

  // Octet 2 : (INOUT >> 8) & 127
  trame[1] = (INOUT >> 8) & 0x7F;
  trame[2] = INOUT & 0x7F;

  trame[3] = (PULL >> 8) & 0x7F;
  trame[4] = PULL & 0x7F;

  for (int i = 0; i < 5; i++) {
    my_port.write(byte(trame[i]));
  }

 // println("Trame DIL envoyée : " + Arrays.toString(trame));
}

void drawUI() {
  for (int i = 0; i < 16; i++) {
    int col = i / 8;
    int row = i % 8;
    int x = START_X + col * (RECT_W + SPACING);
    int y = START_Y + row * (RECT_H + SPACING);
    
    // Rectangle de fond
    fill(127);
    noStroke();
    rect(x, y, RECT_W, RECT_H);

    // Position des formes
    int circleY = y + RECT_H / 2;
    int rX = x + 15;
    int vX = x + RECT_W - 15;
    int wX = x + RECT_W / 2 - 10;

    // Rouge
    stroke(255, 0, 0);
    strokeWeight(3);
    if (led_rouge[i] == 1) {
      fill(255, 0, 0);
    } else {
      noFill();
    }
    ellipse(rX, circleY, 20, 20);

    // Rectangle blanc
    noStroke();
    fill(255);
    rect(wX, circleY - 10, 20, 20);

    // Vert
    stroke(0, 255, 0);
    strokeWeight(3);
    if (led_verte[i] == 1) {
      fill(0, 255, 0);
    } else {
      noFill();
    }
    ellipse(vX, circleY, 20, 20);

    // Texte 0 ou F
    fill(0);
    textAlign(CENTER, CENTER);
    text(tableau_capteur[i] == 0 ? "0" : "F", x + RECT_W / 2, y-2 + RECT_H / 2);
  }
}

void sendTrameLED() {
  int[] trame = new int[5];
  
  // Octet 1 : 192 + 8*led_rouge[7] + 4*led_rouge[15] + 2*led_verte[7] + led_verte[15]
  trame[0] = 192 + 8 * led_rouge[7] + 4 * led_rouge[15] + 2 * led_verte[7] + led_verte[15];

  // Octet 2 : led_verte[14 à 8]
  trame[1] = 0;
  for (int i = 8; i <= 14; i++) {
    trame[1] |= (led_verte[i] << (i - 8));
  }

  // Octet 3 : led_verte[6 à 0]
  trame[2] = 0;
  for (int i = 0; i <= 6; i++) {
    trame[2] |= (led_verte[i] << i);
  }

  // Octet 4 : led_rouge[14 à 8]
  trame[3] = 0;
  for (int i = 8; i <= 14; i++) {
    trame[3] |= (led_rouge[i] << (i - 8));
  }

  // Octet 5 : led_rouge[6 à 0]
  trame[4] = 0;
  for (int i = 0; i <= 6; i++) {
    trame[4] |= (led_rouge[i] << i);
  }

  // Envoi sur le my_port série
  for (int i = 0; i < 5; i++) {
    my_port.write(byte(trame[i]));
  }

//  println("Trame envoyée : " + Arrays.toString(trame));
}

