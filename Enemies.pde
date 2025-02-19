class enemy {
  float VelZ2=1;
  enemy() {
  }
  void display(int i) {
    imageMode(CENTER);
    //comando FrameCount que sirve para la iteracion de las tres imagenes provocando un movimiento, se lo modulariza entre 60 por las 3 imagenes
    if (frameCount % 60 < 20) {
      image(z1[indice], position[i].x, position[i].y, 100, 100);
    } else if (frameCount % 60 < 40) {
      image(z2[indice], position[i].x, position[i].y, 100, 100);
    } else {
      image(z3[indice], position[i].x, position[i].y, 100, 100);
    }
    if (position[i].x<100) {
      position[i].x=random(1000, 1200);
      position[i].y=random(270, 800);
      contador.Num_vidas --;
    }
  }

  void move(int i) {
    position[i].x-= VelZ2;
    if (contador.zombiesMuertos >= 10) {
      VelZ2 = 3;
        N_caminantes = 5;
    } 
    if (contador.zombiesMuertos>=25 && contador.zombiesMuertos<40) {
      VelZ2 =4;
       N_caminantes = 5;
    } 
    if (contador.zombiesMuertos>=40) { 
      VelZ2 = 5;
       N_caminantes = 5;
    }
  }
}

