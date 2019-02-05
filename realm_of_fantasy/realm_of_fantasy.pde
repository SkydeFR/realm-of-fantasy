import static javax.swing.JOptionPane.*; //Bibliothèque permettant d'afficher des messages pop-up
//import java.io.*;
//import java.net.URL;
import javax.sound.sampled.*; //Bibliothèque permettant de jouer de la musique, des sons...
//import javax.swing.*;

/* DEBUT PARAMETRES */
String game_name;
PImage game_icon;
PImage cursor_01;
static final String LASTSAVE_FILE = "last_save.dat";
File lastsave_file;
String pseudo;
int Nmusic;
File soundFile;
AudioInputStream audioIn;
Clip clip;
/* FIN PARAMETRES */

/* DEBUT MENUS */
int menuID;
PImage game_logo;
color colorMButtonsBackground, colorMButtonsBackground_Hover, colorMButtonsText;
color colorMTextzoneBackground, colorMTextzoneBackground_Hover;
color colorMSpecialButtonsBackground, colorMSpecialButtonsBackground_Hover;
PImage M01_Home;
PImage quit_button, website_button;
PImage M02_Auth;
String M02_textzone01, M02_textzone02, M02_button03;
int M02_button03_timer;
PImage back_button, help_button;
PImage editing_pic;
boolean M02_showHelp, M02_showEditing01, M02_showEditing02;
PImage M03_Principal;
String M03_button01;
boolean M01_button01_sound, M01_button02_sound, M01_button03_sound, M01_button04_sound;
boolean M02_button03_sound, M02_button04_sound, M02_button05_sound;
boolean M03_button01_sound, M03_button02_sound, M03_button03_sound, M03_button04_sound;
/* FIN MENUS */

/* DEBUT INGAME */
String[] dialogList;
int time_tmp, save_counter;
boolean M04_continuer, M04_nouvelle_partie;
boolean M04_button01_sound;
color colorIGButtonsBackground, colorIGButtonsBackground_Hover;
color colorIGInterface;
PImage M04_character_button;
PImage M05_characterIT_background;
PImage intro01;
int step;
String chapter;
/* FIN INGAME */

