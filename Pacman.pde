class Pacman{
  //fields
  Level level;
  int lives, score, x, y, speed, radius, rad, thresh;
  boolean canU, canR, canD, canL;
  PImage[] pacman;
  String[] pacmanImg = {"pacmanClosedL.png", "pacmanHalfwayL.png", "pacmanOpenL.png",
                      "pacmanClosedR.png", "pacmanHalfwayR.png", "pacmanOpenR.png" };
  color b,w;
  
  //constructor
  Pacman(){
    lives = 3;
    score = 0;
    x = 325;
    y = 450;
    speed = 3; //Specify the speed of pac here
    radius = 30; //Radius of the default pacman
    rad = radius/2 + 2; //Just putting this here for some easier calculations later
    thresh = 7; //Specifies how close I have to be to the intersection of the grid in order to turn
    canU = true; canR = true; canD = true; canL = true; //Used for collision detection
    b = color(#000000); w = color(#ffffff); //Black for background, white for dots
    pacman = new PImage[6];
    level = new Level();
    level.drawLevel(); //Drawing my levels here instead of main because it didn't work to redraw bg there
    level.drawDots();
  }
  
  //methods
  //////////////////Just so you can see a fraction of the pain I was going through//////////////////// 
  //for (int i = x-rad; i <= x+rad; i++){println(get(i,y-rad)); if (get(i,y-rad) == -16777216){canU = true;} else {println("STOP");canU = false;break;}}
    /*for (int i = 0; i < 20; i++){
      println(int(x+(radius-14)*sin(TWO_PI/20*i)) + ", " + int(y+(radius-14)*cos(TWO_PI/20*i)));*/
      //stroke(255);
      //point(int(x+(radius-14)*sin(TWO_PI/20*i)),int(y+(radius-14)*cos(TWO_PI/20*i))); noStroke();
      /*get(int(x+(radius-14)*sin(TWO_PI/20*i)), int(y+(radius-14)*cos(TWO_PI/20*i))*/ //alternate test
      /*if (pixels[int(y+(radius-14)*cos(TWO_PI/20*i))*width+int(x+(radius-14)*sin(TWO_PI/20*i))] != -16777216){
      canU = false; println("cant move");break;} else {canU = true;}}*/
      //point(x, y-rad);
      
  /*boolean canMove(){
    boolean canMove = false;
    color b = -16777216; color w = -1; color yel = -256;
    int rad = radius/2+1;
    loadPixels();
    //Same(ish) logic as the bit in the Dots class. Checks the 23x35 square of the image to see
    //if there's any blue and returns false if there is
    for (int i = x-12; i < x+12; i++){
      for (int j = y-12; j < y+12; j++){  
        if (pixels[i+j*width] != b){
          canMove = false; 
          println("Can't move homie"); break;
        } else {canMove = true; println("Can move");} 
      }
    }
    //println(x + " " + y);
    if (get(x-rad,y) == -16777216 || get(x-rad,y-rad) == -1 || get(x-rad,y-rad) == -256 ||
        get(x+rad,y) == -16777216 || get(x+rad,y+rad) == -1 || get(x+rad,y+rad) == -256 ||
        get(x,y+rad) == -16777216 || get(x-rad,y+rad) == -1 || get(x-rad,y+rad) == -256 ||
        get(x,y-rad) == -16777216 || get(x+rad,y-rad) == -1 || get(x+rad,y-rad) == -256 ){
        println(get(x-rad,y-rad)); canMove = true;
      } else {println(get(x-rad,y) + " Can't move homie");}
    return canMove;
  }*/
  
  void drawPac(){
    level.drawLevel();
    ellipseMode(CENTER);
    fill(#ffff00); ellipse(x,y, 30,30);
    if (x > 630 && y == 300) {x = 30;} //If he goes off the edge of the screen in those two parts, stick him
    if (x < 30 && y == 300) {x = 630;} //on the other side
    //Score keeper
    fill(0);
    rect(160,600, 200,100);
    textSize(30);
    fill(#ffff00);
    text("SCORE: ", 50, 625);
    fill(#ffffff);
    text(score, 170, 625);
    fill(#ffff00);
  }
  
  void pacUp(){
    //Might keep this if I make it an image
    /*imageMode(CENTER);
    for (int i = 0; i < 6; i++){pacman[i] = loadImage(pacmanImg[i]);}
    fill(0);
    rectMode(CENTER);
    if (arrow_ == 1){
      while(canMove()){
        y-=1; rect(x,y+1, 26,35); image(pacman[0], x, y);
      }
    }*/
    
    /* This logic is the same for the other three methods. Since we're going up, get(x,y-rad) checks the color of the top middle
       pixel of pacman. If it's black or white, set continue variable to true and keep going. Next I'm checking to see if my current 
       X value lays on the 50x50 grid. Because it would be difficult to press the arrow key at the exact coordinate that I'm allowed
       to turn, I have a threshold of +-5 pixels in which I'm allowed to press the key to turn. If I continued moving with my x value
       plus or minus anything within that threshold, it will throw me off my grid (and into my walls), and so I'm adding that i value 
       back to X. Additionally, if my collision detector is white, meaning I'm on a dot, then I destroy that dot. *sigh*
    
    */
    if (get(x,y-rad) == b || get(x,y-rad) == w){
      for (int i = -thresh; i <= thresh; i++){
        if ((x+i)%50 == 0){
          if (get(x,y-rad) == w){if (level.destroyDot(x, y-rad)){score++;}}
          canU = true; x += i; break;
        }
      }
    } else {println("Can't move up"); canU = false;}
      
    if (canU){
      y-=speed;
      ellipse(x,y, radius,radius);
    }
  } //End pacUp
  
  void pacRight(){
    if (get(x+rad,y) == b || get(x+rad,y) == w){
      for (int i = -thresh; i <= thresh; i++){
        if ((y+i)%50 == 0){
          if (get(x+rad,y) == w){if (level.destroyDot(x+rad,y)){score++;}}
          canR = true; y += i; break;
        }
      }
    } else {println("Can't move right"); canR = false;}

    if (canR){
      x+=speed;
      ellipse(x,y, radius,radius);
    }
  } //end pacRight
  
  void pacDown(){
    if (get(x,y+rad) == b || get(x,y+rad) == w){
      for (int i = -thresh; i <= thresh; i++){
        if ((x+i)%50 == 0){
          if (get(x,y+rad) == w){if (level.destroyDot(x,y+rad)){score++;}}
          canD = true; x += i; break;
        }
      }
    } else {println("Can't move down"); canD = false;}
  
    if (canD){
      y+=speed;
      ellipse(x,y, radius,radius);
    }
  } //end pacDown
  
  void pacLeft(){  
    if (get(x-rad,y) != b || get(x-rad,y) != w){
      for (int i = -thresh; i <= thresh; i++){
        if ((y+i)%50 == 0){
          if (get(x-rad,y) == w){if (level.destroyDot(x-rad,y)){score++;}}
          canL = true; y += i; break;
        }
      }
    } else {println("Can't move left"); canL = false;}
    
    if (canL){
      x-=speed;
      ellipse(x,y, radius,radius);
    }
  } //end pacLeft
  
  //For debuggin'
  void getXY(){println(x + ", " + y);}
  
}//eof
