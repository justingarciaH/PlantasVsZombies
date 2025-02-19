//funcion detectora de colisiones
boolean colisionanding(float R1x, float R1y, float R1an, float R1al, float R2x, float R2y, float R2an, float R2al) {
  if (R1x+R1an>=R2x && R1x<=R2x+R2an && R1y+R1al>=R2y && R1y<= R2y+R2al) {
    died.rewind();
    died.play();
    return true;
  }

  return false;
}
