void displayM01_Home() {
  pseudo = "";
  imageMode(CENTER);
  rectMode(CENTER);
  background(M01_Home); //BACKGROUND
  image(game_logo, width/2, 140); //LOGO DU JEU
  playMusic(1);

  /* DEBUT BOUTON 01 */
  if (mouseX > ((width/2)-(620/2)) && mouseX < (((width/2)+(620/2))) && mouseY > (300-(60/2)) && mouseY < (300+(60/2))) {
    if (!M01_button01_sound) {
      playSound(1);
      M01_button01_sound = true;
    }
    fill(colorMButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      menuID = 2; //CHANGEMENT DE MENU (menu suivant)
      delay(200);
    }
  } else {
    M01_button01_sound = false;
    fill(colorMButtonsBackground);
  }
  rect(width/2, 300, 620, 60); //AFFICHAGE BOUTON 01
  /* FIN BOUTON 01 */

  /* DEBUT BOUTON 02 */
  if (mouseX > ((width/2)-(620/2)) && mouseX < (((width/2)+(620/2))) && mouseY > (400-(60/2)) && mouseY < (400+(60/2))) {
    if (!M01_button02_sound) {
      playSound(1);
      M01_button02_sound = true;
    }
    fill(colorMButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      link("http://skydefr.com/projets/realm_of_fantasy/register.php"); //Ouvrir la page internet permettant de s'inscrire
      delay(500);
    }
  } else {
    M01_button02_sound = false;
    fill(colorMButtonsBackground);
  }
  rect(width/2, 400, 620, 60); //AFFICHAGE BOUTON 02
  /* FIN BOUTON 02 */

  /* DEBUT BOUTON 03 */
  if (mouseX > ((width/30)-(620/30)) && mouseX < (((width/30)+(620/30))) && mouseY > ((height-width/32)-(60/3)) && mouseY < ((height-width/32)+(60/3))) {
    if (!M01_button03_sound) {
      //playSound(2);
      M01_button03_sound = true;
    }
    fill(255, 100, 100, 200);
    if (mousePressed && mouseButton == LEFT) {
      println("Fermeture du jeu...");
      exit(); //Fermeture du jeu
    }
  } else {
    M01_button03_sound = false;
    fill(200, 55, 55, 155);
  }
  rect(width/30, height-width/32, 620/15, 60/1.5); //AFFICHAGE BOUTON 03
  image(quit_button, width/30, height-width/32); //IMAGE BOUTON 03
  textSize(14);
  fill(200,80,80,255);
  text("Demo Version Alpha", width-75, 15);
  /* FIN BOUTON 03 */

  /* DEBUT BOUTON 04 */
  if (mouseX > ((width-width/30)-(620/30)) && mouseX < (((width-width/30)+(620/30))) && mouseY > ((height-width/32)-(60/3)) && mouseY < ((height-width/32)+(60/3))) {
    if (!M01_button04_sound) {
      //playSound(2);
      M01_button04_sound = true;
    }
    fill(100, 100, 200, 200);
    if (mousePressed && mouseButton == LEFT) {
      link("http://skydefr.com/projets/realm_of_fantasy/index.php"); //Ouvrir la page internet d'accueil
      delay(500);
    }
  } else {
    M01_button04_sound = false;
    fill(55, 55, 155, 155);
  }
  rect(width-width/30, height-width/32, 620/15, 60/1.5); //AFFICHAGE BOUTON 04
  image(website_button, width-width/30, height-width/32); //IMAGE BOUTON 04
  /* FIN BOUTON 04 */

  textSize(42);
  textAlign(CENTER);
  fill(colorMButtonsText);
  text("Se connecter", width/2, 300+(60/4)); //TEXTE BOUTON 01
  text("S'inscrire", width/2, 400+(60/4)); //TEXTE BOUTON 02
}





