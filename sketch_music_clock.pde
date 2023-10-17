import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioMetaData metadata;

PFont f;

int MAXSCENES = 5;
PImage []scenes = new PImage[MAXSCENES];
int sceneCount;

void setup() {
  size(720, 720);
  frameRate(2);
  
  minim = new Minim(this);
  player = minim.loadFile("fs2.mp3");
  player.play();
  metadata = player.getMetaData();
  
  f = createFont("Futura-Bold", 32);
  textFont(f);

  sceneCount = 0;
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

  if (second() % 10 == 0 || 
      second() % 10 == 1 || 
      second() % 10 == 2 || 
      second() % 10 == 3 ||
      second() % 10 == 4 || 
      second() % 10 == 5 ) {
    particles();
  } else {
    scene();
  }
    
}

void particles() {
  stroke(random(255), random(255), random(255));
  for (int i = 0; i <= 10000; i++) {
    point(random(720), random(720));
  }
}

void scene() {
  background(#000000);
}


void keyPressed()
{
  if (player.isPlaying())
  {
    player.pause();
  }
}
