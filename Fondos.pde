class fondo {
  //imagenes portada
  PImage Portada;

  // imagenes historia
  PImage history, letra;

  //imagenes de si gano o perdio
  PImage letras_final, letras_final2, volverJugar, volverMenu;


  // imagenes instrucciones
  PImage flechaderecha, flechaizquierda, flechaarriba, flechaabajo, teclaespacio, mouse, zombie_instrucciones, bala, papelinstrucciones, fondoinstrucciones, Back;

  // imagenes escenario principal
  PImage cesped, arboles, asfalto, fence, nube1, nube2, Pause, someDucks, someEggs, aduck, anegg, abigduck, somebigducks;
  int N_nubes=15;
  int[] movimiento_nubes = new int[N_nubes];

  int tam_boton=100, backx=850, backy=25; //boton que servira para regresar a la pantalla de inicio y posiciones del boton de regreso
  int X=100, Y=220, posicionY_nube=60, diametro_nube=100; // mainstage
  int tamflecha=50, flechax=340, flechay=300, zombiex =250, zombiey =600;

  //loose
  PImage sadDuck;

  //pausa
  PImage pausa;

  fondo() {
    //portada
    Portada= loadImage("portada.png");

    //historia
    history=loadImage("Pantalla historia de juego.png");
    letra=loadImage("letras.png");

    //escenario principal
    cesped= loadImage("cesped1.png");
    asfalto=loadImage("Asfalto.png");
    fence=loadImage("Fence.png");
    arboles= loadImage("arbol.png");
    someDucks= loadImage("patitosfondo.png");
    someEggs=loadImage("huevosfondo.png");
    aduck = loadImage("patitovida.png");
    anegg = loadImage("huevitovida.png");
    abigduck = loadImage("patonvida.png");
    somebigducks = loadImage("patonfondo.png");
    Pause=loadImage("pausa.png");
    for (int n = 0; n<movimiento_nubes.length; n++) {
      movimiento_nubes[n] = n*100;
      nube1 = loadImage("nube1.png");
      nube2 = loadImage("nube2.png");
    }
    //insertar imagenes de la pantalla de instrucciones
    flechaderecha = loadImage("flecha_derecha.png");
    flechaizquierda = loadImage("flecha_izquierda.png");
    flechaarriba = loadImage("flecha_arriba.png");
    flechaabajo = loadImage("flecha_abajo.png");
    papelinstrucciones = loadImage("papel_instrucciones.png");
    fondoinstrucciones = loadImage("fondo_instrucciones.jpg");
    teclaespacio = loadImage("space.png");
    mouse = loadImage("mouse.png");
    Back= loadImage("back.jpeg");
    zombie_instrucciones = loadImage("No_zombie.png");
    bala = loadImage("bala.png");

    //imagenes gano o perdio
    letras_final=loadImage("letras_perdio.png");
    volverJugar=loadImage("jugar_again.png");
    volverMenu=loadImage("regresar_menu.png");
    letras_final2=loadImage("letras_gano.png");

    //loose
    sadDuck= loadImage("patotriste.png");

    //pause
    pausa=loadImage("menu_pausa.png");
  }
  void Portada() {
    imageMode(CORNER);
    image(Portada, 0, 0, 1000, 1000  );
    if (mousePressed) { //condicion que permite ingresar a la pantalla principal del juego
      if (mouseX >= 160 && mouseX <= 410 && mouseY >= 430 && mouseY <= height/2+40)
        estado = 1; //estado al que se llega mediante el boton play
    }
    if (dist(mouseX, mouseY, width-100, 880)< 115/2 && mousePressed) { //condicion para ingresar a la historia
      estado=2;
    }
    if (dist(mouseX, mouseY, 85, 880)< 130/2 && mousePressed) { //condicion para ingresar a las instrucciones
      estado=3;
    }
  }

  void MainStage() {
    background(#c5e2f6);
    image(Pause, 70, 20, 85, 35);
    if (mousePressed && mouseX >= 25 && mouseX <= 110 && mouseY <= 35 && mouseY >= 0) {
      estado = 6;
    }
    image(asfalto, 500, 950, 1000, 100);
    tint(230); //determina el nivel de transparencia que puede tener la imagen
    blendMode(BLEND); //metodo usado para combinar los colores segun necesitemos la calidad o brillo de la imagen
    image(cesped, width/2, height/1.81, 1000, 700);
    for (int f=0; f<1000; f+=450) {
      image(fence, f+100, 180, 450, 80);
    }

    for (int u = 0; u<movimiento_nubes.length; u++) {
      image(nube1, movimiento_nubes[u], posicionY_nube, diametro_nube, diametro_nube);
      image(nube2, movimiento_nubes[u]+100, posicionY_nube+50, diametro_nube+10, diametro_nube+10);
    }
    for (int u = 0; u<movimiento_nubes.length; u++)
      movimiento_nubes[u]--;

    if (movimiento_nubes[3]<0) {
      for (int u = 0; u<movimiento_nubes.length; u++)
        movimiento_nubes[u] = u*100;
    }

    for (int a = 0; a <1000; a+=200) {
      image(arboles, X+a, Y, 200, 200);
      image(arboles, X+a, Y*4, 200, 200);
    }
    if (contador.zombiesMuertos>=10 && contador.zombiesMuertos<25) {
      image(someDucks, 50, 550, 100, 100);
    } else if (contador.zombiesMuertos<10) {
      for (int h = 2; h<5; h++)
        image(someEggs, 50, h*190, 100, 300);
    } else {
      image(somebigducks, 50, 550, 100, 100);
    }
  }
  void History() {
    image(history, -30, 0, 1050, 1000);
    image(letra, 127, 130, 690, 710);
    image(Back, backx, backy, tam_boton, tam_boton);
    if (mousePressed && mouseX>backx && mouseX<backx+tam_boton && mouseY >backy && mouseY<backy+tam_boton) {
      estado=0;
    }
  }

  void Instructions() {
    image(fondoinstrucciones, 0, 0, 1000, 1000);
    image(papelinstrucciones, 150, 75, 700, 850);
    textSize(30);
    textAlign(LEFT);
    text("Movimiento", 275, 250);
    text("Disparo", 550, 250);
    textAlign(CENTER);
    text("Zombies", 500, 550);
    image(flechaarriba, flechax, flechay, tamflecha, tamflecha);
    image(flechaabajo, flechax, flechay+tamflecha, tamflecha, tamflecha);
    image(flechaderecha, flechax-tamflecha, flechay+tamflecha, tamflecha, tamflecha);
    image(flechaizquierda, flechax+tamflecha, flechay+tamflecha, tamflecha, tamflecha);
    image(teclaespacio, flechax+190, flechay+tamflecha/2, 3*tamflecha, tamflecha);
    image(mouse, flechax+250, flechay+100, 50, 100);

    for ( float z=230; z<width/2.1; z+=100) {
      image(zombie_instrucciones, z, zombiey, 75, 75);
    }

    image(bala, 550, zombiey, 50, 25);
    image(bala, 625, zombiey, 50, 25);
    image(bala, 550, zombiey+50, 50, 25);
    image(bala, 625, zombiey+50, 50, 25);
    noStroke();
    rect(500, zombiey+30, 40, 10);
    rect(500, zombiey+50, 40, 10);
    textSize(20);
    text("NO DEJES QUE LOS ZOMBIES EXTINGAN LA PATIDAD!!", 500, 740);
    rect(850, 25, 100, 100);
    image(Back, 850, 25, 100, 100);
    if (mousePressed && mouseX>backx && mouseX<backx+tam_boton && mouseY >backy && mouseY<backy+tam_boton) { //condicion para volver a la pantalla principal desde las instrucciones
      estado=0;
    }
  }
  void  Lose() {
    imageMode(CORNER);
    image(fondo_final_lose, 0, 0, 1000, 1200);
    image(sadDuck, width/3, height/3.5);
    image(letras_final, 130, -100, 750, 450);
    image(volverJugar, width/9.7, 800, 369, 95);
    image(volverMenu, width/1.9, 805, 380, 130);
    fill(255);
    textSize(25);
    text( "Zombies derrotados ="+ contador.zombiesMuertos, width/3, 700); 
    if (enter) {
      for (int i = 0; i < N_caminantes; i++) {
        float x=random(1000, 1500);
        float y=random(270, 800);
        position[i]= new PVector(x, y);
      }
      estado=1;
      contador.Num_vidas =3;
      Pato.cuentabalas = 0;
      contador.zombiesMuertos = 0;
    }

    if (eme) {
      for (int i = 0; i < N_caminantes; i++) {
        float x=random(1000, 1500);
        float y=random(270, 800);
        position[i]= new PVector(x, y);
      }
      estado=0;
      contador.Num_vidas =3;
      Pato.cuentabalas = 0;
      contador.zombiesMuertos = 0;
    }
  }
  void Win() {
    imageMode(CORNER);
    image(fondo_final_win, 0, 0, 1000, 1000);
    image(letras_final2, 120, -120, 800, 500);
    image(volverJugar, width/11, 880, 369, 95);
    image(volverMenu, width/1.8, 885, 380, 130);
    fill(255);
    textSize(25);
    text( "Zombies derrotados ="+ contador.zombiesMuertos, width/3, 700); 
    if (enter) {
      for (int i = 0; i < N_caminantes; i++) {
        float x=random(1000, 1500);
        float y=random(270, 800);
        position[i]= new PVector(x, y);
      }
      estado=1;
      contador.Num_vidas =3;
      Pato.cuentabalas = 0;
      contador.zombiesMuertos = 0;
    }
    if (eme) {
      for (int i = 0; i < N_caminantes; i++) {
        float x=random(1000, 1500);
        float y=random(270, 800);
        position[i]= new PVector(x, y);
      }
      estado=0;
      contador.Num_vidas =3;
      Pato.cuentabalas = 0;
      contador.zombiesMuertos = 0;
    }
  }
  void Pause() {  
    image(pausa, 505, 530, 350, 400);

    //DIVISION DE LOS 3 OPCIONES DE JUEGO
    if (mouseButton == LEFT && mouseX>350 && mouseX<650 && mouseY>385 && mouseY<485) { //condicion para reanudar el juego
      estado = 1;
    }
    if (mouseButton == LEFT && mouseX>350 && mouseX<650 && mouseY>505 && mouseY<600) { //condicion de reinicio de juego
      estado = 1;
      for (int i = 0; i < N_caminantes; i++) {
        float x=random(1000, 1500);
        float y=random(270, 800);
        position[i]= new PVector(x, y);
      }
      contador.Num_vidas=3;
      Pato.cuentabalas=0;
      contador.zombiesMuertos=0;
    }

    if (mouseButton == LEFT && mouseX>350 && mouseX<650 && mouseY>620 && mouseY<715) { //condicion para volver al menú principal
      estado=0;
      for (int i = 0; i < N_caminantes; i++) {
        float x=random(1000, 1500);
        float y=random(270, 800);
        position[i]= new PVector(x, y);
      }
      contador.Num_vidas=3;
      Pato.cuentabalas=0;
      contador.zombiesMuertos=0;
    }
  }
}

