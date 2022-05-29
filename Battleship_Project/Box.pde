class Box {
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
  boolean useful;
  boolean shotAt;
  Box west;
  Box east;
  Box north;
  Box south;
  int HP;

  Box() {
    useful = false;
    HP = -15000;
    shotAt = false;
  }
  Box(int xx, int yy, int boxside, int statee, boolean Friendly) {
    x = xx;
    y = yy;
    HP = -1;
    useful = true;
    occupied = false;
    shipState = -1;
    side = boxside;
    state = statee;
    prevState = -1;
    if (Friendly) {
      Display = true;
    } 
    else {
      Display = false;
    }
  }
  Box(int xx, int yy, int boxside, int statee, boolean Friendly, int shipstate) {
    this(xx, yy, boxside, statee, Friendly);
    shipState = shipstate;
    if (shipState == BATTLESHIP){
      this.HP = 3;
    }
    if (shipState == CRUISER){
      this.HP = 2;
    }
  }
  String toString(){
    String s = "" + this.HP;
    return s;
  }
  void remove(){
    for (int i = 0; i < computer_targets.size(); i++){
      if (this.x == computer_targets.get(i).x && this.y == computer_targets.get(i).y){
        computer_targets.remove(i);
      }
    }
  }
  int getHP(){
    return this.HP;
  }
  void setHP(int hp){
    this.HP = hp;
  }
  void hit(boolean isPlayer) {
    int s = this.HP;
    this.HP = this.HP - 1;
    if ((s < 0 && this.state != HIT) || this.shipState == SUBMARINE) {
      display_miss();
      if (isPlayer == false){
        if (hunting == false){
          computer_hit_streak = 0;
        }
        if (computer_hit_compass <= 0){
          target_basis = null; 
          computer_hit_streak = 0;
          computer_hit_compass = 0;
          hunting = false;
        }
        if (computer_hit_compass > 0){
          computer_hit_compass--; 
        }
        println("COMPASS: " + computer_hit_compass);
        println("STREAK: " + computer_hit_streak);
      }
    }
    else {
      display_hit();
      if (isPlayer == false && computer_hit_compass == 0){
        hunting = true;
        computer_hit_compass = 4;
      }
      if (isPlayer == false && computer_hit_compass == 4){
        target_basis = this;
      }
      if (isPlayer == false && computer_hit_compass != 0){
        computer_hit_streak++;
      }
      if (!isPlayer){
        println("COMPASS: " + computer_hit_compass);
        println("STREAK: " + computer_hit_streak);
      }
    }
  }
  void display_hit() {
    if (this.HP == 0) {
      this.state = HIT;
      fill(#FF0000);
      square(x, y, side);
    } 
    if (this.HP == 1) {
      this.state = SHIP;
      fill(#B19FF9); //very light purple
      square(x, y, side);
    }
    if (this.HP == 2) {
      this.state = ARMOR;
      fill(#A9A9A9);
      square(x, y, side);
    }
  }
  void display_miss() {
    this.state = BLACK;
    fill(#000000);
    square(x, y, side);
  }
  void display_initial() {
    fill(#FFFFFF);
    square(x, y, side);
  }
  void display_enemy() {
    //use while in play, don't display any of the enemy's ships
    if (state == BLACK) {
      fill(#000000);
      square(x, y, side);
    } 
    else if (state == WHITE) {
      fill(#000000);
      square(x, y, side);
    } 
    else if (state == HIT && shipState != SUBMARINE && prevState != ARMOR
      && prevState != HEAVY_ARMOR) {
      fill(#FF0000);
      square(x, y, side);
    } 
    else if (state == HIT && prevState == SUBMARINE) {
      fill(#000000);
      square(x, y, side);
      //don't show hit submarines
    } 
    else if (state == HIT && prevState == ARMOR) {
      state = SHIP;
      fill(#B19CD9);
      square(x, y, side);
    } 
    else if (state == HIT && prevState == HEAVY_ARMOR) {
      state = ARMOR;
      fill(#A9A9A9);
      square(x, y, side);
    } 
    else {
    }
  }
  void display_friendly() {
    //use while in play, display all friendly ships
    if (state == BLACK) {
      fill(#000000);
    } 
    else if (state == WHITE) {
      fill(#FFFFFF);
    } 
    else if (state == HIT) {
      fill(#FF0000);
    } 
    else if (state == SHIP) {
      fill(#B19CD9);
    }
    else if (state == ARMOR) {
      fill(#A9A9A9);
    } 
    else if (state == HEAVY_ARMOR) {
      fill(#696969);
    } 
    else if (state == SUBMARINE) {
      fill(#22C655);
    } 
    else if (state == HOSPITAL_SHIP) {
      fill(#FF7700);
    } 
    else if (state == RECONNAISSANCE_SHIP) {
      fill(#78866B);
    } 
    else if (state == DESTROYER) {
      fill(#0000FF);
    } 
    else if (state == FRIGATE) {
      fill(#00FFFF);
    } 
    else {
      fill(#FFDB51);
    }
    square(x, y, side);
  }
  int doHP(int shipstate) {
    if (shipstate > 0) {
      if (shipstate == BATTLESHIP) {
        return 3;
      }
      if (shipstate == CRUISER) {
        return 2;
      }
      else{
        return 1;
      }
    } 
    else {
      return -1;
    }
  }
}
