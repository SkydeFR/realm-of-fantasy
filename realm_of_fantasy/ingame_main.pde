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

  if (step <= 100) { //100 = VALEUR TEMPORAIRE CORRESPONDANT AU NOMBRE D'ETAPES MAX DANS LE CHAPITRE D'INTRODUCTION
    chapter = "Introduction";
    displayChapter_Intro(step);
  } else if (step == 999) {
    chapter = "End";
    displayEnd();
  }

  if (step != 999) {
    displayGameInterface(); //Affichage de l'interface générale
  }
}

void displayGameInterface() {
  imageMode(CENTER);
  rectMode(CENTER);
  /* DEBUT BOUTON 01 */
  if (mouseX > ((width-width/30)-(620/30)) && mouseX < (((width-width/30)+(620/30))) && mouseY > ((height/18)-(60/3)+70) && mouseY < ((height/18)+(60/3))+70) {
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
  rect(width-width/30, height/18+70, 620/15, 60/1.5); //AFFICHAGE BOUTON 01
  image(M04_character_button, width-width/30, height/18+70); //IMAGE BOUTON 01
  /* FIN BOUTON 01 */
  
  /* DEBUT BOUTON 02 */
  if (mouseX > ((width-width/30)-(620/20)) && mouseX < (((width-width/30)+(620/20))) && mouseY > ((height/18)-(60/2)) && mouseY < ((height/18)+(60/2))) {
    if (!M04_button02_sound) {
      playSound(2);
      M04_button02_sound = true;
    }
    fill(colorMSpecialButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      saveStats(); //SAUVEGARDE
      menuID = 3; //RETOUR AU MENU PRINCIPAL
      delay(200);
    }
  } else {
    M04_button02_sound = false;
    fill(colorMSpecialButtonsBackground);
  }
  rect(width-width/30, height/18, 620/10, 60); //AFFICHAGE BOUTON 02
  image(back_button, width-width/30, height/18); //IMAGE BOUTON 02
  /* FIN BOUTON 02 */
}

void displayGameDialog(String dialogTMP, int textSize) {
  dialogBox_txt = dialogTMP;
  dialog = new textBox(dialogBox_txt, dialogBox_constX, dialogBox_constY, dialogBox_constWidth, dialogBox_constHeight, textSize);
  dialog.create();
  dialog.affichage();
}

void displayChapter_Intro(int stepTMP) {
  playMusic(2);
  if (stepTMP == 1) {
    background(intro01);
    image (vets, width/2, height/2);
    displayGameDialog(dialogList[0], 24);
    if (mouseX > 700 && mouseX < 1280 && mouseY > 400 && mouseY < 700) {
      if (mousePressed) {
        step = 2;
        delay(200);
      }
    }
  } else if (stepTMP == 2) {
    background(intro01);
    image (vets, width/2, height/2);
    displayGameDialog(dialogList[1], 24);
    if (mouseX > 840 && mouseX < 900 && mouseY > 410 && mouseY < 460) {
      if (mousePressed) {
        step = 3;
        delay(200);
      }
    }
  } else if (stepTMP == 3) {
    background(intro01);
    displayGameDialog(dialogList[2], 24);
    if (mousePressed) {
      step = 4;
        delay(200);
    }
  } else if (stepTMP == 4) {
    background(intro01);
    image (door, width/2, 690);
    if (mouseX > 615 && mouseX < 665 && mouseY > 665 && mouseY < 725) {
      if (mousePressed) {
        step = 5;
        delay(200);
      }
    }
  } else if (stepTMP == 5) {
    background(bateau);
    if (mousePressed) {
      step = 6;
        delay(200);
    }
  } else if (stepTMP == 6) {
    background(bateau);
    displayGameDialog(dialogList[3], 24);
    if (mousePressed) {
      step = 7;
        delay(200);
    }
  } else if (stepTMP == 7) {
    background(0);
    displayGameDialog(dialogList[4], 24);
    if (mousePressed) {
      step = 8;
        delay(200);
    }
  } else if (stepTMP == 8) {
    background(intro01);
    displayGameDialog(dialogList[5], 24);
    image (vets, width/2, height/2);
    if (mouseX > 700 && mouseX < 1280 && mouseY > 400 && mouseY < 600) {
      if (mousePressed) {
        step = 9;
        delay(200);
      }
    }
  } else if (stepTMP == 9) {
    background(intro01);
    displayGameDialog(dialogList[6], 24);
    image (vets, width/2, height/2);
    if (mouseX > 840 && mouseX < 900 && mouseY > 410 && mouseY < 460) {
      if (mousePressed) {
        step = 10;
        delay(200);
      }
    }
  } else if (stepTMP == 10) {
    background(intro01);
    displayGameDialog(dialogList[7], 24);
    if (mousePressed) {
      step = 11;
        delay(200);
    }
  } else if (stepTMP == 11) {
    background(intro01);
    image (door, width/2, 690);
    if (mouseX > 615 && mouseX < 665 && mouseY > 665 && mouseY < 725) {
      if (mousePressed) {
        step = 12;
        delay(200);
      }
    }
  } else if (stepTMP == 12) {
    background(bateau);
    if (mousePressed) {
      step = 13;
        delay(200);
    }
  } else if (stepTMP == 13) {
    background(bateau);
    displayGameDialog(dialogList[8], 24);
    if (mousePressed) {
      step = 99;
        delay(200);
    }
  } else if (stepTMP == 99) {
    background(0);
    displayGameDialog(dialogList[899], 24);
      if (mousePressed) {
        step = 14;
        delay(200);
      }
  } else if (stepTMP == 14) {
    background(ile);
    displayGameDialog(dialogList[9], 24);
    if (mousePressed) {
      step = 15;
        delay(200);
    }
  } else if (stepTMP == 15) {
    background(ile);
    image (goleft, 480, 515);
    if (mouseX > 450 && mouseX < 510 && mouseY > 495 && mouseY < 535) {
      if (mousePressed) {
        step = 999;
        delay(200);
      }
    }
  }/* else if (stepTMP == 16) {
    background(forest01);
    image (goleft, 480, 515);
    if (mouseX > 450 && mouseX < 510 && mouseY > 495 && mouseY < 535) {
      if (mousePressed) {
        step = 17;
        delay(200);
      }
    }
  } else if (stepTMP == 17) {
    background(forest02);
    image (goleft, 480, 515);
    if (mouseX > 450 && mouseX < 510 && mouseY > 495 && mouseY < 535) {
      if (mousePressed) {
        step = 18;
        delay(200);
      }
    }
  } else if (stepTMP == 18) {
    background(towndoor);
    displayGameDialog(dialogList[10], 24);
    if (mousePressed) {
      step = 19;
        delay(200);
    }
  } else if (stepTMP == 19) {
    background(towndoor);
    displayGameDialog(dialogList[11], 24);
    rectMode(RECT);
    rect (200, 700, 1080, 650);
    if (mousePressed) {
      step = 20;
        delay(200);
    }
  }
  */
}

void displayEnd() {
    background(55,55,55);
    playMusic(1);
    fill(10,10,10);
    textSize(100);
    text("Fin de démo !", width/2, height/3);
    
    /* DEBUT BOUTON 999 */
    if (mouseX > ((width/2)-(620/2)) && mouseX < (((width/2)+(620/2))) && mouseY > (400-(60/2)) && mouseY < (400+(60/2))) {
    if (!M04_button999_sound) {
      playSound(1);
      M04_button999_sound = true;
    }
    fill(colorMButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      saveStats(); //SAUVEGARDE
      menuID = 3; //CHANGEMENT DE MENU (retour au menu principal)
      delay(200);
    }
  } else {
      M04_button999_sound = false;
    fill(colorMButtonsBackground);
  }
  rect(width/2, 400, 620, 60); //AFFICHAGE BOUTON 999
  textSize(42);
  text("Retour au menu principal", width/2, 400+(60/4)); //TEXTE BOUTON 999
    /* FIN BOUTON 01 */
}