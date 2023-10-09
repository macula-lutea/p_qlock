import ddf.minim.*;
Minim minim;
AudioPlayer player;
int MAXSCENES = 5;
PImage []scenes = new PImage[MAXSCENES];

void setup() {
  size(720, 720);
  scenes[0] = loadImage("a.jpg");
  scenes[1] = loadImage("a.jpg");
  minim = new Minim(this);
  player = minim.loadFile("po.mp3");
  player.play();
  player.printControls();
  frameRate(10.0);
}

void draw() {
  background(0);
  int pos = 0;
  pos = player.position() / 1000;
  if (pos != 0 && pos % 8 == 0) {
    scene();
  }
  fill(255);
  //text("Position: "+pos, 10, 40);
  text(" " +hour()+" "+minute()+" "+second()+" ", 360, 360);
}


void scene() {
  background(scenes[0]);
}
