//https://www.datagenetics.com/blog/december32011/

//box states
int BLACK = 0; //miss #000000
int WHITE = 1; //blank/untouched
int HIT = 10; //hit #FF0000 (red)
int SHIP = 11; //normal ship #B19CD9 (light purple)
int ARMOR = 21; //armored ship #A9A9A9 (gray)
int HEAVY_ARMOR = 31; //heavily armored ship #696969 (dark gray)
int GOLD = 41; //used for the aircraft carrier #FFDB51 (bright gold)
int HOSPITAL_SHIP = 68; //hospital ship #FF7700 (fire orange)
int SUBMARINE = 69; //submarine #22D055 (dark green)
//submarine is to be camouflaged/submerged 
int PATROL_BOAT = 70;
int FRIGATE = 71;
int DESTROYER = 72;
int CRUISER = 73;
int BATTLESHIP = 74;
int AIRCRAFT_CARRIER = 75;
int RECONNAISSANCE_SHIP = 76; //reconnaissance ship #78866B

//game states
int CURRENT_PAGE = 0;
int MENU = 100;
int PLAY = 101;
int DEFEAT = 444;
int VICTORY = 555;
boolean in_play = false; boolean defeat = false; boolean victory = false;
int computer_hit_compass = 0;
int computer_hit_streak = 0;
boolean targeting = false;
Box target_basis = null; //use this to aid the computer in determining which box to go for after securing a hit
ArrayList<Box> possible_computer_targets = new ArrayList<Box>();
ArrayList<Box> computer_targets = new ArrayList<Box>();
ArrayList<Box> possible_targets = new ArrayList<Box>();

color BC = #00B0F4; //background color, lighter variant of sea blue

Grid Egrid;
Grid Fgrid;
int EHP = 0; int FHP = 0;
int funny = 0; int funni = 0;
boolean COMPUTERplays = false;

//difficulties
boolean veryEasy = false;
boolean easy = false;
boolean normal = true; //change to false later
boolean hard = false;
int VeryEasy = 800;
int Easy = 801;
int Normal = 802;
int Hard = 803;

//abilities
int ABILITIES = 0;  
int ENEMY_ABILITIES = 0;
int circleLight1x = 1250; int circleLight2x = 1320; int circleLight3x = 1390; int circleLighty = 140;
Ability circleLight1 = new Ability(circleLight1x, circleLighty); 
Ability circleLight2 = new Ability(circleLight2x, circleLighty); 
Ability circleLight3 = new Ability(circleLight3x, circleLighty);
boolean fmissiles; boolean fbomb;
boolean emissiles; boolean ebomb;
int missiles = 900; int bomb = 901;
Ability Fmissiles = new Ability(missiles, true, 1230, 220, 180, 50); //randomly hits 75 squares
Ability Fbomb = new Ability(bomb, true, 1230, 290, 180, 50); //utterly destroys 61 squares in a diamond-like formation

void setup(){
  size(1500, 705);
  background(BC);
  showPage(PLAY);
}

void draw(){
  if (EHP <= 0){
    in_play = false; victory = true;
  }
  if (FHP <= 0){
    in_play = false; defeat = true;
  }
}

void mouseClicked(){
  if (in_play && mouseX >= 1230 && mouseX <= 1410 && mouseY >= 220 && mouseY <= 270 && fmissiles == true && ABILITIES > 0){
    Fmissiles.use(); Fmissiles.off(); Fmissiles.display(); Fmissiles.turnOffLight(); fmissiles = false; ABILITIES--; COMPUTERplays = true; 
  }
  if (in_play && mouseX >= 1230 && mouseX <= 1410 && mouseY >= 290 && mouseY <= 340 && fbomb == true && ABILITIES > 0){
    Fbomb.use(); Fbomb.off(); Fbomb.display(); Fbomb.turnOffLight(); fbomb = false; ABILITIES--; COMPUTERplays = true; 
  }
  println(COMPUTERplays);
  if (in_play && veryEasy){
    Egrid.PLAYERplays(mouseX, mouseY, VeryEasy);
  }
  if (in_play && easy){
    Egrid.PLAYERplays(mouseX, mouseY, Easy);
  }
  if (in_play && normal){
    Egrid.PLAYERplays(mouseX, mouseY, Normal);
  }
}

void showPage(int currentPage){
  CURRENT_PAGE = currentPage;
  showPage();
}

void showPage(){
  if (CURRENT_PAGE == MENU){
  }
  else if (CURRENT_PAGE == PLAY){
    setUp();
    if (veryEasy || easy){
      emissiles = false;
      ENEMY_ABILITIES = 0;
    }
    else if (normal){
      ENEMY_ABILITIES = 3;
    }
  }
  else if (CURRENT_PAGE == DEFEAT){
  }
  else if (CURRENT_PAGE == VICTORY){
  }
}

void setUp(){
  fmissiles = true; fbomb = true;
  emissiles = true; ebomb = true;
  ABILITIES = 3;
  EHP = 181; //HP of all enemy ships combined in enemy grid
  FHP = 181; //HP of all friendly ships combined in friendly grid
  circleLight1.abilitylights(); circleLight2.abilitylights(); circleLight3.abilitylights();
  Egrid = new Grid();
  Fgrid = new Grid();
  Egrid.drawGridEnemy();
  Fgrid.drawGridFriendly();
  Egrid.link(Egrid);
  Fgrid.link(Fgrid);
  Egrid.Eplace();
  Fgrid.Fplace();
  Fmissiles.display(); Fbomb.display();
  textSize(18);
  fill(0);
  text("Missiles", 1280, 250); text("Carpet  Bombing", 1260, 320);
  //text("Please view the console to see actions.", 30, 55); //"Enemy Action"
  //text("Your Action:", 620, 55);
  textSize(25);
  text("Enemy Ships", 125, 105);
  text("Your Ships", 660, 105);
  textSize(15);
  text("A    B    C    D    E    F    G    H     I     J    K     L     M", 10, 140);
  text("N    O    P    Q    R    S    T    U    V    W    X    Y    Z", 282, 140);
  text("A    B    C    D    E    F    G    H     I     J    K     L     M", 607, 140);
  text("N    O    P    Q    R    S    T    U    V    W    X    Y    Z", 879, 140);
  text("1", 575, 165); text("2", 575, 187); text("3", 575, 209); text("4", 575, 231);
  text("5", 575, 251); text("6", 575, 273); text("7", 575, 294); text("8", 575, 315);
  text("9", 575, 336); text("10", 570, 357); text("11", 570, 378); text("12", 570, 399);
  text("13", 570, 420); text("14", 570, 440); text("15", 570, 460); text("16", 570, 481);
  text("17", 570, 502); text("18", 570, 523); text("19", 570, 544); text("20", 570, 565);
  text("21", 570, 586); text("22", 570, 607);text("23", 570, 628);text("24", 570, 649);
  text("25", 570, 670); text("26", 570, 692);
  textSize(30);
  text("ABILITIES", 1255, 95);
  in_play = true;
}
