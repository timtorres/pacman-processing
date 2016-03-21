class Level{
  //fields
  Block[][] level1;
  int x = 13; int y = 12;
  int dotsX = x*2; int dotsY = y*2;
  Dots[][] level1Dots;
  
  //constructor
  Level(){
    level1 = new Block[x][y];
    // Creates empty dot objects
    level1Dots = new Dots[dotsX][dotsY];
    for (int x2 = 0; x2 < dotsX; x2++){
      for (int y2 = 0; y2 < dotsY; y2++){
        level1Dots[x2][y2] = new Dots();
      }//end y loop
    }//end x loop
    
    // xcoord, ycoord, type(v, h, c, p, t), angle(1 = up right(up), 2 = low right(right), 
    // 3 = low left(down), 4 = up left(left)
    level1[0][0] = new Block(0,0, 'c', 2);
    level1[1][0] = new Block(1,0, 'h');
    level1[2][0] = new Block(2,0, 'h');
    level1[3][0] = new Block(3,0, 'h');
    level1[4][0] = new Block(4,0, 'h');
    level1[5][0] = new Block(5,0, 'h');
    level1[6][0] = new Block(6,0, 't', 3);
    level1[7][0] = new Block(7,0, 'h');
    level1[8][0] = new Block(8,0, 'h');
    level1[9][0] = new Block(9,0, 'h');
    level1[10][0] = new Block(10,0, 'h');
    level1[11][0] = new Block(11,0, 'h');
    level1[12][0] = new Block(12,0, 'c', 3);
    
    //Row 2
    level1[0][1] = new Block(0,1, 'v');
    level1[1][1] = new Block(1,1, 'c', 2);
    level1[2][1] = new Block(2,1, 'c', 3);
    level1[3][1] = new Block(3,1, 'c', 2);
    level1[4][1] = new Block(4,1, 'h');
    level1[5][1] = new Block(5,1, 'c', 3);
    level1[6][1] = new Block(6,1, 'v');
    level1[7][1] = new Block(7,1, 'c', 2);
    level1[8][1] = new Block(8,1, 'h');
    level1[9][1] = new Block(9,1, 'c', 3);
    level1[10][1] = new Block(10,1, 'c', 2);
    level1[11][1] = new Block(11,1, 'c', 3);
    level1[12][1] = new Block(12,1, 'v');
    
    //Row 3
    level1[0][2] = new Block(0,2, 'v');
    level1[1][2] = new Block(1,2, 'c', 1);
    level1[2][2] = new Block(2,2, 'c', 4);
    level1[3][2] = new Block(3,2, 'c', 1);
    level1[4][2] = new Block(4,2, 'h');
    level1[5][2] = new Block(5,2, 'c', 4);
    level1[6][2] = new Block(6,2, 'p', 3);
    level1[7][2] = new Block(7,2, 'c', 1);
    level1[8][2] = new Block(8,2, 'h');
    level1[9][2] = new Block(9,2, 'c', 4);
    level1[10][2] = new Block(10,2, 'c', 1);
    level1[11][2] = new Block(11,2, 'c', 4);
    level1[12][2] = new Block(12,2, 'v');
    
    //Row 4
    level1[0][3] = new Block(0,3, 'v');
    level1[1][3] = new Block(1,3, 'p', 4);
    level1[2][3] = new Block(2,3, 'p', 2);
    level1[3][3] = new Block(3,3, 'p', 1);
    level1[4][3] = new Block(4,3, 'p', 4);
    level1[5][3] = new Block(5,3, 'h');
    level1[6][3] = new Block(6,3, 't', 3);
    level1[7][3] = new Block(7,3, 'h');
    level1[8][3] = new Block(8,3, 'p', 2);
    level1[9][3] = new Block(9,3, 'p', 1);
    level1[10][3] = new Block(10,3, 'p', 4);
    level1[11][3] = new Block(11,3, 'p', 2);
    level1[12][3] = new Block(12,3, 'v');
    
    //Row 5
    level1[0][4] = new Block(0,4, 'c', 1);
    level1[1][4] = new Block(1,4, 'h');
    level1[2][4] = new Block(2,4, 'c', 3);
    level1[3][4] = new Block(3,4, 't', 2);
    level1[4][4] = new Block(4,4, 'h');
    level1[5][4] = new Block(5,4, 'p', 2);
    level1[6][4] = new Block(6,4, 'p', 3);
    level1[7][4] = new Block(7,4, 'p', 4);
    level1[8][4] = new Block(8,4, 'h');
    level1[9][4] = new Block(9,4, 't', 4);
    level1[10][4] = new Block(10,4, 'c', 2);
    level1[11][4] = new Block(11,4, 'h');
    level1[12][4] = new Block(12,4, 'c', 4);
    
    //Row 6
    level1[0][5] = new Block(0,5, 'p', 4);
    level1[1][5] = new Block(1,5, 'h');
    level1[2][5] = new Block(2,5, 'c', 4);
    level1[3][5] = new Block(3,5, 'p', 3);
    level1[4][5] = new Block(4,5, 'c', 2);
    level1[5][5] = new Block(5,5, 'p', 2);
    level1[6][5] = new Block(6,5);
    level1[7][5] = new Block(7,5, 'p', 4);
    level1[8][5] = new Block(8,5, 'c', 3);
    level1[9][5] = new Block(9,5, 'p', 3);
    level1[10][5] = new Block(10,5, 'c', 1);
    level1[11][5] = new Block(11,5, 'h');
    level1[12][5] = new Block(12,5, 'p', 2);
    
    //Row 7
    level1[0][6] = new Block(0,6, 'p', 4);
    level1[1][6] = new Block(1,6, 'h');
    level1[2][6] = new Block(2,6, 'c', 3);
    level1[3][6] = new Block(3,6, 'p', 1);
    level1[4][6] = new Block(4,6, 'c', 1);
    level1[5][6] = new Block(5,6, 'h');
    level1[6][6] = new Block(6,6, 'h');
    level1[7][6] = new Block(7,6, 'h');
    level1[8][6] = new Block(8,6, 'c', 4);
    level1[9][6] = new Block(9,6, 'p', 1);
    level1[10][6] = new Block(10,6, 'c', 2);
    level1[11][6] = new Block(11,6, 'h');
    level1[12][6] = new Block(12,6, 'p', 2);
    
    //Row 8
    level1[0][7] = new Block(0,7, 'c', 2);
    level1[1][7] = new Block(1,7, 'h');
    level1[2][7] = new Block(2,7, 'c', 4);
    level1[3][7] = new Block(3,7, 'p', 3);
    level1[4][7] = new Block(4,7, 'p', 4);
    level1[5][7] = new Block(5,7, 'h');
    level1[6][7] = new Block(6,7, 't', 3);
    level1[7][7] = new Block(7,7, 'h');
    level1[8][7] = new Block(8,7, 'p', 2);
    level1[9][7] = new Block(9,7, 'p', 3);
    level1[10][7] = new Block(10,7, 'c', 1);
    level1[11][7] = new Block(11,7, 'h');
    level1[12][7] = new Block(12,7, 'c', 3);
    
    //Row 9
    level1[0][8] = new Block(0,8, 'v');
    level1[1][8] = new Block(1,8, 'p', 4);
    level1[2][8] = new Block(2,8, 'c', 3);
    level1[3][8] = new Block(3,8, 'p', 4);
    level1[4][8] = new Block(4,8, 'h');
    level1[5][8] = new Block(5,8, 'p', 2);
    level1[6][8] = new Block(6,8, 'p', 3);
    level1[7][8] = new Block(7,8, 'p', 4);
    level1[8][8] = new Block(8,8, 'h');
    level1[9][8] = new Block(9,8, 'p', 2);
    level1[10][8] = new Block(10,8, 'c', 2);
    level1[11][8] = new Block(11,8, 'p', 2);
    level1[12][8] = new Block(12,8, 'v');
    
    //Row 10
    level1[0][9] = new Block(0,9, 't', 2);
    level1[1][9] = new Block(1,9, 'p', 2);
    level1[2][9] = new Block(2,9, 'p', 3);
    level1[3][9] = new Block(3,9, 'p', 1);
    level1[4][9] = new Block(4,9, 'p', 4);
    level1[5][9] = new Block(5,9, 'h');
    level1[6][9] = new Block(6,9, 't', 3);
    level1[7][9] = new Block(7,9, 'h');
    level1[8][9] = new Block(8,9, 'p', 2);
    level1[9][9] = new Block(9,9, 'p', 1);
    level1[10][9] = new Block(10,9, 'p', 3);
    level1[11][9] = new Block(11,9, 'p', 4);
    level1[12][9] = new Block(12,9, 't', 4);
    
    //Row 11
    level1[0][10] = new Block(0,10, 'v');
    level1[1][10] = new Block(1,10, 'p', 4);
    level1[2][10] = new Block(2,10, 'h');
    level1[3][10] = new Block(3,10, 't', 1);
    level1[4][10] = new Block(4,10, 'h');
    level1[5][10] = new Block(5,10, 'p', 2);
    level1[6][10] = new Block(6,10, 'p', 3);
    level1[7][10] = new Block(7,10, 'p', 4);
    level1[8][10] = new Block(8,10, 'h');
    level1[9][10] = new Block(9,10, 't', 1);
    level1[10][10] = new Block(10,10, 'h');
    level1[11][10] = new Block(11,10, 'p', 2);
    level1[12][10] = new Block(12,10, 'v');
    
    //Row 11
    level1[0][11] = new Block(0,11, 'c', 1);
    level1[1][11] = new Block(1,11, 'h');
    level1[2][11] = new Block(2,11, 'h');
    level1[3][11] = new Block(3,11, 'h');
    level1[4][11] = new Block(4,11, 'h');
    level1[5][11] = new Block(5,11, 'h');
    level1[6][11] = new Block(6,11, 'h');
    level1[7][11] = new Block(7,11, 'h');
    level1[8][11] = new Block(8,11, 'h');
    level1[9][11] = new Block(9,11, 'h');
    level1[10][11] = new Block(10,11, 'h');
    level1[11][11] = new Block(11,11, 'h');
    level1[12][11] = new Block(12,11, 'c', 4);
  }
  
  //methods
  void drawLevel(){
    //This loop draws all the blocks. I need it separate from the dots
    for (int x2 = 0; x2 < x; x2++){
      for (int y2 = 0; y2 < y; y2++){
        level1[x2][y2].drawBlock();
      }//end y loop
    }//end x loop

    //If dots are active (not eaten), draw them
    for (int x2 = 0; x2 < dotsX-1; x2++){
      for (int y2 = 0; y2 < dotsY-1; y2++){
        if (level1Dots[x2][y2].getDotStatus()){
          level1Dots[x2][y2].drawDots(x2+1, y2+1);
        }
      }//end y loop
    }//end x loop
  }//end method
  
  void drawDots(){
    //Draws dots. Extra numbers keep it from drawing on my borders.
    //NEW AND IMPROVED!!1 Now draws and sets status of drawn dots to active. At least that's what it should 
    //be doing...
    for (int x2 = 0; x2 < dotsX-1; x2++){
      for (int y2 = 0; y2 < dotsY-1; y2++){
          level1Dots[x2][y2].setDotStatus(level1Dots[x2][y2].drawDots(x2+1, y2+1));
          //Day 6: the walls are rotating and my clock is talking to me. Not sure how much longer I'll last
      }//end y loop
    }//end x loop
  }//end drawDots
    
    // Destroys a dot by setting its status to off, and returns true or false to increase the score    
    boolean destroyDot(int dotx_, int doty_){
      println(dotx_/25 + ", " + doty_/25);
      return level1Dots[dotx_/25-1][doty_/25-1].setDotStatus(false);
    } //end destroyDots
    
}//eof
