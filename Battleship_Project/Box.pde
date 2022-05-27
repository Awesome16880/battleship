class Box{
  //to be used to make the map/grid
  int x;
  int y;
  int side;
  int state; //play state
  int prevState; //previous play state
  int shipState; //ship type
  boolean Display; //use to hide enemy ships
  Coords coords;
  boolean occupied;
  //int HP;
  
  Box(int xx, int yy, int boxside, int statee, boolean Friendly){
    x = xx;
    y = yy;
    occupied = false;
    side = boxside;
    state = statee;
    prevState = -1;
    //HP = 1;
    if (Friendly){
      Display = true;
    }
    else{
      Display = false;
    }
    //if (state == ARMOR){
    //  HP = 2;
    //}
    //if (state == HEAVY_ARMOR){
    //  HP = 3;
    //}
  }
  Box(int xx, int yy, int boxside, int statee, boolean Friendly, int shipstate){
    this(xx, yy, boxside, statee, Friendly);
    shipState = shipstate;
  }
  void display_initial(){
    fill(#FFFFFF);
    square(x, y, side);
  }
  void display_enemy(){
    //use while in play, don't display any of the enemy's ships
    if (state == BLACK){
      fill(#000000);
      square(x, y, side);
    }
    else if (state == WHITE){
      fill(#000000);
      square(x, y, side);
    }
    else if (state == HIT && prevState != SUBMARINE && prevState != ARMOR
    && prevState != HEAVY_ARMOR){
      fill(#FF0000);
      square(x, y, side);
    }
    else if (state == HIT && prevState == SUBMARINE){
      fill(#000000);
      square(x, y, side);
      //don't show hit submarines
    }
    else if (state == HIT && prevState == ARMOR){
      state = SHIP;
      fill(#B19CD9);
      square(x, y, side);
    }
    else if (state == HIT && prevState == HEAVY_ARMOR){
      state = ARMOR;
      fill(#A9A9A9);
      square(x, y, side);
    }
    else{
    }
  }
  void display_friendly(){
    //use while in play, display all friendly ships
    if (state == BLACK){
      fill(#000000);
    }
    else if (state == WHITE){
      fill(#FFFFFF);
    }
    else if (state == HIT){
      fill(#FF0000);
    }
    else if (state == SHIP){
      fill(#B19CD9);
    }
    else if (state == ARMOR){
      fill(#A9A9A9);
    }
    else if (state == HEAVY_ARMOR){
      fill(#696969);
    }
    else if (state == SUBMARINE){
      fill(#00FF00);
    }
    else if (state == DESTROYER){
      fill(#0000FF);
    }
    else if (state == FRIGATE){
      fill(#00FFFF);
    }
    else{
      fill(#FFDB51);
    }
    square(x, y, side);
  }
}
