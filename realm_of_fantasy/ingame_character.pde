void displayM05_Character() {
  imageMode(CENTER);
  rectMode(CENTER);
  background(M05_characterIT_background); //BACKGROUND
  playMusic(1);
  
  rectMode(RECT);
  fill(colorIGInterface);
  rect (0, 0, width/3.5, height);
  
  textSize(30);
  text("Inventaire",185,50);
  text("Gestion du personnage",820,50);
  rectMode(CENTER);
  
  /* DEBUT BOUTON 01 */
  if (mouseX > ((width-width/30)-(620/20)) && mouseX < (((width-width/30)+(620/20))) && mouseY > ((height/18)-(60/2)) && mouseY < ((height/18)+(60/2))) {
    if (!M05_button01_sound) {
      playSound(2);
      M05_button01_sound = true;
    }
    fill(colorMSpecialButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      menuID = 4; //CHANGEMENT DE MENU (interface personnage)
      delay(200);
    }
  } else {
    M05_button01_sound = false;
    fill(colorMSpecialButtonsBackground);
  }
  rect(width-width/30, height/18, 620/10, 60); //AFFICHAGE BOUTON 01
  image(back_button, width-width/30, height/18); //IMAGE BOUTON 01
  /* FIN BOUTON 01 */
  
  int[] inventoryItems = new int [99];
}