void displayM02_Auth() {
  pseudo = "";
  imageMode(CENTER);
  rectMode(CENTER);
  background(M01_Home); //BACKGROUND
  image(game_logo, width/2, 140); //LOGO DU JEU
  playMusic(1);

  /* DEBUTZONE DE TEXTE 01 */
  fill(colorMButtonsBackground);
  if (mouseX > ((width/2)-(620/2)) && mouseX < (((width/2)+(620/2))) && mouseY > (300-(60/2)) && mouseY < (300+(60/2))) {
    fill(colorMTextzoneBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      M02_textzone01 = ""; //Efface la zone de texte
      delay(200);
    }
    if (M02_textzone01 != "Pseudo") {
      M02_showEditing01 = true; 
      if (keyPressed) { //Saisie au clavier dans la zone de texte (avec contraintes de caractères et de longueur)
        if (M02_textzone01.length() <= 16 && ((int(key) >= int('A') && int(key) <= int('Z')) || (int(key) >= int('a') && int(key) <= int('z')) || (int(key) >= int('0') && int(key) <= int('9')))) {
          M02_textzone01 = M02_textzone01 + key;
          delay(200);
        }
      }
    } else {
      M02_showEditing01 = false;
    }
  } else {
    fill(colorMTextzoneBackground);
    M02_showEditing01 = false;
  }
  rect(width/2, 300, 620, 60); //AFFICHAGE ZONE DE TEXTE 01
  if (M02_showEditing01) {
    image(editing_pic, width/1.39, 300); //IMAGE LORS DE D'EDITION EN ZONE DE TEXTE 01
  }
  /* FIN ZONE DE TEXTE 01 */

  /* DEBUT ZONE DE TEXTE 02 */
  if (mouseX > ((width/2)-(620/2)) && mouseX < (((width/2)+(620/2))) && mouseY > (400-(60/2)) && mouseY < (400+(60/2))) {
    fill(colorMTextzoneBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      M02_textzone02 = ""; //Efface la zone de texte
      delay(200);
    }
    if (M02_textzone02 != "Mot de passe") {
      M02_showEditing02 = true; 
      if (keyPressed) { ///Saisie au clavier dans la zone de texte (avec contraintes de caractères et de longueur)
        if (M02_textzone02.length() <= 16 && ((int(key) >= int('A') && int(key) <= int('Z')) || (int(key) >= int('a') && int(key) <= int('z')) || (int(key) >= int('0') && int(key) <= int('9')))) {
          M02_textzone02 = M02_textzone02 + key;
          delay(200);
        }
      }
    } else {
      M02_showEditing02 = false;
    }
  } else {
    fill(colorMTextzoneBackground);
    M02_showEditing02 = false;
  }
  rect(width/2, 400, 620, 60); //AFFICHAGE ZONE DE TEXTE 02
  if (M02_showEditing02) {
    image(editing_pic, width/1.39, 400); //IMAGE LORS DE D'EDITION EN ZONE DE TEXTE 02
  }
  /* FIN ZONE DE TEXTE 02 */

  /* DEBUT BOUTON 03 */
  if (mouseX > ((width/2)-(620/4)) && mouseX < (((width/2)+(620/4))) && mouseY > (500-(60/2)) && mouseY < (500+(60/2))) {
    if (!M02_button03_sound) {
      playSound(1);
      M02_button03_sound = true;
    }
    fill(colorMButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT && M02_textzone01 != "Pseudo" && M02_textzone02 != "Mot de passe") {
      String[] M02_Button02_check = loadStrings("http://skydefr.com/projets/realm_of_fantasy/request-auth.php?pseudo="+M02_textzone01+"&motdepasse="+M02_textzone02);
      if (int(M02_Button02_check[0]) == 731298465) { //Les identifiants saisis sont bien présents dans la base de données
        println("Identification avec succès!");
        M02_button03 = "Succès!";
        M02_button03_timer = 0;
      } else {
        println("Echec lors de l'identification!"); //Les identifiants saisis n'existent pas dans la base de données
        M02_button03 = "Echec!";
        M02_button03_timer = 0;
      }
    }
  } else {
    M02_button03_sound = false;
    fill(colorMButtonsBackground);
  }
  rect(width/2, 500, 620/2, 60); //AFFICHAGE BOUTON 03
  /* FIN BOUTON 03 */

  /* DEBUT BOUTON 04 */
  if (mouseX > ((width/3.175)-(620/20)) && mouseX < (((width/3.175)+(620/20))) && mouseY > (500-(60/2)) && mouseY < (500+(60/2))) {
    if (!M02_button04_sound) {
      //playSound(1);
      M02_button04_sound = true;
    }
    fill(colorMSpecialButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      menuID = 1; //CHANGEMENT DE MENU (retour au menu précédent)
      delay(200);
    }
  } else {
    M02_button04_sound = false;
    fill(colorMSpecialButtonsBackground);
  }
  rect(width/3.175, 500, 620/10, 60); //AFFICHAGE BOUTON 04
  image(back_button, width/3.175, 500); //IMAGE BOUTON 04
  /* FIN BOUTON 04 */

  /* DEBUT BOUTON 05 */
  if (mouseX > ((width/1.459)-(620/20)) && mouseX < (((width/1.459)+(620/20))) && mouseY > (500-(60/2)) && mouseY < (500+(60/2))) {
    if (!M02_button05_sound) {
      //playSound(1);
      M02_button05_sound = true;
    }
    fill(colorMSpecialButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      M02_showHelp = true; //AFICHE UN MESSAGE D'AIDE
    }
  } else {
    M02_button05_sound = false;
    fill(colorMSpecialButtonsBackground);
  }
  rect(width/1.459, 500, 620/10, 60); //AFFICHAGE BOUTON 05
  image(help_button, width/1.459, 500); //IMAGE BOUTON 05
  /* FIN BOUTON 05 */

  textSize(42);
  textAlign(CENTER);
  fill(colorMButtonsText);
  text(M02_textzone01, width/2, 300+(60/4)); //TEXTE BOUTON 01
  text(M02_textzone02, width/2, 400+(60/4)); //TEXTE BOUTON 02
  textSize(34);
  text(M02_button03, width/2, 500+(60/5)); //TEXTE BOUTON 03

  /* DEBUT EVENEMENTS BOUTON 03 (partie qui doit se placer après affichage du texte des boutons !) */
  if (M02_button03 == "Succès!" && M02_button03_timer > 100) { //Connexion avec succès
    pseudo = M02_textzone01;
    menuID = 3; //CHANGEMENT DE MENU
    M02_textzone01 = "Pseudo";
    M02_textzone02 = "Mot de passe";
    M02_button03 = "Connexion";
    M02_button03_timer = 0;
  } else if (M02_button03 == "Echec!" && M02_button03_timer > 50) { //Echec de connexion
    M02_button03 = "Connexion";
    M02_button03_timer = 0;
  } else if (M02_button03 == "Succès!" || M02_button03 == "Echec!") {
    M02_button03_timer++;
  }
  /* FIN EVENEMENTS BOUTON 03 (partie qui doit se placer après affichage du texte des boutons !) */

  /* DEBUT EVENEMENTS BOUTON 05 (partie qui doit se placer en dernier !) */
  if (M02_showHelp) {
    showMessageDialog(null, 
      "Vous devez ici saisir vos identifiants de connexion.\n"+
      "Astuces :\n"+
      "- Cliquer sur une zone de texte efface son contenu.\n"+
      "- Vous pouvez réinitialiser votre mot de passe sur le site.", ">Aide<", PLAIN_MESSAGE);
    M02_showHelp = false;
  }
  /* FIN EVENEMENTS BOUTON 05 (partie qui doit se placer en dernier !) */
}





