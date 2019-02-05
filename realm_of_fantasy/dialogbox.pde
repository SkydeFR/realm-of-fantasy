/*
void mousePressed(){
  if (dialog.del()) {
    dialog = new textBox ("", -100, -100, 1, 1, 1);
  }
  dialog.update();
}*/

class textBox {
  String texte;
  int xCenter, yCenter;
  int xWidth, yHeight;
  float textsize;
  StringList sentence = new StringList();
  int palier = 0;
  int number_line;
  float number_carac;
  float top;
  boolean click;

  textBox(String texte_, int x, int y, int wi, int he, int textsize_) {
    texte = texte_;
    xCenter = x;
    yCenter = y;
    xWidth = wi;
    yHeight = he;
    textsize = textsize_;
    number_line = int((yHeight - textsize/2)/(textsize + 1));
    number_carac = int((xWidth - textsize/2)/(textsize/2));
    top = yCenter - (yHeight/2) + textsize/4 + textsize/2;
  }

  void create() {

    int count = 0;
    String word[] = split(texte, " ");
    sentence.set(0, "");

    for (int i = 0; i < word.length; i++) {


      if (sentence.get(count).length() + word[i].length() < number_carac) {
        sentence.set(count, sentence.get(count) + " " + word[i]);
      } else {
        sentence.append("");
        count++;
        sentence.set(count, sentence.get(count) + " " + word[i]);
      }
    }

    //println("sizeText = " + texte.length()); 
    //printArray(sentence);
    //println("---------------------");
  }

  void affichage() {
    rectMode(CENTER);
    textAlign(LEFT, CENTER);
    textSize(textsize);
    fill(255);
    rect(xCenter, yCenter, xWidth, yHeight, 15);
    fill(0);
    stroke(0);
    //println(number_line);

    if (number_line < sentence.size()) {
      for (int i = 0; i < number_line; i++) {
        text(sentence.get(palier + i), xCenter - xWidth/2 + textsize/4, i* (textsize) + top);
      }
    } else {
      for (int i = 0; i < sentence.size(); i++) {
        text(sentence.get(i), xCenter - xWidth/2 + textsize/4, i* (textsize) + top);
      }
    }
    textAlign(CENTER);
  }

  void update() {
    if (mouseX < xCenter + (xWidth/2) && mouseX > xCenter - (xWidth/2) && mouseY < yCenter + (yHeight /2) && mouseY > yCenter - (yHeight /2) ) {
      palier ++;
      if (palier > sentence.size() - number_line) {
        palier = sentence.size() - number_line;
      }
    }
  }

  boolean del() {
    if (sentence.size () == number_line + palier) {
      return true;
    } else {
      return false;
    }
  }

  void debugg() {
    println("palier = " + palier);
    println("sentencesize = " + sentence.size());
    println("number_line = " + number_line);
    println("---------------------");
    printArray(sentence);
    println("---------------------");
  }
}