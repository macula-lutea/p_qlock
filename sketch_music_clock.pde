import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioMetaData metadata;
int MAXSCENES = 2;
PImage []scenes = new PImage[MAXSCENES];
PFont f;
int sceneCount = 0;

int RED = #FF0000;
int GREEN = #00FF00;
int BLUE = #0000FF;

void setup() {
  size(720, 720);
  f = createFont("Futura-Bold", 32);
  textFont(f);
  scenes[0] = loadImage("a.png");
  minim = new Minim(this);
  player = minim.loadFile("fs2.mp3");
  player.play();
  metadata = player.getMetaData();
  frameRate(1);
}

String pad() {
  if (second() < 10) {
   return "0";
  }
  return "";
}


void draw() {
  background(0);
  fill(255);
  text(" " +hour()+" "+minute()+" "+pad()+second()+" ", 275, 360);
  text(metadata.title(), 100, 420);

  if (second() % 10 == 0) {
    showColor(RED);
  }

  if (second() % 10 == 1) {
    showColor(GREEN);
  }

  if (second() % 10 == 2) {
    showColor(BLUE);
  }

  if (second() % 10 == 5 || second() % 10 == 6 || second() % 10 == 7 || second() % 10 == 8 || second() % 10 == 9 ) {
    scene();
  }
}

void showColor(int c) {
    for(int y = 0; y < height; y++){
      for(int x = 0; x < width; x++){
        stroke(c);
        point(x, y);
    }
  }
}

void scene() {
  background(scenes[0]);
}


void keyPressed()
{
  if (player.isPlaying())
  {
    player.pause();
  }
}
