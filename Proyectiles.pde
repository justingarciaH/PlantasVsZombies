class Proyectiles {
  int x, y, vx, vy, Punto_impacto;
  Proyectiles() {
    x=Pato.posX+25;
    y=Pato.posY+5;
    vx= 10;
    vy = 0;
    Punto_impacto=1;
  }

  void mover() {
    x = x+vx;
    y = y+vy;
  }
  void mostrar() {
    image(landscape.bala, x, y, 20, 15);
   
    for (int i = 0; i < N_caminantes; i++) {
      if ( colisionanding(x, y, 5, 5, position[i].x, position[i].y-50, 50, 100)) {
        Punto_impacto =-2;
        position[i].x= random(900, 1500);
        position[i].y = random(260, 850);
      }
    }
    if (Punto_impacto<1) contador.zombiesMuertos++;
  }

  boolean impacto() {
    return x>width || Punto_impacto<1;
  }
}
