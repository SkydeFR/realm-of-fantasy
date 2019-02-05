void displayM04_InGame() {
  imageMode(CENTER);
  rectMode(CENTER);
  if (M04_continuer) {
    M04_continuer = false;
    loadStats();
  } else if (M04_nouvelle_partie) {
    M04_nouvelle_partie = false;
    step = 1;
    chapter = "Introduction";
    saveStats();
  }

  /* DEBUT CHRONOMETRE SAVE AUTO */
  if (time_tmp != second()) {
    save_counter++;
  }
  time_tmp = second();
  if (save_counter >= 30) { //Sauvegarde automatique toutes les 30 secondes
    saveStats();
    save_counter = 0;
  }
  /* FIN CHRONOMETRE SAVE AUTO */
  
  if (step <= 10) { //10 = VALEUR TEMPORAIRE CORRESPONDANT AU NOMBRE D'ETAPES MAX DANS LE CHAPITRE D'INTRODUCTION
    displayChapter_Intro(step);
  }
  
  displayGameInterface(); //Affichage de l'interface générale
}

  void displayGameInterface() {
  imageMode(CENTER);
  rectMode(CENTER);
  /* DEBUT BOUTON 01 */
  if (mouseX > ((width-width/30)-(620/30)) && mouseX < (((width-width/30)+(620/30))) && mouseY > ((height/18)-(60/3)) && mouseY < ((height/18)+(60/3))) {
    if (!M04_button01_sound) {
      playSound(2);
      M04_button01_sound = true;
    }
    fill(colorIGButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      menuID = 5; //CHANGEMENT DE MENU (interface personnage)
      delay(200);
    }
  } else {
    M04_button01_sound = false;
    fill(colorIGButtonsBackground);
  }
  rect(width-width/30, height/18, 620/15, 60/1.5); //AFFICHAGE BOUTON 01
  image(M04_character_button, width-width/30, height/18); //IMAGE BOUTON 01
  /* FIN BOUTON 01 */
  }
  
  void displayGameDialog(int n, int x, int y) {
    imageMode(CENTER);
    rectMode(RECT);
    fill(colorIGInterface);
    rect (0, height, width, height - height/6);
    textSize(6);
    text(dialogList[n], x, y);
  }

void displayChapter_Intro(int step) {
  if (step == 1) {
    background(intro01);
    playMusic(2);
    displayGameDialog(0, 20, height/3+20);
  }
}