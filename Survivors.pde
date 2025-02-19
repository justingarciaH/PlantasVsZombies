class survivor {
  int posX, posY, carga, cuentabalas, Vel_Carga;
  PImage pato;
  survivor() {
    Vel_Carga=50;   // velocidad de recarga de las balas
    posX=50;
    posY=height/2;
    pato=loadImage("Pato1.png");
  }
  void display() {
    imageMode(CENTER);
    image(pato, posX, posY, 110, 110);
  }

  void move() {
    if (up && posY>260) posY=posY-10;
    if (down && posY<850)  posY=posY+10;
    if (right && posX<100) posX=posX+10;
    if (left && posX>30) posX= posX-10;
    if (espacio && carga == 360) { //disparo y sonidos
      balas.add(new Proyectiles());
      bullet.rewind();
      bullet.play();
      carga=0;
      cuentabalas++;
    }
  }
  //iniciacion de arraylist y sus funciones (smg es un tipo de municion)
  void iniciobalistico() {
    int i = balas.size()-1;
    while (i>=0) {
      Proyectiles smg = balas.get(i);
      smg.mostrar();
      smg.mover();
      if (smg.impacto()) {
        balas.remove(i);
      }
      i--;
    }
  }
  //funcion que sirve como cargador del disparo
  void charger_bullets() {
    carga+=Vel_Carga;
    carga = constrain(carga, 0, 360);
    noFill();
    stroke(#179fcd);
    strokeWeight(5);
    arc(posX+15, posY-10, 10, 10, 0, radians(carga));
    for (int k = 1; k<50; k++)
      if (cuentabalas==k*5) Vel_Carga=50-k*3; //condicion para que disminuya la velocidad de recarga de la bala y darle mas dificultad al juego
  }
}

