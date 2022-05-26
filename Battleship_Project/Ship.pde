class Ship{
  //possible idea: ship that can protect nearby ships via force field
  //prototypes: 
  //patrol boat, 1x1, normal ship #B19CD9
  //frigate, 3x1, normal ship #B19CD9
  //destroyer, 4x1, normal ship #B19CD9
  //cruiser, 6x1, armored ship #A9A9A9
  //battleship, 9x1, heavily armored ship #696969
  //aircraft carrier, 11x1 with some pieces sticking out, normal ship #FFDB51 (bright gold)
  //submarine, 3x1, submarine #00FF00 (hide from view even when hit)
  
  //fleet: 1 aircraft carrier, 1 battleship, 2 submarines, 4 cruisers,
  //8 destroyers, 10 frigates, 16 patrol boats
  
  
  int x; 
  int y; 
  int type; 
  int Length;
  int Width;
  int Extension;
  int headx;
  int heady;
  int HP;
  boolean alive;
  boolean Friendly;
  boolean directionUP; //true for going up from head
  boolean directionDW; //true for going down from head
  boolean directionLL; //true for going left 
  boolean directionRR; //true for going right
  boolean pointN; boolean pointW; boolean pointE; boolean pointS;
  ArrayList<Coords> occupied = new ArrayList<Coords>(); 
  ArrayList<Coords> suggested = new ArrayList<Coords>();
  ArrayList<Box> occupiedongrid = new ArrayList<Box>();
  
  Ship(){
    alive = true;
  }
  Ship(int xx, int yy){
    this();
    x = xx;
    y = yy;
    Width = 1;
    Extension = 0;
    directionUP = false; directionDW = false; 
    directionLL = false; directionRR = false; 
    pointN = false; pointE = false; pointW = false; pointS = false;
  }
  Ship(int xx, int yy, boolean F){
    this(xx, yy);
    Friendly = F;
    int A = int(random(0, 2));
    if (!Friendly){
      if (x <= 278 && y <= 423){
        if (A == 0){
          directionDW = true;
        }
        else{
          directionRR = true;
        }
      }
      if (x > 278 && y <= 423){
        if (A == 0){
          directionDW = true;
        }
        else{
          directionLL = true;
        }
      }
      if (x <= 278 && y > 423){
        if (A == 0){
          directionUP = true;
        }
        else{
          directionRR = true;
        }
      }
      if (x > 278 && y > 423){
        if (A == 0){
          directionUP = true;
        }
        else{
          directionLL = true;
        }
      }
    }
    else{
      //do what you did above, but for friendly grid instead of enemy grid
    }
  }
  Ship(int xx, int yy, int typee){
    this(xx, yy);
    if (typee == AIRCRAFT_CARRIER){
      Extension = 3;
      Width = 2;
    }
    if (typee == AIRCRAFT_CARRIER){
      if (x <= 278 && y <= 423){
        if (directionUP || directionDW){
          pointE = true;
        }
        if (directionLL || directionRR){
          pointS = true;
        }
      }
      if (x <= 278 && y > 423){
        if (directionUP || directionDW){
          pointE = true;
        }
        if (directionLL || directionRR){
          pointN = true;
        }
      }
      if (x > 278 && y <= 423){
        if (directionUP || directionDW){
          pointW = true;
        }
        if (directionLL || directionRR){
          pointS = true;
        }
      }
      if (x > 278 && y > 423){
        if (directionUP || directionDW){
          pointW = true;
        }
        if (directionLL || directionRR){
          pointN = true;
        }
      }
    }
  }
  Ship(int xx, int yy, int typee, boolean f){
    this(xx, yy, f);
    if (typee == AIRCRAFT_CARRIER){
      Extension = 3;
      Width = 2;
    }
    if (typee == AIRCRAFT_CARRIER && f == false){
      if (x <= 278 && y <= 423){
        if (directionUP || directionDW){
          pointE = true;
        }
        if (directionLL || directionRR){
          pointS = true;
        }
      }
      if (x <= 278 && y > 423){
        if (directionUP || directionDW){
          pointE = true;
        }
        if (directionLL || directionRR){
          pointN = true;
        }
      }
      if (x > 278 && y <= 423){
        if (directionUP || directionDW){
          pointW = true;
        }
        if (directionLL || directionRR){
          pointS = true;
        }
      }
      if (x > 278 && y > 423){
        if (directionUP || directionDW){
          pointW = true;
        }
        if (directionLL || directionRR){
          pointN = true;
        }
      }
    }
    //if (){
      //do what was done above for the friendly grid
    //}
  }
  
  ArrayList<Coords> Esuggest(){
      if (type == AIRCRAFT_CARRIER){
        headx = Erollx(11, 15); heady = EFrolly(11, 15);
      }
      if (type == BATTLESHIP){
        headx = Erollx(9, 17); heady = EFrolly(9, 17);
      }
      if (type == CRUISER){
        headx = Erollx(6, 20); heady = EFrolly(6, 20);
      }
      if (type == DESTROYER){
        headx = Erollx(4, 22); heady = EFrolly(4, 22);
      }
      if (type == FRIGATE){
        headx = Erollx(3, 23); heady = EFrolly(3, 23);
      }
      if (type == SUBMARINE){
        headx = Erollx(3, 23); heady = EFrolly(3, 23);
      }
      if (type == PATROL_BOAT){
        if (type == FRIGATE){
          headx = Erollx(0, 26); heady = EFrolly(0, 26);
        }
      }
    int X = this.headx; int Y = this.heady; ArrayList<Coords> A = new ArrayList<Coords>();
    if (directionLL){
      for (int i = 0; i < this.Length; i++){
        int xxx = X - (i * 21);
        Coords c = new Coords(xxx, Y, Egrid);
        A.add(c);
      }
      if (type == AIRCRAFT_CARRIER){
        for (int j = 0; j < this.Extension; j++){
          int xxxx = X - (j * 21); int yyyy = 0;
          if (pointN){yyyy = Y - 21;}
          if (pointS){yyyy = Y + 21;}
          Coords cc = new Coords(xxxx, yyyy, Egrid);
          A.add(cc);
        }
      }
    }
    if (directionRR){
      for (int i = 0; i < this.Length; i++){
        int xxx = X + (i * 21);
        Coords c = new Coords(xxx, Y, Egrid);
        A.add(c);
      }
      if (type == AIRCRAFT_CARRIER){
        for (int j = 0; j < this.Extension; j++){
          int xxxx = X + (j * 21); int yyyy = 0;
          if (pointN){yyyy = Y - 21;}
          if (pointS){yyyy = Y + 21;}
          Coords cc = new Coords(xxxx, yyyy, Egrid);
          A.add(cc);
        }
      }
    }
    if (directionUP){
      for (int i = 0; i < this.Length; i++){
        int yyy = Y - (i * 21);
        Coords c = new Coords(X, yyy, Egrid);
        A.add(c);
      }
      if (type == AIRCRAFT_CARRIER){
        for (int j = 0; j < this.Extension; j++){
          int yyyy = Y - (j * 21); int xxxx = 0;
          if (pointW){xxxx = X - 21;}
          if (pointE){xxxx = X + 21;}
          Coords cc = new Coords(xxxx, yyyy, Egrid);
          A.add(cc);
        }
      }
    }
    if (directionDW){
      for (int i = 0; i < this.Length; i++){
        int yyy = Y + (i * 21);
        Coords c = new Coords(X, yyy, Egrid);
        A.add(c);
      }
      if (type == AIRCRAFT_CARRIER){
        for (int j = 0; j < this.Extension; j++){
          int yyyy = Y + (j * 21); int xxxx = 0;
          if (pointW){xxxx = X - 21;}
          if (pointE){xxxx = X + 21;}
          Coords cc = new Coords(xxxx, yyyy, Egrid);
          A.add(cc);
        }
      }
    }
    return A;
  }
  void EDo0(ArrayList<Coords> Q){
    boolean z = EOverlap(Q);
    while(z){
      ArrayList<Coords> R = Esuggest();
      if (!EOverlap(R)){
        for (int i = 0; i < R.size(); i++){
          Q.clear();
          Q.add(R.get(i));
        }
        z = false;
        break;
      }
      else{
       R.clear(); 
      }
    }
  }
  void EDo(){
    ArrayList<Coords> Q = Esuggest(); 
    EDo0(Q);
    for(int i = 0; i < Q.size(); i++){
      suggested.add(Q.get(i));
    }
    for (int ii = 0; ii < suggested.size(); ii++){
      suggested.get(ii).occupied = true;
    }
    if (EOverlap(suggested) == false){
      for (int m = 0; m < suggested.size(); m++){
        occupied.add(suggested.get(m));
        Egrid.used.add(occupied.get(m));
      }
      for (int n = 0; n < occupied.size(); n++){
        Box bb = occupied.get(n).link(Egrid, occupied.get(n));
        occupiedongrid.add(bb);
        bb.occupied = true;
        bb.coords.occupied = true;
      }
      for (int o = 0; o < occupiedongrid.size(); o++){
        occupiedongrid.get(o).display_friendly();
      }
    }
    else{
      suggested.clear();
    }
  }
  boolean EOverlap(ArrayList<Coords> q){ //true for overlap, false if it's good to go
    for (int r = 0; r < 26; r++){
      for (int c = 0; c < 26; c++){
        Box bb = Egrid.access(Egrid, r, c);
        Coords coord = bb.coords;
        for (int k = 0; k < q.size(); k++){
          Coords j = q.get(k);
          if ((coord.occupied == true || bb.occupied == true) && (j.x == coord.x && j.y == coord.y)){
            return true;
          }
        }
      }
    }
    return false;
  }
  boolean FOverlap(){
    for (int r = 0; r < 26; r++){
      for (int c = 0; c < 26; c++){
        Box bb = Egrid.access(Egrid, r, c);
        Coords coord = bb.coords;
        for (int k = 0; k < suggested.size(); k++){
          Coords j = suggested.get(k);
          if (coord.occupied == true && j.x == coord.x && j.y == coord.y){
            return true;
          }
        }
      }
    }
    return false;
  }
    
   
  int Erollx(int min, int max){
    int A = int(random(min, max)); int B = A * 21; int C = B + 5; return C;
  }
  int Frollx(int min, int max){
    int A = int(random(min, max)); int B = A * 21; int C = B + 601; return C;
  }
  int EFrolly(int min, int max){
    int A = int(random(min, max)); int B = A * 21; int C = B + 150; return C;
  }
}
