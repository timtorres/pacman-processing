Pacman pacman;
PImage pacmanImg;

void setup(){
  size(650, 650);
  background(0);
  frameRate(200);
  noSmooth(); //Need this because anti-alisasing introduces more colors that I have to check against
  //pacmanImg = loadImage("pacmanClosedR.png"); //didn't get this far
  //image(pacmanImg, 325, 450);
  pacman = new Pacman();
  pacman.drawPac();
}

void draw(){
//pacman.getXY();
loadPixels(); //Used for collision detection later
if (keyCode == UP){pacman.drawPac();pacman.pacUp();}
if (keyCode == RIGHT){pacman.drawPac();pacman.pacRight();}
if (keyCode == DOWN){pacman.drawPac();pacman.pacDown();}
if (keyCode == LEFT){pacman.drawPac();pacman.pacLeft();}
}
