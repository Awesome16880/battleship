class Grid{
  boolean user;
  int rows = 26;
  int cols = 26;
  int side = 21;
  Box grid[][];
  Box NULL;
  int enemystartx = 5;
  int offset = 50;
  int abcdefghijklmnopqrstuvwxyz = cols * side;
  int friendlystartx = enemystartx + abcdefghijklmnopqrstuvwxyz + offset;
  int starty = 150;
  
  ArrayList<Coords> used = new ArrayList<Coords>(); int usedC = 0; 
  ArrayList<Ship> ships = new ArrayList<Ship>(); int shipC = 0; 
  ArrayList<Ship> aliveShips = new ArrayList<Ship>();
  AircraftCarrier AC;
  Battleship BA;
  HospitalShip H;
  ReconnaissanceShip r1; ReconnaissanceShip r2; ReconnaissanceShip r3; 
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
  ArrayList<ReconnaissanceShip> r = new ArrayList<ReconnaissanceShip>();
  ArrayList<Submarine> s = new ArrayList<Submarine>();
  
  Grid(){
    NULL = new Box();
  }
  void drawGridEnemy(){
    int x = enemystartx;
    int y = starty;
    grid = new Box[rows][cols];
    for (int r = 0; r < rows; r++){
      for (int c = 0; c < cols; c++){
        Box bb;
        bb = new Box(x, y, side, WHITE, false);
        Coords coord = new Coords(x, y, Egrid, false);
        bb.coords = coord;
        coord.box = bb;
        grid[r][c] = bb;
        x = x + side;
        grid[r][c].display_initial();
        possible_targets.add(bb);
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
        possible_computer_targets.add(bb);
      }
      y = y + side;
      x = friendlystartx;
    }  
  }
  void link(Grid G){
    for (int r = 1; r < rows - 1; r++){
      for (int c = 1; c < cols - 1; c++){
        G.grid[r][c].west = G.grid[r][c - 1];
        G.grid[r][c].east = G.grid[r][c + 1];
        G.grid[r][c].north = G.grid[r - 1][c];
        G.grid[r][c].south = G.grid[r + 1][c];
      }
    }
    for (int c = 1; c < cols - 1; c++){
      G.grid[0][c].west = G.grid[0][c - 1];
      G.grid[0][c].east = G.grid[0][c + 1];
      G.grid[0][c].north = G.NULL;
      G.grid[0][c].south = G.grid[1][c];
      G.grid[rows - 1][c].west = G.grid[rows - 1][c - 1];
      G.grid[rows - 1][c].east = G.grid[rows - 1][c + 1];
      G.grid[rows - 1][c].north = G.grid[rows - 2][c];
      G.grid[rows - 1][c].south = G.NULL;
    }
    for (int r = 1; r < rows - 1; r++){
      G.grid[r][0].west = G.NULL;
      G.grid[r][0].east = G.grid[r][1];
      G.grid[r][0].north = G.grid[r - 1][0];
      G.grid[r][0].south = G.grid[r + 1][0];
      G.grid[r][cols - 1].west = G.grid[r][cols - 2];
      G.grid[r][cols - 1].east = G.NULL;
      G.grid[r][cols - 1].north = G.grid[r - 1][cols - 1];
      G.grid[r][cols - 1].south = G.grid[r + 1][cols - 1];
    }
    G.grid[0][0].west = G.NULL; G.grid[0][0].north = G.NULL; G.grid[0][0].east = G.grid[0][1]; G.grid[0][0].south = G.grid[1][0];
    G.grid[rows - 1][cols - 1].west = G.grid[rows - 1][cols - 2]; G.grid[rows - 1][cols - 1].east = G.NULL; G.grid[rows - 1][cols - 1].north = G.grid[rows - 2][cols - 1]; G.grid[rows - 1][cols - 1].south = G.NULL;
    G.grid[rows - 1][0].west = G.NULL; G.grid[rows - 1][0].east = G.grid[rows - 1][1]; G.grid[rows - 1][0].north = G.grid[rows - 2][0]; G.grid[rows - 1][0].south = G.NULL;
    G.grid[0][cols - 1].west = G.grid[0][cols - 2]; G.grid[0][cols - 1].east = G.NULL; G.grid[0][cols - 1].north = G.NULL; G.grid[0][cols - 1].south = G.grid[1][cols - 1];
  }
  Box access(Grid GG, int r, int c){
    return GG.grid[r][c];
  }
  Box playaccess(Grid GG, int r, int c){
   if (r >= 0 && r < 26 && c >= 0 && c < 26){
      return GG.grid[r][c];
    }
    return null;
  }
  Box computer_accessVERYEASY(){
    int ABCDEFGHIJKLMNOPQRSTUVWXYZ = int(random(0, possible_computer_targets.size()));
    Box BB = possible_computer_targets.get(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
    possible_computer_targets.remove(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
    return BB;
  }
  Box computer_accessEASY(){
    Box BB = null;
    if (computer_targets.size() > 0){
      targeting = true;
      for (int i = 0; i < computer_targets.size(); i++){
        if (computer_targets.get(i).shotAt == true){
          computer_targets.remove(i);
          i--;
        }
      }
    }
    if (targeting == true && computer_targets.size() > 0){
      BB = computer_targets.get(0);
      computer_targets.remove(0);
    }
    else{
      targeting = false;
      int ABCDEFGHIJKLMNOPQRSTUVWXYZ = int(random(0, possible_computer_targets.size()));
      BB = possible_computer_targets.get(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
      possible_computer_targets.remove(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
    }
    return BB;
  }
  Box computer_accessNORMAL(){
    Box BB = null; int A = int(random(0, 100));
    if (computer_targets.size() > 0){
      targeting = true;
      for (int i = 0; i < computer_targets.size(); i++){
        if (computer_targets.get(i).shotAt == true){
          computer_targets.remove(i);
          i--;
        }
      }
    }
    if (targeting == true && computer_targets.size() > 0){
      BB = computer_targets.get(0);
      computer_targets.remove(0);
      return BB;
    }
    else{
      if (A < 7 && emissiles == true && ENEMY_ABILITIES > 0){
        Emissiles.use(); emissiles = false; ENEMY_ABILITIES--; 
      }
      else if (A < 14 && ebomb == true && ENEMY_ABILITIES > 0){
        Ebomb.use(); ebomb = false; ENEMY_ABILITIES--;
      }
      else if (A < 21 && elaser == true && ENEMY_ABILITIES > 0){
        Elaser.use(); elaser = false; ENEMY_ABILITIES--;
      }
      else if (A < 28 && esonar == true && ENEMY_ABILITIES > 0){
        Esonar.use(); esonar = false; ENEMY_ABILITIES--;
      }
      else if (A < 35 && espontaneousexplosion == true && ENEMY_ABILITIES > 0){
        Espontaneousexplosion.use(); espontaneousexplosion = false; ENEMY_ABILITIES--;
      }
      else if (A < 42 && ereconnaissance == true && ENEMY_ABILITIES > 0){
        Ereconnaissance.use(); ereconnaissance = false; ENEMY_ABILITIES--;
      }
      else{
        targeting = false;
        int ABCDEFGHIJKLMNOPQRSTUVWXYZ = int(random(0, possible_computer_targets.size()));
        BB = possible_computer_targets.get(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
        possible_computer_targets.remove(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
      }
    }
    return BB;
  }
  Box computer_accessHARD(){
    Box BB = null; int A = int(random(0, 100)); int moar = int(random(0, 40));
    if (computer_targets.size() > 0){
      targeting = true;
      for (int i = 0; i < computer_targets.size(); i++){
        if (computer_targets.get(i).shotAt == true){
          computer_targets.remove(i);
          i--;
        }
      }
    }
    if (targeting == true && computer_targets.size() > 0 && moar != 0){
      BB = computer_targets.get(0);
      computer_targets.remove(0);
      return BB;
    }
    else{
      if (A < 14 && emissiles == true && ENEMY_ABILITIES > 0){
        Emissiles.use(); emissiles = false; ENEMY_ABILITIES--; 
      }
      else if (A < 28 && ebomb == true && ENEMY_ABILITIES > 0){
        Ebomb.use(); ebomb = false; ENEMY_ABILITIES--;
      }
      else if (A < 42 && elaser == true && ENEMY_ABILITIES > 0){
        Elaser.use(); elaser = false; ENEMY_ABILITIES--;
      }
      else if (A < 56 && esonar == true && ENEMY_ABILITIES > 0){
        Esonar.use(); esonar = false; ENEMY_ABILITIES--;
      }
      else if (A < 70 && espontaneousexplosion == true && ENEMY_ABILITIES > 0){
        Espontaneousexplosion.use(); espontaneousexplosion = false; ENEMY_ABILITIES--;
      }
      else if (A < 84 && ereconnaissance == true && ENEMY_ABILITIES > 0){
        Ereconnaissance.use(); ereconnaissance = false; ENEMY_ABILITIES--;
      }
      else{
        targeting = false;
        int ABCDEFGHIJKLMNOPQRSTUVWXYZ = int(random(0, possible_computer_targets.size()));
        BB = possible_computer_targets.get(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
        possible_computer_targets.remove(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
      }
    }
    return BB;
  }
  Box computer_accessVERYHARD(){
    Box BB = null; int A = int(random(0, 84)); int moar = int(random(0, 100));
    float K = ALLDEATH * 1.5; float RQ = K * 10; int MOAR = moar * 10; boolean QR = MOAR < RQ;
    if (computer_targets.size() > 0){
      targeting = true;
      for (int i = 0; i < computer_targets.size(); i++){
        if (computer_targets.get(i).shotAt == true){
          computer_targets.remove(i);
          i--;
        }
      }
    }
    if (targeting == true && computer_targets.size() > 0 && !QR){
      BB = computer_targets.get(0);
      computer_targets.remove(0);
      return BB;
    }
    else{
      if (A < 14 && emissiles == true && ENEMY_ABILITIES > 0){
        Emissiles.use(); emissiles = true; ENEMY_ABILITIES--; 
      }
      else if (A < 28 && ebomb == true && ENEMY_ABILITIES > 0){
        Ebomb.use(); ebomb = true; ENEMY_ABILITIES--;
      }
      else if (A < 42 && elaser == true && ENEMY_ABILITIES > 0){
        Elaser.use(); elaser = true; ENEMY_ABILITIES--;
      }
      else if (A < 56 && esonar == true && ENEMY_ABILITIES > 0){
        Esonar.use(); esonar = true; ENEMY_ABILITIES--;
      }
      else if (A < 70 && espontaneousexplosion == true && ENEMY_ABILITIES > 0){
        Espontaneousexplosion.use(); espontaneousexplosion = true; ENEMY_ABILITIES--;
      }
      else if (A < 84 && ereconnaissance == true && ENEMY_ABILITIES > 0){
        Ereconnaissance.use(); ereconnaissance = true; ENEMY_ABILITIES--;
      }
      else{
        targeting = false;
        int ABCDEFGHIJKLMNOPQRSTUVWXYZ = int(random(0, possible_computer_targets.size()));
        BB = possible_computer_targets.get(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
        possible_computer_targets.remove(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
      }
    }
    return BB;
  }
  Box computer_accessVERYVERYHARD(){
    Box BB = null; int A = int(random(0, 84)); int moar = int(random(0, 100));
    float K = ALLDEATH * 1.5; float RQ = K * 10; int MOAR = moar * 10; boolean QR = MOAR < RQ;
    if (computer_targets.size() > 0){
      targeting = true;
      for (int i = 0; i < computer_targets.size(); i++){
        if (computer_targets.get(i).shotAt == true){
          computer_targets.remove(i);
          i--;
        }
      }
    }
    if (targeting == true && computer_targets.size() > 0 && !QR && Dd != 0){
      BB = computer_targets.get(0);
      computer_targets.remove(0);
      return BB;
    }
    else{
      if (Dd == 0){
        Dd++;
        println("The enemy used their Nuke ability!");
      }
      else if (A < 14 && emissiles == true && ENEMY_ABILITIES > 0){
        Emissiles.use(); emissiles = false; ENEMY_ABILITIES--; 
      }
      else if (A < 28 && ebomb == true && ENEMY_ABILITIES > 0){
        Ebomb.use(); ebomb = false; ENEMY_ABILITIES--;
      }
      else if (A < 42 && elaser == true && ENEMY_ABILITIES > 0){
        Elaser.use(); elaser = false; ENEMY_ABILITIES--;
      }
      else if (A < 56 && esonar == true && ENEMY_ABILITIES > 0){
        Esonar.use(); esonar = false; ENEMY_ABILITIES--;
      }
      else if (A < 70 && espontaneousexplosion == true && ENEMY_ABILITIES > 0){
        Espontaneousexplosion.use(); espontaneousexplosion = false; ENEMY_ABILITIES--;
      }
      else if (A < 84 && ereconnaissance == true && ENEMY_ABILITIES > 0){
        Ereconnaissance.use(); ereconnaissance = false; ENEMY_ABILITIES--;
      }
      else{
        targeting = false;
        int ABCDEFGHIJKLMNOPQRSTUVWXYZ = int(random(0, possible_computer_targets.size()));
        BB = possible_computer_targets.get(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
        possible_computer_targets.remove(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
      }
    }
    return BB;
  }
  Coords accessCoords(Grid GG, int r, int c){
    return GG.grid[r][c].coords;
  }
  void PLAYERplays(int mx, int my, int difficulty){ 
    boolean a; boolean aa; boolean aaa;
    println("EHP " + EHP);println("FHP " + FHP); 
    if ((mx >= 1230 && mx <= 1410)){
      aaa = true;
    }
    else{aaa = false;}
    if ((my >= 220 && my <= 270) || (my >= 290 && my <= 340) || (my >= 360 && my <= 410) || (my >= 430 && my <= 480) || (my >= 500 && my <= 550) || (my >= 570 && my <= 620)){aa = true;}
    else{aa = false;}
    if (aa == true && aaa == true){
      a = true;
    }
    else{a = false;}
    if (in_play == true){
    int mx0 = mx - 5; int my0 = my - 150;
    int mx1 = mx0 / 21; int my1 = my0 / 21;
    int mxf0 = mx - 601; int myf0 = my - 150;
    int mxf1 = mxf0 / 21; int myf1 = myf0 / 21;
    Box b = playaccess(Egrid, my1, mx1);
    Box B = playaccess(Fgrid, myf1, mxf1);
    if (b == null && B != null && a == false){
      //println("ROW " + mx1 + " COL " + my1);
      if (funny == 0){
        println("Look before you shoot.");
      }
      else if (funny == 1){
        println("You're shooting at the wrong ships. Go shoot those other ships instead; they're the enemy.");
      }
      else if (funny == 2){
        println("FRIENDLY FIRE ALERT");
      }
      else if (funny == 3){
        println("Stop hitting your own ships!");
      }
      else if (funny == 4){
        println("FRIENDLY FIRE BAD! STOP, FRIENDLY FIRE BAD! >:(");
      }
      else if (funny == 5){
        println("STOP HITTING YOUR OWN SHIPS!!!");
      }
      else if (funny == 6){
        println("Are you TRYING to lose?");
      }
      else if (funny == 7){
        println("You don't understand how this game works, do you?");
      }
      else if (funny == 8){
        println("Go educate yourself on how the game works first. You clearly don't understand that you're not supposed to target your own ships.");
      }
      else if (funny == 9){
        println("I'm starting to get frustrated with you now...");
      }
      else if (funny == 10){
        println("Okay, at this point, you're trolling, aren't you?");
      }
      else if (funny == 11){
        println("Okay, stop, this isn't funny anymore. STOP.");
      }
      else if (funny == 12){
        println("I'm not engaging with you anymore. I'm just going to give you the silent treatment now.");
      }
      funny++;
    }
    else if (b == null && B == null && a == false){
      if (funni == 0){
        println("Look before you shoot.");
      }
      else if (funni == 1){
        println("There's no ships there to shoot lol");
      }
      else if (funni == 2){
        println("That's the background you're shooting at. Go shoot at the enemy ships instead.");
      }
      else if (funni == 3){
        println("Why are you shooting the background? I already told you there's no ships there.");
      }
      else if (funni == 4){
        println("Stop shooting at the background! There's no ships there!");
      }
      else if (funni == 5){
        println("What did the background ever do to deserve to be shot at?");
      }
      else if (funni == 6){
        println("STOP SHOOTING AT THE BACKGROUND!!!");
      }
      else if (funni == 7){
        println("Okay, let's take this slowly. STOP. SHOOTING. AT. THE. BACKGROUND. Got it?!");
      }
      else if (funni == 8){
        println("How many more times do I have to say it??? STOP SHOOTING AT THE BACKGROUND!!!");
      }
      else if (funni == 9){
        println("I'm starting to get frustrated with you now...");
      }
      else if (funny == 10){
        println("Okay, at this point, you're trolling, aren't you?");
      }
      else if (funny == 11){
        println("Okay, stop, this isn't funny anymore. STOP.");
      }
      else if (funny == 12){
        println("I'm not engaging with you anymore. I'm just going to give you the silent treatment now.");
      }
      funni++;
    }
    if (b!= null && b.shotAt == true){
      int random_funny = int(random(0, 5));
      if (random_funny == 0){
        println("You've already shot at that square!");
      }
      else if (random_funny == 1){
        println("Don't waste your turn.");
      }
      else if (random_funny == 2){
        println("Don't waste your shot.");
      }
      else if (random_funny == 3){
        println("Look before you shoot.");
      }
      else if (random_funny == 4){
        println("You already tried that one. Try a different one instead.");
      }
    }
    else if (b != null && B == null && b.shotAt == false){
      MOVES++;
      just_used_ability = false;
      b.hit(true, false);
      if (b.state == HIT || b.state == BLACK){
        b.shotAt = true;
      }
      //println("ROW " + mx1 + " COL " + my1);
      COMPUTERplays = true;
    } 
    else{
    }
    if (COMPUTERplays == true && difficulty == VeryEasy){
      Box BB = computer_accessVERYEASY();
      BB.hit(false, true);
      if (BB.state == HIT || BB.state == BLACK){
        BB.shotAt = true;
      }
      COMPUTERplays = false;
    }
    if (COMPUTERplays == true && difficulty == Easy){
      Box BB = computer_accessEASY();
      BB.hit(false, true);
      if (BB.state == HIT || BB.state == BLACK){
        BB.shotAt = true;
      }
      COMPUTERplays = false;
    }
    if (COMPUTERplays == true && difficulty == Normal){
      Box BB = computer_accessNORMAL(); 
      if (BB != null){
        BB.hit(false, true);
        if (BB.state == HIT || BB.state == BLACK){
          BB.shotAt = true;
        }
      }
      COMPUTERplays = false;
    }
    if (COMPUTERplays == true && difficulty == Hard){
      Box BB = computer_accessHARD();
      if (BB != null){
        BB.hit(false, true);
        if (BB.state == HIT || BB.state == BLACK){
          BB.shotAt = true;
        }
      }
      COMPUTERplays = false;
    }
    if (COMPUTERplays == true && difficulty == VeryHard){
      Box BB = computer_accessVERYHARD();
      if (BB != null){
        BB.hit(false, true);
        if (BB.state == HIT || BB.state == BLACK){
          BB.shotAt = true;
        }
      }
      if (DEATH >= 10){
        ENEMY_ABILITIES++;
        DEATH = 0;
      }
      COMPUTERplays = false;
    }
    if (COMPUTERplays == true && difficulty == VeryVeryHard){
      Box BB = computer_accessVERYVERYHARD();
      if (BB != null){
        BB.hit(false, true);
        if (BB.state == HIT || BB.state == BLACK){
          BB.shotAt = true;
        }
      }
      if (DEATH >= 3){
        println("The Nuke went off!");
        defeat = true;
      }
      COMPUTERplays = false;
    }
  }
  if (EHP <= 0 && played){
    victory = true; 
    if (MOVES <= 250){
      a9 = true;
    }
    if (FHP <= 10){
      a11 = true;
    }
    if (veryEasy == true){
      a1 = true;
    }
    if (easy == true){
      a2 = true;
    }
    if (normal == true){
      a3 = true;
    }
    if (hard == true){
      a4 = true;
      if (SET_ABILITIES == 0){
        a8 = true;
      }
    }
    if (veryHard == true){
      a5 = true;
      if (SET_ABILITIES == 0){
        a8 = true;
      }
    }
    if (veryveryHard == true){
      a6 = true;
      if (SET_ABILITIES == 0){
        a8 = true;
      }
    }
    if (a1b == false && a1 == true){
      TOTAL_ACH_THIS_ROUND++;
      a1b = true;
    }
    if (a2b == false && a2 == true){
      TOTAL_ACH_THIS_ROUND++;
      a2b = true;
    }
    if (a3b == false && a3 == true){
      TOTAL_ACH_THIS_ROUND++;
      a3b = true;
    }
    if (a4b == false && a4 == true){
      TOTAL_ACH_THIS_ROUND++;
      a4b = true;
    }
    if (a5b == false && a5 == true){
      TOTAL_ACH_THIS_ROUND++;
      a5b = true;
    }
    if (a6b == false && a6 == true){
      TOTAL_ACH_THIS_ROUND++;
      a6b = true;
    }
    if (a7b == false && a7 == true){
      TOTAL_ACH_THIS_ROUND++;
      a7b = true;
    }
    if (a8b == false && a8 == true){
      TOTAL_ACH_THIS_ROUND++;
      a8b = true;
    }
    if (a9b == false && a9 == true){
      TOTAL_ACH_THIS_ROUND++;
      a9b = true;
    }
    if (a10b == false && a10 == true){
      TOTAL_ACH_THIS_ROUND++;
      a10b = true;
    }
    if (a11b == false && a11 == true){
      TOTAL_ACH_THIS_ROUND++;
      a11b = true;
    }
    showPage(VICTORY);
  }
  if (FHP <= 0 && played){
    if (veryEasy == true && SET_ABILITIES == 6){
      a7 = true;
    }
    defeat = true; 
  }
  if (defeat){
    if (veryEasy == true && SET_ABILITIES == 6){
      a7 = true;
    }
    showPage(DEFEAT);
  }
}
  void Eplace(){
    AC = new AircraftCarrier(0, 0, false); AC.EplaceAircraftCarrier(); ships.add(AC);
    BA = new Battleship(0, 0, false); BA.EplaceBattleship(); ships.add(BA);
    sub1 = new Submarine(0, 0, false); sub1.EplaceSubmarine(); 
    sub2 = new Submarine(0, 0, false); sub2.EplaceSubmarine();
    H = new HospitalShip(0, 0, false); H.EplaceHospitalShip(); ships.add(H);
    r1 = new ReconnaissanceShip(0, 0, false); r1.EplaceReconnaissanceShip();
    r2 = new ReconnaissanceShip(0, 0, false); r2.EplaceReconnaissanceShip();
    r3 = new ReconnaissanceShip(0, 0, false); r3.EplaceReconnaissanceShip();
    c1 = new Cruiser(0, 0, false); c1.EplaceCruiser();
    c2 = new Cruiser(0, 0, false); c2.EplaceCruiser();
    c3 = new Cruiser(0, 0, false); c3.EplaceCruiser();
    c4 = new Cruiser(0, 0, false); c4.EplaceCruiser();
    d1 = new Destroyer(0, 0, false); d1.EplaceDestroyer();
    d2 = new Destroyer(0, 0, false); d2.EplaceDestroyer();
    d3 = new Destroyer(0, 0, false); d3.EplaceDestroyer();
    d4 = new Destroyer(0, 0, false); d4.EplaceDestroyer();
    d5 = new Destroyer(0, 0, false); d5.EplaceDestroyer();
    d6 = new Destroyer(0, 0, false); d6.EplaceDestroyer();
    d7 = new Destroyer(0, 0, false); d7.EplaceDestroyer();
    d8 = new Destroyer(0, 0, false); d8.EplaceDestroyer();
    f1 = new Frigate(0, 0, false); f1.EplaceFrigate();
    f2 = new Frigate(0, 0, false); f2.EplaceFrigate();
    f3 = new Frigate(0, 0, false); f3.EplaceFrigate();
    f4 = new Frigate(0, 0, false); f4.EplaceFrigate();
    f5 = new Frigate(0, 0, false); f5.EplaceFrigate();
    f6 = new Frigate(0, 0, false); f6.EplaceFrigate();
    f7 = new Frigate(0, 0, false); f7.EplaceFrigate();
    f8 = new Frigate(0, 0, false); f8.EplaceFrigate();
    f9 = new Frigate(0, 0, false); f9.EplaceFrigate();
    f10 = new Frigate(0, 0, false); f10.EplaceFrigate();
    pb1 = new PatrolBoat(0, 0, false); pb1.EplacePatrolBoat();
    pb2 = new PatrolBoat(0, 0, false); pb2.EplacePatrolBoat();
    pb3 = new PatrolBoat(0, 0, false); pb3.EplacePatrolBoat();
    pb4 = new PatrolBoat(0, 0, false); pb4.EplacePatrolBoat();
    pb5 = new PatrolBoat(0, 0, false); pb5.EplacePatrolBoat();
    pb6 = new PatrolBoat(0, 0, false); pb6.EplacePatrolBoat();
    pb7 = new PatrolBoat(0, 0, false); pb7.EplacePatrolBoat();
    pb8 = new PatrolBoat(0, 0, false); pb8.EplacePatrolBoat();
    pb9 = new PatrolBoat(0, 0, false); pb9.EplacePatrolBoat();
    pb10 = new PatrolBoat(0, 0, false); pb10.EplacePatrolBoat();
    pb11 = new PatrolBoat(0, 0, false); pb11.EplacePatrolBoat();
    pb12 = new PatrolBoat(0, 0, false); pb12.EplacePatrolBoat();
    pb13 = new PatrolBoat(0, 0, false); pb13.EplacePatrolBoat();
    pb14 = new PatrolBoat(0, 0, false); pb14.EplacePatrolBoat();
    pb15 = new PatrolBoat(0, 0, false); pb15.EplacePatrolBoat();
    pb16 = new PatrolBoat(0, 0, false); pb16.EplacePatrolBoat();
    r.add(r1); r.add(r2); r.add(r3);
    c.add(c1); c.add(c2); c.add(c3); c.add(c4);
    d.add(d1); d.add(d2); d.add(d3); d.add(d4); d.add(d5); d.add(d6); d.add(d7); d.add(d8);
    f.add(f1); f.add(f2); f.add(f3); f.add(f4); f.add(f5); f.add(f6); f.add(f7); f.add(f8); f.add(f9); f.add(f10);
    pb.add(pb1); pb.add(pb2); pb.add(pb3); pb.add(pb4); pb.add(pb5); pb.add(pb6); pb.add(pb7); pb.add(pb8);
    pb.add(pb9); pb.add(pb10); pb.add(pb11); pb.add(pb12); pb.add(pb13); pb.add(pb14); pb.add(pb15); pb.add(pb16);
    s.add(sub1); s.add(sub2);
    for (int i = 0; i < c.size(); i++){
      ships.add(c.get(i)); 
    }
    for (int j = 0; j < d.size(); j++){
      ships.add(d.get(j));
    }
    for (int k = 0; k < f.size(); k++){
      ships.add(f.get(k));
    }
    for (int l = 0; l < r.size(); l++){
      ships.add(r.get(l));
    }
    for (int L = 0; L < pb.size(); L++){
      ships.add(pb.get(L));
    }
    for (int m = 0; m < s.size(); m++){
      ships.add(s.get(m));
    }
    for (int n = 0; n < ships.size(); n++){
      for (int nn = 0; nn < ships.get(n).occupied.size(); nn++){
        Box bb = ships.get(n).occupied.get(nn).link(Egrid, ships.get(n).occupied.get(nn));
        ships.get(n).occupiedongrid.add(bb);
        int T = ships.get(n).type;
        if (T == CRUISER){
          bb.HP = 2;
          bb.shipState = CRUISER;
          bb.state = ARMOR;
        }
        if (T == BATTLESHIP){
          bb.HP = 3;
          bb.shipState = BATTLESHIP;
          bb.state = HEAVY_ARMOR;
        }
        if (T == AIRCRAFT_CARRIER){
          bb.HP = 1;
          bb.shipState = AIRCRAFT_CARRIER;
          bb.state = GOLD;
        }
        if (T == PATROL_BOAT){
          bb.HP = 1;
          bb.shipState = PATROL_BOAT;
          bb.state = SHIP;
        }
        if (T == DESTROYER){
          bb.HP = 1;
          bb.shipState = DESTROYER;
          bb.state = DESTROYER;
        }
        if (T == HOSPITAL_SHIP){
          bb.HP = 1;
          bb.shipState = HOSPITAL_SHIP;
          bb.state = HOSPITAL_SHIP;
        }
        if (T == RECONNAISSANCE_SHIP){
          bb.HP = 1;
          bb.shipState = RECONNAISSANCE_SHIP;
          bb.state = RECONNAISSANCE_SHIP;
        }
        if (T == FRIGATE){
          bb.HP = 1;
          bb.shipState = FRIGATE;
          bb.state = FRIGATE;
        }
        if (T == SUBMARINE){
          bb.HP = 1;
          bb.shipState = SUBMARINE;
          bb.state = SUBMARINE;
        }
        bb.display_initial(); 
        bb.doHP(bb.shipState);
      }
      for (int o = 0; o < ships.size(); o++){
        aliveShips.add(ships.get(o));
      }
    }
  }
  void Fplace(){
    AC = new AircraftCarrier(0, 0, true); AC.FplaceAircraftCarrier(); ships.add(AC);
    BA = new Battleship(0, 0, true); BA.FplaceBattleship(); ships.add(BA);
    sub1 = new Submarine(0, 0, true); sub1.FplaceSubmarine(); 
    sub2 = new Submarine(0, 0, true); sub2.FplaceSubmarine();
    H = new HospitalShip(0, 0, true); H.FplaceHospitalShip(); ships.add(H);
    r1 = new ReconnaissanceShip(0, 0, true); r1.FplaceReconnaissanceShip();
    r2 = new ReconnaissanceShip(0, 0, true); r2.FplaceReconnaissanceShip();
    r3 = new ReconnaissanceShip(0, 0, true); r3.FplaceReconnaissanceShip();
    c1 = new Cruiser(0, 0, true); c1.FplaceCruiser();
    c2 = new Cruiser(0, 0, true); c2.FplaceCruiser();
    c3 = new Cruiser(0, 0, true); c3.FplaceCruiser();
    c4 = new Cruiser(0, 0, true); c4.FplaceCruiser();
    d1 = new Destroyer(0, 0, true); d1.FplaceDestroyer();
    d2 = new Destroyer(0, 0, true); d2.FplaceDestroyer();
    d3 = new Destroyer(0, 0, true); d3.FplaceDestroyer();
    d4 = new Destroyer(0, 0, true); d4.FplaceDestroyer();
    d5 = new Destroyer(0, 0, true); d5.FplaceDestroyer();
    d6 = new Destroyer(0, 0, true); d6.FplaceDestroyer();
    d7 = new Destroyer(0, 0, true); d7.FplaceDestroyer();
    d8 = new Destroyer(0, 0, true); d8.FplaceDestroyer();
    f1 = new Frigate(0, 0, true); f1.FplaceFrigate();
    f2 = new Frigate(0, 0, true); f2.FplaceFrigate();
    f3 = new Frigate(0, 0, true); f3.FplaceFrigate();
    f4 = new Frigate(0, 0, true); f4.FplaceFrigate();
    f5 = new Frigate(0, 0, true); f5.FplaceFrigate();
    f6 = new Frigate(0, 0, true); f6.FplaceFrigate();
    f7 = new Frigate(0, 0, true); f7.FplaceFrigate();
    f8 = new Frigate(0, 0, true); f8.FplaceFrigate();
    f9 = new Frigate(0, 0, true); f9.FplaceFrigate();
    f10 = new Frigate(0, 0, true); f10.FplaceFrigate();
    pb1 = new PatrolBoat(0, 0, true); pb1.FplacePatrolBoat();
    pb2 = new PatrolBoat(0, 0, true); pb2.FplacePatrolBoat();
    pb3 = new PatrolBoat(0, 0, true); pb3.FplacePatrolBoat();
    pb4 = new PatrolBoat(0, 0, true); pb4.FplacePatrolBoat();
    pb5 = new PatrolBoat(0, 0, true); pb5.FplacePatrolBoat();
    pb6 = new PatrolBoat(0, 0, true); pb6.FplacePatrolBoat();
    pb7 = new PatrolBoat(0, 0, true); pb7.FplacePatrolBoat();
    pb8 = new PatrolBoat(0, 0, true); pb8.FplacePatrolBoat();
    pb9 = new PatrolBoat(0, 0, true); pb9.FplacePatrolBoat();
    pb10 = new PatrolBoat(0, 0, true); pb10.FplacePatrolBoat();
    pb11 = new PatrolBoat(0, 0, true); pb11.FplacePatrolBoat();
    pb12 = new PatrolBoat(0, 0, true); pb12.FplacePatrolBoat();
    pb13 = new PatrolBoat(0, 0, true); pb13.FplacePatrolBoat();
    pb14 = new PatrolBoat(0, 0, true); pb14.FplacePatrolBoat();
    pb15 = new PatrolBoat(0, 0, true); pb15.FplacePatrolBoat();
    pb16 = new PatrolBoat(0, 0, true); pb16.FplacePatrolBoat();
    r.add(r1); r.add(r2); r.add(r3);
    c.add(c1); c.add(c2); c.add(c3); c.add(c4);
    d.add(d1); d.add(d2); d.add(d3); d.add(d4); d.add(d5); d.add(d6); d.add(d7); d.add(d8);
    f.add(f1); f.add(f2); f.add(f3); f.add(f4); f.add(f5); f.add(f6); f.add(f7); f.add(f8); f.add(f9); f.add(f10);
    pb.add(pb1); pb.add(pb2); pb.add(pb3); pb.add(pb4); pb.add(pb5); pb.add(pb6); pb.add(pb7); pb.add(pb8);
    pb.add(pb9); pb.add(pb10); pb.add(pb11); pb.add(pb12); pb.add(pb13); pb.add(pb14); pb.add(pb15); pb.add(pb16);
    s.add(sub1); s.add(sub2);
    for (int i = 0; i < c.size(); i++){
    ships.add(c.get(i)); 
      }
    for (int j = 0; j < d.size(); j++){
      ships.add(d.get(j));
    }
    for (int k = 0; k < f.size(); k++){
      ships.add(f.get(k));
    }
    for (int l = 0; l < r.size(); l++){
      ships.add(r.get(l));
    }
    for (int L = 0; L < pb.size(); L++){
      ships.add(pb.get(L));
    }
    for (int m = 0; m < s.size(); m++){
      ships.add(s.get(m));
    }
    for (int n = 0; n < ships.size(); n++){
      for (int nn = 0; nn < ships.get(n).occupied.size(); nn++){
        Box bb = ships.get(n).occupied.get(nn).link(Fgrid, ships.get(n).occupied.get(nn));
        ships.get(n).occupiedongrid.add(bb);        
        int T = ships.get(n).type;
        if (T == CRUISER){
          bb.HP = 2;
          bb.shipState = CRUISER;
          bb.state = ARMOR;
        }
        if (T == BATTLESHIP){
          bb.HP = 3;
          bb.shipState = BATTLESHIP;
          bb.state = HEAVY_ARMOR;
        }
        if (T == AIRCRAFT_CARRIER){
          bb.HP = 1;
          bb.shipState = AIRCRAFT_CARRIER;
          bb.state = GOLD;
        }
        if (T == PATROL_BOAT){
          bb.HP = 1;
          bb.shipState = PATROL_BOAT;
          bb.state = SHIP;
        }
        if (T == DESTROYER){
          bb.HP = 1;
          bb.shipState = DESTROYER;
          bb.state = DESTROYER;
        }
        if (T == HOSPITAL_SHIP){
          bb.HP = 1;
          bb.shipState = HOSPITAL_SHIP;
          bb.state = HOSPITAL_SHIP;
        }
        if (T == RECONNAISSANCE_SHIP){
          bb.HP = 1;
          bb.shipState = RECONNAISSANCE_SHIP;
          bb.state = RECONNAISSANCE_SHIP;
        }
        if (T == FRIGATE){
          bb.HP = 1;
          bb.shipState = FRIGATE;
          bb.state = FRIGATE;
        }
        if (T == SUBMARINE){
          bb.HP = 1;
          bb.shipState = SUBMARINE;
          bb.state = SUBMARINE;
        }
        bb.display_friendly(); 
        bb.doHP(bb.shipState);
      }
    }
    for (int o = 0; o < ships.size(); o++){
      aliveShips.add(ships.get(o));
    }
  }
}
