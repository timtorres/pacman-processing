class Dots{
  //fields
  boolean isActive;
  int[][] no = {{100,100, 100,100}, {200,100, 250,100},
                {400,100, 450,100}, {550,100, 550,100},
                {0  ,250, 125,350}, {525,250, 650,350},
                {175,225, 475,375}
               };
  
  //constructor
  Dots(){
    isActive = false;
  }
  
  //methods
  boolean drawDots(int x, int y){
    color c = #000000;
    boolean draw = true;
    loadPixels();
    fill(255);
    noStroke();
    /*This beautiful piece of logic takes the location of where the dot would be drawn and checks the color
      value of every pixel in a 10x10 square (x,y = upper-left corner) and if ANY of them are not black, it
      won't draw a dot there. Also sets the dot to active, as in there are dot objects filling the whole 
      screen, but only some of them are getting drawn(active). Also when they're eaten, they're deactivated.
      Takes care of not drawing dots in my walls, but not in boxed-in regions.
    */
    for (int i = x*25; i < x*25+10; i++){
      for (int j = y*25; j < y*25+10; j++){  
        if (pixels[i+j*width] != c){draw = false; break;} else {isActive = true;}
      }
    }
    
    /*INSERT LOGIC TO NOT DRAW DOTS IN CERTAIN PLACES HERE LOL
      If there is a dot going to be drawn within the predefined coordinates of a rectangle defined in no[][]
      then don't draw it. That simple. */
    for (int i = 0; i < no.length; i++){
      if (x*25 >= no[i][0]-10 && y*25 >= no[i][1]-10 && 
          x*25 <= no[i][2]+10 && y*25 <= no[i][3]+10){draw = false;}
    }
    
    if (draw){ellipse(x*25,y*25, 5,5);}
    
    return isActive;
  }
  
  /* Normally a set function doesn't return anything, but doing this saves me making another method and call. 
     I'm using this logic in case I make the call to kill the same dot twice in a row. That would increase my
     score by 2. This checks to see if it's dead, and if it isn't, it'll kill it and increase the score
     */     
  boolean setDotStatus(boolean active_){
    boolean dead = false;
    if (isActive != active_) {dead = true;} 
      else {dead = false;} 
    isActive = active_;
    return dead;
  }
  boolean getDotStatus(){return isActive;}
  
}//eof
