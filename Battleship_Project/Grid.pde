class Grid{
  boolean user;
  int rows = 26;
  int cols = 26;
  int side = 21;
  Box grid[][];
  int enemystartx = 5;
  int offset = 50;
  int abcdefghijklmnopqrstuvwxyz = cols * side;
  int friendlystartx = enemystartx + abcdefghijklmnopqrstuvwxyz + offset;
  int starty = 150;
  
  ArrayList<Coords> used = new ArrayList<Coords>(); int usedC = 0; 
  ArrayList<Ship> ships = new ArrayList<Ship>(); int shipC = 0; 
  AircraftCarrier AC;
  Battleship BA;
  Cruiser c1; Cruiser c2; Cruiser c3; Cruiser c4;
  Destroyer d1; Destroyer d2; Destroyer d3; Destroyer d4; Destroyer d5; Destroyer d6; Destroyer d7; Destroyer d8;
  Frigate f1; Frigate f2; Frigate f3; Frigate f4; Frigate f5; Frigate f6; Frigate f7; Frigate f8; Frigate f9; Frigate f10;
  PatrolBoat pb1; PatrolBoat pb2; PatrolBoat pb3; PatrolBoat pb4; PatrolBoat pb5; PatrolBoat pb6; PatrolBoat pb7; PatrolBoat pb8;
  PatrolBoat pb9; PatrolBoat pb10; PatrolBoat pb11; PatrolBoat pb12; PatrolBoat pb13; PatrolBoat pb14; PatrolBoat pb15; PatrolBoat pb16;
  Submarine sub1; Submarine sub2;
  ArrayList<Cruiser> c = new ArrayList<Cruiser>();
  ArrayList<Destroyer> d = new ArrayList<Destroyer>();
  ArrayList<Frigate> f = new ArrayList<Frigate>(); 
  ArrayList<PatrolBoat> pb = new ArrayList<PatrolBoat>();
  ArrayList<Submarine> s = new ArrayList<Submarine>();
  
  Grid(){
    //for used arraylist: 140 spaces occupied by ships 
    //for ships arraylist: keep track of the ships
  }
  void drawGridEnemy(){
    int x = enemystartx;
    int y = starty;
    grid = new Box[rows][cols];
    for (int r = 0; r < rows; r++){
      for (int c = 0; c < cols; c++){
        Box bb;
        //make true during testing, false for the real thing
        bb = new Box(x, y, side, WHITE, true);
        Coords coord = new Coords(x, y, Egrid, false);
        bb.coords = coord;
        coord.box = bb;
        grid[r][c] = bb;
        x = x + side;
        grid[r][c].display_initial();
      }
      y = y + side;
      x = enemystartx;
    }  
  }
  void drawGridFriendly(){
    int x = friendlystartx;
    int y = starty;
    grid = new Box[rows][cols];
    for (int r = 0; r < rows; r++){
      for (int c = 0; c < cols; c++){
        Box bb;
        bb = new Box(x, y, side, WHITE, true);
        Coords coord = new Coords(x, y, Fgrid, false);
        bb.coords = coord;
        coord.box = bb;
        grid[r][c] = bb;
        x = x + side;
        grid[r][c].display_initial();
      }
      y = y + side;
      x = friendlystartx;
    }  
  }
  Box access(Grid GG, int r, int c){
    return GG.grid[r][c];
  }
  Coords accessCoords(Grid GG, int r, int c){
    return GG.grid[r][c].coords;
  }
  void Eplace(){
    AC = new AircraftCarrier(0, 0, false); AC.EplaceAircraftCarrier(); ships.add(AC);
    BA = new Battleship(0, 0, false); BA.EplaceBattleship(); ships.add(BA);
    sub1 = new Submarine(0, 0, false); sub1.EplaceSubmarine(); 
   // sub2 = new Submarine(0, 0, false); sub2.EplaceSubmarine();
    c1 = new Cruiser(0, 0, false); c1.EplaceCruiser();
    //c2 = new Cruiser(0, 0, false); c2.EplaceCruiser();
    //c3 = new Cruiser(0, 0, false); c3.EplaceCruiser();
    //c4 = new Cruiser(0, 0, false); c4.EplaceCruiser();
    d1 = new Destroyer(0, 0, false); d1.EplaceDestroyer();
    //d2 = new Destroyer(0, 0, false); d2.EplaceDestroyer();
    //d3 = new Destroyer(0, 0, false); d3.EplaceDestroyer();
    //d4 = new Destroyer(0, 0, false); d4.EplaceDestroyer();
    //d5 = new Destroyer(0, 0, false); d5.EplaceDestroyer();
    //d6 = new Destroyer(0, 0, false); d6.EplaceDestroyer();
    //d7 = new Destroyer(0, 0, false); d7.EplaceDestroyer();
    //d8 = new Destroyer(0, 0, false); d8.EplaceDestroyer();
    f1 = new Frigate(0, 0, false); f1.EplaceFrigate();
    //f2 = new Frigate(0, 0, false); f2.EplaceFrigate();
    //f3 = new Frigate(0, 0, false); f3.EplaceFrigate();
    //f4 = new Frigate(0, 0, false); f4.EplaceFrigate();
    //f5 = new Frigate(0, 0, false); f5.EplaceFrigate();
    //f6 = new Frigate(0, 0, false); f6.EplaceFrigate();
    //f7 = new Frigate(0, 0, false); f7.EplaceFrigate();
    //f8 = new Frigate(0, 0, false); f8.EplaceFrigate();
    //f9 = new Frigate(0, 0, false); f9.EplaceFrigate();
    //f10 = new Frigate(0, 0, false); f10.EplaceFrigate();
    pb1 = new PatrolBoat(0, 0, false); pb1.EplacePatrolBoat();
    //pb2 = new PatrolBoat(0, 0, false); pb2.EplacePatrolBoat();
    //pb3 = new PatrolBoat(0, 0, false); pb3.EplacePatrolBoat();
    //pb4 = new PatrolBoat(0, 0, false); pb4.EplacePatrolBoat();
    //pb5 = new PatrolBoat(0, 0, false); pb5.EplacePatrolBoat();
    //pb6 = new PatrolBoat(0, 0, false); pb6.EplacePatrolBoat();
    //pb7 = new PatrolBoat(0, 0, false); pb7.EplacePatrolBoat();
    //pb8 = new PatrolBoat(0, 0, false); pb8.EplacePatrolBoat();
    //pb9 = new PatrolBoat(0, 0, false); pb9.EplacePatrolBoat();
    //pb10 = new PatrolBoat(0, 0, false); pb10.EplacePatrolBoat();
    //pb11 = new PatrolBoat(0, 0, false); pb11.EplacePatrolBoat();
    //pb12 = new PatrolBoat(0, 0, false); pb12.EplacePatrolBoat();
    //pb13 = new PatrolBoat(0, 0, false); pb13.EplacePatrolBoat();
    //pb14 = new PatrolBoat(0, 0, false); pb14.EplacePatrolBoat();
    //pb15 = new PatrolBoat(0, 0, false); pb15.EplacePatrolBoat();
    //pb16 = new PatrolBoat(0, 0, false); pb16.EplacePatrolBoat();
    c.add(c1); //c.add(c2); c.add(c3); c.add(c4);
    d.add(d1); //d.add(d2); d.add(d3); d.add(d4); d.add(d5); d.add(d6); d.add(d7); d.add(d8);
    f.add(f1); //f.add(f2); f.add(f3); f.add(f4); f.add(f5); f.add(f6); f.add(f7); f.add(f8); f.add(f9); f.add(f10);
    pb.add(pb1); //pb.add(pb2); pb.add(pb3); pb.add(pb4); pb.add(pb5); pb.add(pb6); pb.add(pb7); pb.add(pb8);
    //pb.add(pb9); pb.add(pb10); pb.add(pb11); pb.add(pb12); pb.add(pb13); pb.add(pb14); pb.add(pb15); pb.add(pb16);
    s.add(sub1); //s.add(sub2);
    for (int i = 0; i < c.size(); i++){
      ships.add(c.get(i)); 
    }
    for (int j = 0; j < d.size(); j++){
      ships.add(d.get(j));
    }
    for (int k = 0; k < f.size(); k++){
      ships.add(f.get(k));
    }
    for (int L = 0; L < pb.size(); L++){
      ships.add(pb.get(L));
    }
    for (int m = 0; m < s.size(); m++){
      ships.add(s.get(m));
    }
    for (int n = 0; n < ships.size(); n++){
      //link the ships' coords to the boxes, then make the boxes display
      for (int nn = 0; nn < ships.get(n).occupied.size(); nn++){
        Box bb = ships.get(n).occupied.get(nn).link(Egrid, ships.get(n).occupied.get(nn));
        ships.get(n).occupiedongrid.add(bb);
        int T = ships.get(n).type;
        if (T == CRUISER){
          bb.shipState = ARMOR;
          bb.state = ARMOR;
        }
        if (T == BATTLESHIP){
          bb.shipState = HEAVY_ARMOR;
          bb.state = HEAVY_ARMOR;
        }
        if (T == AIRCRAFT_CARRIER){
          bb.shipState = GOLD;
          bb.state = GOLD;
        }
        if (T == PATROL_BOAT){
          bb.shipState = SHIP;
          bb.state = SHIP;
        }
        if (T == DESTROYER){
          bb.shipState = DESTROYER;
          bb.state = DESTROYER;
        }
        if (T == FRIGATE){
          bb.shipState = FRIGATE;
          bb.state = FRIGATE;
        }
        if (T == SUBMARINE){
          bb.shipState = SUBMARINE;
          bb.state = SUBMARINE;
        }
        bb.display_friendly(); //change to .display_initial() in the future
      }
    }
    //for (int o = 0; o < ships.size(); o++){
    //  int typee = ships.get(o).type;
    //  for (int oo = 0; oo < ships.get(o).occupiedongrid.size(); oo++){
    //    ships.get(o).occupiedongrid.get(oo).shipState = typee;
    //    ships.get(o).occupiedongrid.get(oo).state = typee; //this is only for the friendly grid, get rid of this later
    //    println(ships.get(o).occupiedongrid.get(oo).shipState);
    //  }
    //}
    //for (int P = 0; P < ships.size(); P++){
    //  for (int p = 0; p < ships.get(P).occupiedongrid.size(); p++){
    //    ships.get(P).occupiedongrid.get(p).display_friendly(); //change to .display_enemy() later
    //  }
    //}
  }
}
