

//box states
int BLACK = 0; //miss #000000
int WHITE = 1; //blank/untouched
int HIT = 10; //hit #FF0000 (red)
int SHIP = 11; //normal ship #B19CD9 (light purple)
int ARMOR = 21; //armored ship #A9A9A9 (gray)
int HEAVY_ARMOR = 31; //heavily armored ship #696969 (dark gray)
int GOLD = 41; //used for the aircraft carrier #FFDB51 (bright gold)
int SUBMARINE = 69; //submarine #00FF00 (green)
//submarine is to be camouflaged/submerged 
int PATROL_BOAT = 70;
int FRIGATE = 71;
int DESTROYER = 72;
int CRUISER = 73;
int BATTLESHIP = 74;
int AIRCRAFT_CARRIER = 75;

color BC = #00B0F4; //background color, lighter variant of sea blue

//use this to display actions
String youraction = "";
String enemyaction = "";

Grid Egrid;
Grid Fgrid;

void setup(){
  size(1500, 705);
  background(BC); 
  Egrid = new Grid();
  Fgrid = new Grid();
  Egrid.drawGridEnemy();
  Fgrid.drawGridFriendly();
  Egrid.link(Egrid);
  Fgrid.link(Fgrid);
  Egrid.Eplace();
  textSize(18);
  fill(0);
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
}

void draw(){
  
}

void mouseClicked(){
  
}