void setup() {
  /* DEBUT PARAMETRES */
  size (1280, 720); //Taille de la fenêtre de jeu (1280*720)
  smooth();
  game_name = "Realm Of Fantasy"; //Nom de la fenêtre de jeu (= nom du jeu)
  game_icon = loadImage("game_icon.png"); //Icone de la fenêtre de jeu (= icone du jeu)
  cursor_01 = loadImage("cursor_01.png");
  surface.setTitle(game_name); 
  surface.setIcon(game_icon);
  surface.setCursor(cursor_01, 1, 1); //Défini un curseur spéciale pour la fenêtre de jeu (= curseur en jeu)
  lastsave_file = new File(dataPath("last_save.dat"));
  pseudo = ""; //Pseudo du joueur connecté nul car le joueur n'est pas connecté au lancement du jeu
  Nmusic = 1;
  try {
    // Open an audio input stream.
    soundFile = new File(sketchPath()+"\\music"+Nmusic+".wav");
    audioIn = AudioSystem.getAudioInputStream(soundFile);
    // Get a sound clip resource.
    clip = AudioSystem.getClip();
    // Open audio clip and load samples from the audio input stream.
    clip.open(audioIn);
    //clip.start();
    clip.loop(Clip.LOOP_CONTINUOUSLY);  // repeat forever
  } 
  catch (UnsupportedAudioFileException e) {
    e.printStackTrace();
  } 
  catch (IOException e) {
    e.printStackTrace();
  } 
  catch (LineUnavailableException e) {
    e.printStackTrace();
  }
  /* FIN PARAMETRES */

  /* DEBUT MENUS */
  game_logo = loadImage("game_logo.png");
  colorMButtonsBackground = color(155, 155, 155, 155); //Couleur par défaut du FOND des bouttons des menus
  colorMButtonsBackground_Hover = color(200, 200, 200, 200); //Couleur par défaut du FOND des bouttons des menus avec survole de la souris par-dessus
  colorMButtonsText = color(0, 0, 0, 200); //Couleur par défaut du TEXTE des bouttons des menus
  colorMTextzoneBackground = color(155, 155, 100, 155); //Couleur par défaut du FOND des zones de textes des menus
  colorMTextzoneBackground_Hover = color(200, 200, 155, 200); //Couleur par défaut du FOND des zones de textes des menus avec survole de la souris par-dessus
  colorMSpecialButtonsBackground = color(155, 155, 155, 55); //Couleur par défaut du FOND des bouttons spéciaux des menus
  colorMSpecialButtonsBackground_Hover = color(200, 200, 200, 100); //Couleur par défaut du FOND des bouttons spéciaux des menus avec survole de la souris par-dessus
  M01_Home = loadImage("M01_Home.png");
  quit_button = loadImage("M01_quit_button.png");
  quit_button.resize(32, 32);
  website_button = loadImage("M01_website_button.png");
  website_button.resize(32, 32);
  M02_Auth = loadImage("M01_Home.png");
  M02_textzone01 = "Pseudo";
  M02_textzone02 = "Mot de passe";
  M02_button03 = "Connexion";
  back_button = loadImage("M02_back_button.png");
  back_button.resize(56, 56);
  help_button = loadImage("M02_help_button.png");
  help_button.resize(52, 52);
  editing_pic = loadImage("M02_editing_pic.png");
  editing_pic.resize(30, 30);
  M02_showHelp = false;
  M02_showEditing01 = false;
  M03_Principal = loadImage("M01_Home.png");
  M03_button01 = "Nouvelle partie";
  M01_button01_sound = false;
  M01_button02_sound = false;
  M01_button03_sound = false;
  M01_button04_sound = false;
  M02_button03_sound = false;
  M02_button04_sound = false;
  M02_button05_sound = false;
  M03_button01_sound = false;
  M03_button02_sound = false;
  M03_button03_sound = false;
  M03_button04_sound = false;
  menuID = 1; //Premier menu au lancement du jeu = Menu de connexion (1)
  background(M01_Home); //BACKGROUND
  /* FIN MENUS */

  /* DEBUT INGAME */
  loadDialogs();
  time_tmp = 0; //Permet de chronometrer le temps qui passe
  save_counter = 0; //Variable "chronomètre" (en seconde)
  M04_continuer = false;
  M04_nouvelle_partie = false;
  colorIGButtonsBackground_Hover = color(255, 125, 75, 200);
  colorIGButtonsBackground = color(200, 75, 25, 155);
  colorIGInterface = color(50,125,125,100);
  M04_character_button = loadImage("M05_character_button.png");
  M04_character_button.resize(32, 32);
  M05_characterIT_background = loadImage("M05_characterIT_background.png");
  intro01 = loadImage("Intro01.png");
  /* FIN INGAME */
}

void draw() {
  if (menuID == 1) {
    displayM01_Home();
  } else if (menuID == 2) {
    displayM02_Auth();
  } else if (menuID == 3) {
    displayM03_Principal();
  } else if (menuID == 4) {
    displayM04_InGame();
  } else if (menuID == 5) {
    displayM05_Character();
  }
}

void keyPressed() {
  /* DEBUT CODE TEMPORAIRE POUR TESTS */
  if (key == '0') {
    if (pseudo != "") {
      println("Pseudo en ligne : "+pseudo);
    } else {
      println("Aucun pseudo en ligne.");
    }
  } else if (key == '5') {
    M04_continuer = true;
    menuID = 4;
  } else if (key == '2' && menuID == 4) {
    saveStats();
  } else if (key == '9') {
    menuID = 1;
  }
  /* FIN CODE TEMPORAIRE POUR TESTS */
}