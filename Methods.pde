class methods {
  int Num_vidas, zombiesMuertos;
  methods(){
    Num_vidas=3;
  }
  void vidas() {
    fill(0);
    textSize(25);
    if (contador.zombiesMuertos<=10) {
      image(landscape.anegg, 480, 20, 25, 40);
    } else if (contador.zombiesMuertos>=10 && contador.zombiesMuertos<25) { 
      image(landscape.aduck, 480, 20, 40, 30);
    } else { 
      image(landscape.abigduck, 480, 20, 30, 40);
    }
    text("Vidas  " + Num_vidas, width/2, height/40);
    if (Num_vidas<1) estado =4; //condicion que pasara la pantalla de "perdiste" si se le acaban la vidas al jugador
  }

  void contador_balas_usadas() {
    textAlign(CORNER);
    fill(0);
    textSize(25);
    image(landscape.zombie_instrucciones, 700, 25, 50, 50);
    text(zombiesMuertos, 750, 35);
    //condicion ganadora
    if(zombiesMuertos>50) estado = 5; 
    text("Balas usadas: " + Pato.cuentabalas, 250, height/40);
  }
}
