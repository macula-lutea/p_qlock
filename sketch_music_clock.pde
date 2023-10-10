import ddf.minim.*;
Minim minim;
AudioPlayer player;
int MAXSCENES = 5;
PImage []scenes = new PImage[MAXSCENES];
PFont f;

void setup() {
  //String[] fontList = PFont.list();
  //printArray(fontList);
  size(720, 720);
  f = createFont("Futura-Bold", 32);
  textFont(f);
  scenes[0] = loadImage("a.png");
  scenes[1] = loadImage("a.png");
  minim = new Minim(this);
  player = minim.loadFile("po.mp3");
  player.play();
  player.printControls();
  frameRate(1);
}

void draw() {
  background(0);
  fill(255);
  text(" " +hour()+" "+minute()+" "+second()+" ", 275, 360);
  text("track name here", 275, 400);

  if (second() % 10 == 1) {
    red();
  }

  if (second() % 10 == 2) {
    green();
  }

  if (second() % 10 == 3) {
    blue();
  }

  if (second() % 10 == 5 || second() % 10 == 6 || second() % 10 == 7 || second() % 10 == 8 || second() % 10 == 9 || second() % 10 == 0) {
    scene();
  }
}

void red() {
    for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
        stroke(255, 0, 0);
        point(x, y);
    }
  }
}

void green() {
    for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
        stroke(0, 255, 0);
        point(x, y);
    }
  }
}

void blue() {
    for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
        stroke(0, 0, 255);
        point(x, y);
    }
  }
}



void scene() {
  background(scenes[0]);
}
