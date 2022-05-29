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
  //hospital ship, 5x1, hospital ship #FF7700
  //reconnaissance ship, 1x1, reconnaissance ship
  
  //fleet: 1 aircraft carrier, 1 battleship, 2 submarines, 4 cruisers, 8 destroyers, 10 frigates, 16 patrol boats, 1 hospital ship, 3 reconnaissance ships
  
  
  int x; 
  int y; 
  int type; 
  int Length;
  int Width;
  int Extension;
  int headx;
  int heady;
  int HP;
  boolean isAlive;
  boolean Friendly;
  boolean directionUP; //true for going up from head
  boolean directionDW; //true for going down from head
  boolean directionLL; //true for going left 
  boolean directionRR; //true for going right
  boolean pointN; boolean pointW; boolean pointE; boolean pointS;
  ArrayList<Coords> occupied = new ArrayList<Coords>(); 
  ArrayList<Coords> suggested = new ArrayList<Coords>();
  ArrayList<Box> occupiedongrid = new ArrayList<Box>();
  ArrayList<Coords> alive = new ArrayList<Coords>();
  
  Ship(){
    isAlive = true;
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
      if (x <= 874 && y <= 423){
        if (A == 0){
          directionDW = true;
        }
        else{
          directionRR = true;
        }
      }
      if (x > 874 && y <= 423){
        if (A == 0){
          directionDW = true;
        }
        else{
          directionLL = true;
        }
      }
      if (x <= 874 && y > 423){
        if (A == 0){
          directionUP = true;
        }
        else{
          directionRR = true;
        }
      }
      if (x > 874 && y > 423){
        if (A == 0){
          directionUP = true;
        }
        else{
          directionLL = true;
        }
      }
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
    if (typee == AIRCRAFT_CARRIER && f == true){
      if (x <= 874 && y <= 423){
        if (directionUP || directionDW){
          pointE = true;
        }
        if (directionLL || directionRR){
          pointS = true;
        }
      }
      if (x <= 874 && y > 423){
        if (directionUP || directionDW){
          pointE = true;
        }
        if (directionLL || directionRR){
          pointN = true;
        }
      }
      if (x > 874 && y <= 423){
        if (directionUP || directionDW){
          pointW = true;
        }
        if (directionLL || directionRR){
          pointS = true;
        }
      }
      if (x > 874 && y > 423){
        if (directionUP || directionDW){
          pointW = true;
        }
        if (directionLL || directionRR){
          pointN = true;
        }
      }
    }
  }
  
  ArrayList<Coords> Esuggest(boolean N){
    if (N){
      int D = int(random(0, 4));
      if (D == 0){directionUP = true; directionDW = false; directionLL = false; directionRR = false;}
      else if (D == 1){directionUP = false; directionDW = true; directionLL = false; directionRR = false;}
      else if (D == 2){directionUP = false; directionDW = false; directionLL = true; directionRR = false;}
      else{directionUP = false; directionDW = false; directionLL = false; directionRR = true;}
    }
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
        headx = Erollx(0, 26); heady = EFrolly(0, 26);
      }
      if (type == HOSPITAL_SHIP){
        headx = Erollx(5, 21); heady = EFrolly(5, 21);
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
  boolean EDo(){ //return true if there's a problem, false if it's good to go
    ArrayList<Coords> Q = Esuggest(false); 
    int III = 0; 
    for (int a = 0; a < Q.size(); a++){
      Q.get(a).type = this.type;
    }
    //println(Q.size() + "K");
    boolean z = EOverlap(Q); 
    while(z){
      ArrayList<Coords> R = Esuggest(true);
      //println(III + " III");
      //println("Q"); println(Q.size());
      //for (int p = 0; p < Q.size(); p++){
      //  String s = Q.get(p).toString();
      //  println(s);
      //}
      //println("R"); println(R.size());
      //for (int p = 0; p < R.size(); p++){
      //  String s = R.get(p).toString();
      //  println(s);
      //}
      if (III >= 10){
        Q.clear();
        R.clear();
        z = false;
        break;
      }
      if (!EOverlap(R)){
        Q.clear();
        for (int i = 0; i < R.size(); i++){
          Q.add(R.get(i));
        }
        z = false;
        break;
      }
      else{
        III++;
        R.clear(); 
      }
    }
    if (III >= 10){
      return true;
    }
    for (int ii = 0; ii < Q.size(); ii++){
      Q.get(ii).type = this.type;
    }
    //println(Q.size() + "AAAAAAAAAAAA");
    for(int i = 0; i < Q.size(); i++){
      suggested.add(Q.get(i));
      suggested.get(i).occupied = true;
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
        bb.shipState = this.type;
        bb.state = this.type;
      }
      for (int o = 0; o < occupiedongrid.size(); o++){
        int x = occupiedongrid.get(o).doHP(occupiedongrid.get(o).shipState);
        occupiedongrid.get(o).setHP(x);
        occupiedongrid.get(o).display_friendly(); //change to display_initial() later
      }
      for (int p = 0; p < occupied.size(); p++){
        alive.add(occupied.get(p));
      }
    }
    else{
      suggested.clear();
    }
    return false;
  }
  ArrayList<Coords> Fsuggest(boolean N){
    if (N){
      int D = int(random(0, 4));
      if (D == 0){directionUP = true; directionDW = false; directionLL = false; directionRR = false;}
      else if (D == 1){directionUP = false; directionDW = true; directionLL = false; directionRR = false;}
      else if (D == 2){directionUP = false; directionDW = false; directionLL = true; directionRR = false;}
      else{directionUP = false; directionDW = false; directionLL = false; directionRR = true;}
    }
      if (type == AIRCRAFT_CARRIER){
        headx = Frollx(11, 15); heady = EFrolly(11, 15);
      }
      if (type == BATTLESHIP){
        headx = Frollx(9, 17); heady = EFrolly(9, 17);
      }
      if (type == CRUISER){
        headx = Frollx(6, 20); heady = EFrolly(6, 20);
      }
      if (type == DESTROYER){
        headx = Frollx(4, 22); heady = EFrolly(4, 22);
      }
      if (type == FRIGATE){
        headx = Frollx(3, 23); heady = EFrolly(3, 23);
      }
      if (type == SUBMARINE){
        headx = Frollx(3, 23); heady = EFrolly(3, 23);
      }
      if (type == PATROL_BOAT){
        headx = Frollx(0, 26); heady = EFrolly(0, 26);
      }
      if (type == HOSPITAL_SHIP){
        headx = Frollx(5, 21); heady = EFrolly(5, 21);
      }
    int X = this.headx; int Y = this.heady; ArrayList<Coords> A = new ArrayList<Coords>();
    if (directionLL){
      for (int i = 0; i < this.Length; i++){
        int xxx = X - (i * 21);
        Coords c = new Coords(xxx, Y, Fgrid);
        A.add(c);
      }
      if (type == AIRCRAFT_CARRIER){
        for (int j = 0; j < this.Extension; j++){
          int xxxx = X - (j * 21); int yyyy = 0;
          if (pointN){yyyy = Y - 21;}
          if (pointS){yyyy = Y + 21;}
          Coords cc = new Coords(xxxx, yyyy, Fgrid);
          A.add(cc);
        }
      }
    }
    if (directionRR){
      for (int i = 0; i < this.Length; i++){
        int xxx = X + (i * 21);
        Coords c = new Coords(xxx, Y, Fgrid);
        A.add(c);
      }
      if (type == AIRCRAFT_CARRIER){
        for (int j = 0; j < this.Extension; j++){
          int xxxx = X + (j * 21); int yyyy = 0;
          if (pointN){yyyy = Y - 21;}
          if (pointS){yyyy = Y + 21;}
          Coords cc = new Coords(xxxx, yyyy, Fgrid);
          A.add(cc);
        }
      }
    }
    if (directionUP){
      for (int i = 0; i < this.Length; i++){
        int yyy = Y - (i * 21);
        Coords c = new Coords(X, yyy, Fgrid);
        A.add(c);
      }
      if (type == AIRCRAFT_CARRIER){
        for (int j = 0; j < this.Extension; j++){
          int yyyy = Y - (j * 21); int xxxx = 0;
          if (pointW){xxxx = X - 21;}
          if (pointE){xxxx = X + 21;}
          Coords cc = new Coords(xxxx, yyyy, Fgrid);
          A.add(cc);
        }
      }
    }
    if (directionDW){
      for (int i = 0; i < this.Length; i++){
        int yyy = Y + (i * 21);
        Coords c = new Coords(X, yyy, Fgrid);
        A.add(c);
      }
      if (type == AIRCRAFT_CARRIER){
        for (int j = 0; j < this.Extension; j++){
          int yyyy = Y + (j * 21); int xxxx = 0;
          if (pointW){xxxx = X - 21;}
          if (pointE){xxxx = X + 21;}
          Coords cc = new Coords(xxxx, yyyy, Fgrid);
          A.add(cc);
        }
      }
    }
    return A;
  }
  boolean FDo(){
    ArrayList<Coords> Q = Fsuggest(false); 
    int III = 0; 
    for (int a = 0; a < Q.size(); a++){
      Q.get(a).type = this.type;
    }
    //println(Q.size() + "KK");
    boolean z = FOverlap(Q); 
    while(z){
      ArrayList<Coords> R = Fsuggest(true);
      //println(III + " III");
      //println("QQ"); println(Q.size());
      //for (int p = 0; p < Q.size(); p++){
      //  String s = Q.get(p).toString();
      //  println(s);
      //}
      //println("RR"); println(R.size());
      //for (int p = 0; p < R.size(); p++){
      //  String s = R.get(p).toString();
      //  println(s);
      //}
      if (III >= 10){
        Q.clear();
        R.clear();
        z = false;
        break;
      }
      if (!FOverlap(R)){
        Q.clear();
        for (int i = 0; i < R.size(); i++){
          Q.add(R.get(i));
        }
        z = false;
        break;
      }
      else{
        III++;
        R.clear(); 
      }
    }
    if (III >= 10){
      return true;
    }
    for (int ii = 0; ii < Q.size(); ii++){
      Q.get(ii).type = this.type;
    }
    //println(Q.size() + "AAAAAAAAAAAA");
    for(int i = 0; i < Q.size(); i++){
      suggested.add(Q.get(i));
      suggested.get(i).occupied = true;
    }
    if (EOverlap(suggested) == false){
      for (int m = 0; m < suggested.size(); m++){
        occupied.add(suggested.get(m));
        Fgrid.used.add(occupied.get(m));
      }
      for (int n = 0; n < occupied.size(); n++){
        Box bb = occupied.get(n).link(Fgrid, occupied.get(n));
        occupiedongrid.add(bb);
        bb.occupied = true;
        bb.coords.occupied = true;
        bb.shipState = this.type;
        bb.state = this.type;
      }
      for (int o = 0; o < occupiedongrid.size(); o++){
        int x = occupiedongrid.get(o).doHP(occupiedongrid.get(o).shipState);
        occupiedongrid.get(o).setHP(x);
        occupiedongrid.get(o).display_friendly();
      }
      for (int p = 0; p < occupied.size(); p++){
        alive.add(occupied.get(p));
      }
    }
    else{
      suggested.clear();
    }
    return false;
  }
  boolean EOverlap(ArrayList<Coords> q){ //true for overlap, false if it's good to go
    if (this.type == AIRCRAFT_CARRIER){
      return false;
    }
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
  boolean FOverlap(ArrayList<Coords> q){
    if (this.type == AIRCRAFT_CARRIER){
      return false;
    }
    for (int r = 0; r < 26; r++){
      for (int c = 0; c < 26; c++){
        Box bb = Fgrid.access(Fgrid, r, c);
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
