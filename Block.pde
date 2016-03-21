class Block{
  //fields
  int xcoord, ycoord, angle;
  char type;
  PImage blockImage;
  
  //constructors
  //Empty block
  Block(int xcoord_, int ycoord_){
    xcoord = xcoord_;
    ycoord = ycoord_;
  }
  //Vertical or horizontal block
  Block(int xcoord_, int ycoord_, char type_){
    xcoord = xcoord_;
    ycoord = ycoord_;
    type = type_;
    switch(type){
      case 'v':
        blockImage = loadImage("wallV.jpg"); break;
      case 'h':
        blockImage = loadImage("wallH.jpg"); break;
    }
  }
  //overloaded constructor takes additional angle param if type is a corner, cap, or T
  //xcoord, ycoord, type(v, h, c, p, t), angle(1 = up right(up), 2 = low right(right), 
  //3 = low left(down), 4 = up left(left)
  //v = vertical, h = horiz, c = corner, p = cap, t = T intersection
  //NOTE: If you pass an angle param for type v or h it will not draw anything in that block
  Block(int xcoord_, int ycoord_, char type_, int angle_){
    xcoord = xcoord_;
    ycoord = ycoord_;
    type = type_;
    angle = angle_;
    switch(type){
      case 'c': //corner
        switch(angle){
          case 1:
            blockImage = loadImage("cornerUR.jpg"); break;
          case 2:
            blockImage = loadImage("cornerLR.jpg"); break;
          case 3:
            blockImage = loadImage("cornerLL.jpg"); break;
          case 4:
            blockImage = loadImage("cornerUL.jpg"); break;
        }break;//end angle switch
      case 'p': //cap
        switch(angle){
          case 1:
            blockImage = loadImage("capU.jpg"); break;
          case 2:
            blockImage = loadImage("capR.jpg"); break;
          case 3:
            blockImage = loadImage("capD.jpg"); break;
          case 4:
            blockImage = loadImage("capL.jpg"); break;
        }break;//end angle switch
      case 't': //T section
        switch(angle){
          case 1:
            blockImage = loadImage("tU.jpg"); break;
          case 2:
            blockImage = loadImage("tR.jpg"); break;
          case 3:
            blockImage = loadImage("tD.jpg"); break;
          case 4:
            blockImage = loadImage("tL.jpg"); break;
        }break;//end angle switch
    }//end type switch
  }
  
  //methods
  void drawBlock(){
    fill(0);
    //draws empty box if no image specified
    if (blockImage == null){
    rect(xcoord*50, ycoord*50, 50, 50);
    }else{
    image(blockImage, xcoord*50, ycoord*50);
    fill(255);
    //text(xcoord*50, xcoord*50, ycoord*50); text(ycoord*50, xcoord*50, ycoord*50+10); //For troubleshooting
    }
  }
}//eof
