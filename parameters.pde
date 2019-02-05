void saveStats() {
  println("Sauvegarde de la partie effectuée !"); //Sauvegarde
  String[] data_lines = {
    str(step), chapter
  };
  saveStrings(dataFile(LASTSAVE_FILE), data_lines);
}

void loadStats() {
  println("Chargement des données de la partie !"); //Chargement de la sauvegarde
  String[] data_lines = loadStrings(LASTSAVE_FILE);
  step = int(data_lines[0]);
  chapter = data_lines[1];
  println(chapter+" Partie "+step); //Chargement de la sauvegarde
}

void playMusic(int n) {
  if (Nmusic != n) {
    Nmusic = n;
    if (clip.isRunning()) clip.stop();
    try {
      soundFile = new File(sketchPath()+"\\music"+Nmusic+".wav");
      audioIn = AudioSystem.getAudioInputStream(soundFile);
      clip = AudioSystem.getClip();
      clip.open(audioIn);
      clip.loop(Clip.LOOP_CONTINUOUSLY);
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
  }
}

void playSound(int n) {
    try {
      File TMP_soundFile = new File(sketchPath()+"\\sound"+n+".wav");
      AudioInputStream TMP_audioIn = AudioSystem.getAudioInputStream(TMP_soundFile);
      Clip TMP_clip = AudioSystem.getClip();
      TMP_clip.open(TMP_audioIn);
      TMP_clip.start();
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
}