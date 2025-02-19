// el siguiente juego requiere libreria tanto de musica como de gif

import ddf.minim.*; // se insertan la libreria de juego
Minim music;
AudioPlayer bullet, died;

// giff importados en caso de que gane el juego
import gifAnimation.*;
Gif fondo_final_win;
Gif fondo_final_lose;

// inicializacion de las clases
fondo landscape;
enemy zombie;
survivor Pato;
methods contador;

int estado=0; // variable que determinara el estado de la pantalla o lo que muestre
boolean up, down, left, right, espacio, enter, eme; //variables booleanas del movimiento del pato
ArrayList<Proyectiles> balas; //arraylist de las balas

int indice=0; //variable que servirá para determinar la iteración entre las tres imagenes

int N_caminantes=5; // numero de caminantes, variable que permitira aumentar la cantidad de caminantes
PImage []z1= new PImage[N_caminantes];
PImage []z2= new PImage[N_caminantes];
PImage []z3= new PImage[N_caminantes];
PVector[] position= new PVector [N_caminantes]; //posicion de los zombies

void setup() {
  size(1000, 1000);
  landscape= new fondo(); //clase de los fondos
//inicializacion de los gifs
  fondo_final_win= new Gif(this, "fondo_win.gif");
  fondo_final_win.play();
  fondo_final_lose= new Gif(this, "fondo_lose.gif");
  fondo_final_lose.play();

  music= new Minim(this);
  died= music.loadFile("died_sound.mp3");
  bullet= music.loadFile("bullet_sound.wav");
  Pato= new survivor(); //clase de personaje principal
  zombie=new enemy();
  contador= new methods();
  balas= new ArrayList<Proyectiles>();
//cargar las imagenes del array de los zombies con un for
  for ( int c=0; c<N_caminantes; c++) {
    z1[c]= loadImage("Z_0.png");
    z2[c]= loadImage("Z_1.png");
    z3[c]= loadImage("Z_2.png");
  }
//cargar las posiciones del array de los zombies con un for y vector
  for (int i = 0; i < N_caminantes; i++) {
    float x=random(900, 1500);
    float y=random(270, 800);
    position[i]= new PVector(x, y);
  }
}

void draw() {
  if (estado == 0) {
    landscape.Portada();
  }
  if (estado == 1) {
    landscape.MainStage();
    for (int i = 0; i < N_caminantes; i++) {
      zombie.display(i);
      zombie.move(i);
    }
    Pato.display();
    Pato.move();
    Pato.iniciobalistico();
    Pato.charger_bullets();
    contador.contador_balas_usadas();
    contador.vidas();
  }

  if (estado == 2) {
    landscape.History();
  }
  if (estado == 3) {
    landscape.Instructions();
  }
  if ( estado==4) {
    landscape.Lose();
  }
  if ( estado==5) {
    landscape.Win();
  }
  if ( estado==6) {
    landscape.Pause();
  }
}

//funciones para mover el p.principal
void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == DOWN) down = true;
  if ( keyCode == RIGHT) right = true;
  if (keyCode == ENTER) enter = true;
  if (key == ' ')  espacio = true;
  if (key == 'm'|| key == 'M')  eme = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == DOWN) down = false;
  if ( keyCode == RIGHT) right = false;
  if (keyCode == ENTER) enter = false;
  if (key == ' ')   espacio = false;
  if (key == 'm'|| key == 'M')  eme = false;
}