void displayM03_Principal() {
  imageMode(CENTER);
  rectMode(CENTER);
  background(M01_Home); //BACKGROUND
  image(game_logo, width/2, 140); //LOGO DU JEU
  playMusic(1);

  /* DEBUT BOUTON 01 */
  //if (data_file.exists()) {
  if (mouseX > ((width/2)-(620/2)) && mouseX < (((width/2)+(620/2))) && mouseY > (300-(60/2)) && mouseY < (300+(60/2))) {
    if (!M03_button01_sound) {
      playSound(1);
      M03_button01_sound = true;
    }
    fill(colorMButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      if (lastsave_file.exists()) {
        M04_continuer = true;
        menuID = 4;
        delay(200);
      } else {
        println("Nouvelle partie !"); //Nouvelle partie 
        M04_nouvelle_partie = true;
        menuID = 4;
        delay(200);
      }
    }
    //} else {
    //  fill(colorMButtonsBackground);
    //}
  } else {
      M03_button01_sound = false;
    fill(colorMButtonsBackground);
  }
  rect(width/2, 300, 620, 60); //AFFICHAGE BOUTON 01
  /* FIN BOUTON 01 */

  /* DEBUT BOUTON 02 */
    if (mouseX > ((width/2)-(620/2)) && mouseX < (((width/2)+(620/2))) && mouseY > (400-(60/2)) && mouseY < (400+(60/2))) {
      if (!M03_button02_sound) {
        if (lastsave_file.exists()) {
          playSound(1);
        }
        M03_button02_sound = true;
      }
      if (lastsave_file.exists()) {
        fill(colorMButtonsBackground_Hover);
      } else {
        fill(colorMSpecialButtonsBackground);
      }
      if (mousePressed && mouseButton == LEFT) {
        if (lastsave_file.exists()) {
          deleteStats();
          M04_nouvelle_partie = true;
          menuID = 4;
          delay(200);
        }
      }
    } else {
      M03_button02_sound = false;
      if (lastsave_file.exists()) {
        fill(colorMButtonsBackground);
      } else {
        fill(colorMSpecialButtonsBackground);
      }
    }
  rect(width/2, 400, 620, 60); //AFFICHAGE BOUTON 02
  /* FIN BOUTON 02 */

  /* DEBUT BOUTON 03 */
  if (mouseX > ((width/2)-(620/2)) && mouseX < (((width/2)+(620/2))) && mouseY > (500-(60/2)) && mouseY < (500+(60/2))) {
    if (!M03_button03_sound) {
      //playSound(1);
      M03_button03_sound = true;
    }
    fill(colorMSpecialButtonsBackground);
    if (mousePressed && mouseButton == LEFT) {
      //saveStats();
      //delay(200);
    }
  } else {
    M03_button03_sound = false;
    fill(colorMSpecialButtonsBackground);
  }
  rect(width/2, 500, 620, 60); //AFFICHAGE BOUTON 03
  /* FIN BOUTON 03 */

  /* DEBUT BOUTON 04 */
  if (mouseX > ((width/2)-(620/2)) && mouseX < (((width/2)+(620/2))) && mouseY > (600-(60/2)) && mouseY < (600+(60/2))) {
    if (!M03_button04_sound) {
      playSound(1);
      M03_button04_sound = true;
    }
    fill(colorMButtonsBackground_Hover);
    if (mousePressed && mouseButton == LEFT) {
      pseudo = "";
      menuID = 1; //CHANGEMENT DE MENU (retour au menu de lancement du jeu)
      delay(200);
    }
  } else {
      M03_button04_sound = false;
    fill(colorMButtonsBackground);
  }
  rect(width/2, 600, 620, 60); //AFFICHAGE BOUTON 04
  /* FIN BOUTON 04 */

  textSize(42);
  textAlign(CENTER);
  fill(colorMButtonsText);
  
  text("Nouvelle partie", width/2, 400+(60/4)); //TEXTE BOUTON 02 (NON FONCTIONNEL POUR LE MOMENT)
  text("Gestion des sauvegardes", width/2, 500+(60/4)); //TEXTE BOUTON 03 (NON FONCTIONNEL POUR LE MOMENT)
  text("Se déconnecter", width/2, 600+(60/4)); //TEXTE BOUTON 04

  /* DEBUT EVENEMENTS BOUTON 01 */
  if (lastsave_file.exists()) {
    M03_button01 = "Continuer";
    M03_button02 = "Nouvelle partie";
    //fill(colorMButtonsText);
  } else {
    M03_button01 = "Commencer l'aventure";
    M03_button02 = "";
    //fill(55, 55, 55, 55);
  }
  /* FIN EVENEMENTS BOUTON 01 */
  text(M03_button01, width/2, 300+(60/4)); //TEXTE BOUTON 01
}