//https://www.datagenetics.com/blog/december32011
//Sound Library


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
int HOME = 100;
int HELP = 101;
int A1 = 161; int A2 = 162;
int S1 = 171; int S2 = 172;
int R1 = 181; 
int D1= 191; int D2 = 192;
int SETTINGS = 102;
int MENU = 110;
int PLAY = 120;
int DEFEAT = 444;
int VICTORY = 555;
boolean in_play = false; boolean defeat = false; boolean victory = false; boolean played = false;
int computer_hit_compass = 0;
int computer_hit_streak = 0;
boolean targeting = false;
Box target_basis = null; //use this to aid the computer in determining which box to go for after securing a hit
ArrayList<Box> possible_computer_targets = new ArrayList<Box>();
ArrayList<Box> computer_targets = new ArrayList<Box>();
ArrayList<Box> possible_targets = new ArrayList<Box>();

color BC = #00B0F4; //background color, lighter variant of sea blue
color CYAN = #00FFFF; //cyan

Grid Egrid;
Grid Fgrid;
int EHP = 0; int FHP = 0;
int funny = 0; int funni = 0;
boolean COMPUTERplays = false;

//difficulties
boolean veryEasy = false;
boolean easy = false;
boolean normal = false;
boolean hard = false;
boolean veryHard = false;
boolean veryveryHard = false;
int recorded_difficulty = -1;
int VeryEasy = 800;
int Easy = 801;
int Normal = 802;
int Hard = 803;
int VeryHard = 804;
int VeryVeryHard = 805;
int DEATH = 0;
int ALLDEATH = 0;
int Dd = 0;

//abilities
int ABILITIES = 0;  
int SET_ABILITIES = 3;
int ENEMY_ABILITIES = 0;
boolean just_used_ability = false;
int circleLight1x = 1250; int circleLight2x = 1320; int circleLight3x = 1390; int circleLightyA = 135; int circleLightyB = 190;
Ability circleLight1; Ability circleLight2; Ability circleLight3; Ability circleLight4; Ability circleLight5; Ability circleLight6;
boolean fmissiles; boolean fbomb; boolean flaser; boolean fsonar; boolean fspontaneousexplosion; boolean freconnaissance; boolean usedsonar;
boolean emissiles; boolean ebomb; boolean elaser; boolean esonar; boolean espontaneousexplosion; boolean ereconnaissance; 
int missiles = 900; int bomb = 901; int laser = 902; int sonar = 903; int spontaneousexplosion = 904; int reconnaissance = 905; 
Ability Fmissiles = new Ability(missiles, true, 1230, 220, 180, 50); //randomly hits 75 squares
Ability Emissiles = new Ability(missiles, false);
Ability Fbomb = new Ability(bomb, true, 1230, 290, 180, 50); //utterly destroys 61 squares in a diamond-like formation
Ability Ebomb = new Ability(bomb, false);
Ability Flaser = new Ability(laser, true, 1230, 360, 180, 50); //utterly destroys all squares that share target's row and/or column, plus 12 squares closest to target on the target's diagonals (63 squares)
Ability Elaser = new Ability(laser, false);
Ability Fsonar = new Ability(sonar, true, 1230, 430, 180, 50); //reveal opposing submarines
Ability Esonar = new Ability(sonar, false);
Ability Fspontaneousexplosion = new Ability(spontaneousexplosion, true, 1230, 500, 180, 50); //forces all 1x1 ships to explode
Ability Espontaneousexplosion = new Ability(spontaneousexplosion, false);
Ability Freconnaissance = new Ability(reconnaissance, true, 1230, 570, 180, 50); //reveals a huge section of the map, without exposing submarines
Ability Ereconnaissance = new Ability(reconnaissance, false);

//settings
Settings cero; 
Settings uno; 
Settings dos; 
Settings tres; 
Settings cuatro;  
Settings cinco; 
Settings seis; 
ArrayList<Settings> SettingsArr = new ArrayList <Settings>();

void setup(){
  size(1500, 705);
  showPage(HOME); //change to HOME later
  cero = new Settings(425, 150, 50);
  uno = new Settings(525, 150, 50);  
  dos = new Settings(625, 150, 50); 
  tres = new Settings(725, 150, 50, true); 
  cuatro = new Settings(825, 150, 50); 
  cinco = new Settings(925, 150, 50);
  seis = new Settings(1025, 150, 50);
  SettingsArr.add(cero); 
  SettingsArr.add(uno);
  SettingsArr.add(dos);
  SettingsArr.add(tres);
  SettingsArr.add(cuatro);
  SettingsArr.add(cinco);
  SettingsArr.add(seis);
}

void draw(){
}

void mouseClicked(){
  if (CURRENT_PAGE == HOME && mouseX >= 240 && mouseX <= 1290 && mouseY >= 400 && mouseY <= 480){
    showPage(MENU); 
  }
  if (CURRENT_PAGE == HOME && mouseX >= 773 && mouseX <= 1290 && mouseY >= 500 && mouseY <= 560){
    showPage(SETTINGS);
  }
  if ((CURRENT_PAGE == MENU || CURRENT_PAGE == HELP) && mouseX >= 10 && mouseX <= 160 && mouseY >= 10 && mouseY <= 50){
    showPage(HOME);
  }
  if (CURRENT_PAGE == MENU && mouseX >= 240 && mouseX <= 1290 && mouseY >= 100 && mouseY <= 160){
    veryEasy = true; showPage(PLAY); recorded_difficulty = VeryEasy;
  }
  if (CURRENT_PAGE == MENU && mouseX >= 240 && mouseX <= 1290 && mouseY >= 180 && mouseY <= 240){
    easy = true; showPage(PLAY); recorded_difficulty = Easy;
  }
  if (CURRENT_PAGE == MENU && mouseX >= 240 && mouseX <= 1290 && mouseY >= 260 && mouseY <= 320){
    normal = true; showPage(PLAY); recorded_difficulty = Normal;
  }
  if (CURRENT_PAGE == MENU && mouseX >= 240 && mouseX <= 1290 && mouseY >= 380 && mouseY <= 440){
    hard = true; showPage(PLAY); recorded_difficulty = Hard;
  }
  if (CURRENT_PAGE == MENU && mouseX >= 240 && mouseX <= 1290 && mouseY >= 460 && mouseY <= 520){
    veryHard = true; showPage(PLAY); recorded_difficulty = VeryHard;
  }
  if (CURRENT_PAGE == MENU && mouseX >= 240 && mouseX <= 1290 && mouseY >= 540 && mouseY <= 600){
    veryveryHard = true; showPage(PLAY); recorded_difficulty = VeryVeryHard;
  }
  if (in_play && mouseX >= 1230 && mouseX <= 1410 && mouseY >= 220 && mouseY <= 270 && fmissiles == true && ABILITIES > 0){
    Fmissiles.use(); Fmissiles.off(); Fmissiles.display(); Fmissiles.turnOffLight(SET_ABILITIES); fmissiles = false; ABILITIES--; COMPUTERplays = true; 
  }
  if (in_play && mouseX >= 1230 && mouseX <= 1410 && mouseY >= 290 && mouseY <= 340 && fbomb == true && ABILITIES > 0){
    Fbomb.use(); Fbomb.off(); Fbomb.display(); Fbomb.turnOffLight(SET_ABILITIES); fbomb = false; ABILITIES--; COMPUTERplays = true; 
  }
  if (in_play && mouseX >= 1230 && mouseX <= 1410 && mouseY >= 360 && mouseY <= 410 && flaser == true && ABILITIES > 0){
    Flaser.use(); Flaser.off(); Flaser.display(); Flaser.turnOffLight(SET_ABILITIES); flaser = false; ABILITIES--; COMPUTERplays = true;
  }
  if (in_play && mouseX >= 1230 && mouseX <= 1410 && mouseY >= 430 && mouseY <= 480 && fsonar == true && ABILITIES > 0){
    Fsonar.use(); usedsonar = true; Fsonar.off(); Fsonar.display(); Fsonar.turnOffLight(SET_ABILITIES); fsonar = false; ABILITIES--; COMPUTERplays = true; 
  }
  if (in_play && mouseX >= 1230 && mouseX <= 1410 && mouseY >= 500 && mouseY <= 550 && fspontaneousexplosion == true && ABILITIES > 0){
    Fspontaneousexplosion.use(); Fspontaneousexplosion.off(); Fspontaneousexplosion.display(); Fspontaneousexplosion.turnOffLight(SET_ABILITIES); fspontaneousexplosion = false; ABILITIES--; COMPUTERplays = true;
  }
  if (in_play && mouseX >= 1230 && mouseX <= 1410 && mouseY >= 570 && mouseY <= 620 && freconnaissance == true && ABILITIES > 0){
    Freconnaissance.use(); Freconnaissance.off(); Freconnaissance.display(); Freconnaissance.turnOffLight(SET_ABILITIES); freconnaissance = false; ABILITIES--; COMPUTERplays = true;
  }
  if (in_play && veryEasy){
    Egrid.PLAYERplays(mouseX, mouseY, VeryEasy);
  }
  if (in_play && easy){
    Egrid.PLAYERplays(mouseX, mouseY, Easy);
  }
  if (in_play && normal){
    Egrid.PLAYERplays(mouseX, mouseY, Normal);
  }
  if (in_play && hard){
    Egrid.PLAYERplays(mouseX, mouseY, Hard);
  } 
  if (in_play && veryHard){
    Egrid.PLAYERplays(mouseX, mouseY, VeryHard);
  }
  if (in_play && veryveryHard){
    Egrid.PLAYERplays(mouseX, mouseY, VeryVeryHard);
  }
  if (CURRENT_PAGE == SETTINGS && mouseX >= 580 && mouseX <= 920 && mouseY >= 620 && mouseY <= 680){
    showPage(HOME);
  }
  if (CURRENT_PAGE == SETTINGS && mouseX >= 425 && mouseY <= 475 && mouseY >= 150 && mouseY <= 200){
    SET_ABILITIES = 0; ABILITIES = SET_ABILITIES;
    for (int i = 0; i < SettingsArr.size(); i++){
      SettingsArr.get(i).OnOff = false;
      SettingsArr.get(i).display();
    }
    cero.Switch();
  }
  if (CURRENT_PAGE == SETTINGS && mouseX >= 525 && mouseY <= 575 && mouseY >= 150 && mouseY <= 200){
    SET_ABILITIES = 1; ABILITIES = SET_ABILITIES;
    for (int i = 0; i < SettingsArr.size(); i++){
      SettingsArr.get(i).OnOff = false;
      SettingsArr.get(i).display();
    }
   uno.Switch();
  }
  if (CURRENT_PAGE == SETTINGS && mouseX >= 625 && mouseY <= 675 && mouseY >= 150 && mouseY <= 200){
    SET_ABILITIES = 2; ABILITIES = SET_ABILITIES;
    for (int i = 0; i < SettingsArr.size(); i++){
      SettingsArr.get(i).OnOff = false;
      SettingsArr.get(i).display();
    }
    dos.Switch(); 
  }
  if (CURRENT_PAGE == SETTINGS && mouseX >= 725 && mouseY <= 775 && mouseY >= 150 && mouseY <= 200){
    SET_ABILITIES = 3; ABILITIES = SET_ABILITIES;
    for (int i = 0; i < SettingsArr.size(); i++){
      SettingsArr.get(i).OnOff = false;
      SettingsArr.get(i).display();
    }
    tres.Switch();
  }
  if (CURRENT_PAGE == SETTINGS && mouseX >= 825 && mouseY <= 875 && mouseY >= 150 && mouseY <= 200){
    SET_ABILITIES = 4; ABILITIES = SET_ABILITIES;
    for (int i = 0; i < SettingsArr.size(); i++){
      SettingsArr.get(i).OnOff = false;
      SettingsArr.get(i).display();
    }
    cuatro.Switch();
  }
  if (CURRENT_PAGE == SETTINGS && mouseX >= 925 && mouseY <= 975 && mouseY >= 150 && mouseY <= 200){
    SET_ABILITIES = 5; ABILITIES = SET_ABILITIES;
    for (int i = 0; i < SettingsArr.size(); i++){
      SettingsArr.get(i).OnOff = false;
      SettingsArr.get(i).display();
    }
    cinco.Switch(); 
  }
  if (CURRENT_PAGE == SETTINGS && mouseX >= 1025 && mouseY <= 1075 && mouseY >= 150 && mouseY <= 200){
    SET_ABILITIES = 6; ABILITIES = SET_ABILITIES;
    for (int i = 0; i < SettingsArr.size(); i++){
      SettingsArr.get(i).OnOff = false;
      SettingsArr.get(i).display();
    }
    seis.Switch(); 
  }
  if ((CURRENT_PAGE == DEFEAT || CURRENT_PAGE == VICTORY) && mouseX >= 240 && mouseX <= 1290 && mouseY >= 400 && mouseY <= 480){
    victory = false; defeat = false; played = false; showPage(HOME);
  }
  if (CURRENT_PAGE == HOME && mouseX >= 240 && mouseX <= 758 && mouseY >= 500 && mouseY <= 560){
    showPage(HELP);
  }
  if (CURRENT_PAGE == HELP && mouseX >= 240 && mouseX <= 1290 && mouseY >= 200 && mouseY <= 260){
    showPage(A1);
  }//rect(10, 10, 150, 40);
  if ((CURRENT_PAGE == A1 || CURRENT_PAGE == S1 || CURRENT_PAGE == D1 || CURRENT_PAGE == R1) && mouseX >= 10 && mouseX <= 160 && mouseY >= 10 && mouseY <= 50){
    showPage(HELP);
  }
  if (CURRENT_PAGE == A1 && mouseX >= 1340 && mouseX <= 1490 && mouseY >= 10 && mouseY <= 50){
    showPage(A2);
  }
  if (CURRENT_PAGE == A2 && mouseX >= 10 && mouseX <= 160 && mouseY >= 10 && mouseY <= 50){
    showPage(A1);
  }
  if (CURRENT_PAGE == HELP && mouseX >= 240 && mouseX <= 1290 && mouseY >= 440 && mouseY <= 500){
    showPage(D1);
  }
  if (CURRENT_PAGE == D1 && mouseX >= 1340 && mouseX <= 1490 && mouseY >= 10 && mouseY <= 50){
    showPage(D2);
  }
  if (CURRENT_PAGE == D2 && mouseX >= 10 && mouseX <= 160 && mouseY >= 10 && mouseY <= 50){
    showPage(D1);
  }
  if (CURRENT_PAGE == HELP && mouseX >= 240 && mouseX <= 1290 && mouseY >= 280 && mouseY <= 340){
    showPage(S1);
  }
  if (CURRENT_PAGE == S1 && mouseX >= 1340 && mouseX <= 1490 && mouseY >= 10 && mouseY <= 50){
    showPage(S2);
  }
  if (CURRENT_PAGE == S2 && mouseX >= 10 && mouseX <= 160 && mouseY >= 10 && mouseY <= 50){
    showPage(S1);
  }
  if (CURRENT_PAGE == HELP && mouseX >= 240 && mouseX <= 1290 && mouseY >= 360 && mouseY <= 420){
    showPage(R1);
  }
}

void showPage(int currentPage){
  CURRENT_PAGE = currentPage;
  showPage();
}

void showPage(){
  if (CURRENT_PAGE == HOME){
    setUpHome();
  }
  else if (CURRENT_PAGE == MENU){
    setUpMenu();
  }
  else if (CURRENT_PAGE == S1){
    setUpS1();
  }
  else if (CURRENT_PAGE == S2){
    setUpS2();
  }
  else if (CURRENT_PAGE == R1){
    setUpR1();
  }
  else if (CURRENT_PAGE == D1){
    setUpD1();
  }
  else if (CURRENT_PAGE == D2){
    setUpD2();
  }
  else if (CURRENT_PAGE == A1){
    setUpA1();
  }
  else if (CURRENT_PAGE == A2){
    setUpA2();
  }
  else if (CURRENT_PAGE == PLAY){
    setUpPlay();
    if (veryEasy || easy){
      ENEMY_ABILITIES = 0;
    }
    else if (normal){
      ENEMY_ABILITIES = 3;
    }
    else if (hard){
      ENEMY_ABILITIES = 6;
    }
    else if (veryHard || veryveryHard){
      ENEMY_ABILITIES = 6;
    }
  }
  else if (CURRENT_PAGE == SETTINGS){
    setUpSettings();
  }
  else if (CURRENT_PAGE == HELP){
    setUpHelp();
  }
  else if (CURRENT_PAGE == DEFEAT){
    setUpFinishedGame();
    setUpDefeat();
  }
  else if (CURRENT_PAGE == VICTORY){
    setUpFinishedGame();
    setUpVictory();
  }
}
void setUpR1(){ 
  background(0);
  fill(#CD7F32); 
  rect(10, 10, 150, 40);
  fill(#4997D0);
  textSize(45);
  text("RULES", 650, 60);
  textSize(25);
  text("1. Each player has the same number of each type of ship. Ships are set up in such a way that no ship overlaps with another.", 100, 110);
  text("Ships are placed horizontally or vertically. However, ships may be adjacent with each other, so it is advised that you ", 100, 140);
  text("familiarize yourself with the shape and/or length of each ship. Ship placement is randomly generated. Ships may not change", 100, 170);
  text("position after being placed. Ships may not exit the grid. All ships are placed wholly within their respective grids.", 100, 200);
  text("2. You (the player) and your opponent (the computer) will take turns shooting at the other's grid of ships via clicking on the", 100, 250);
  text("desired square. If the square turns black, that (usually) means you missed. If the square turns red, that means you scored a hit.", 100, 280);
  text("Unless otherwise indicated, players may only shoot once per turn, without regard for whether it was a miss or a hit.", 100, 310);
  text("3. You will go first, unless indicated otherwise.", 100, 360);
  text("4. The Abilities section of the screen consists of a number (0-6) green circles. These green circles indicate the number", 100, 410);
  text("of abilities you have left. The abilities' boxes below indicate whether the corresponding ability has not been used yet", 100, 440);
  text("(and therefore available) via a green fill color or if it has already been used via a red fill color. You may only use each", 100, 470);
  text("ability once. You may only use abilities while you still have green circles in the Abilities section. You will not gain additional", 100, 500);
  text("abilities once the game starts, and you will not be allowed to undo any abilities. Once you use it, it's gone. Also, using an", 100, 530);
  text("ability counts as a turn, and play will proceed to the other player after an ability is used.", 100, 560);
  text("5. To make things more challenging, it will NOT be announced whether or not you have completely sunk a ship or what type of ship has", 100, 610);
  text("been hit or sunk. It is advised that you make inferences based upon the shapes and/or lengths of what you've hit so far to make an ", 100, 640);
  text("educated guess as to what's left.", 100, 670);
  fill(0);
  textSize(20);
  text("Back", 60, 35);
}
void setUpS2(){
  background(0);
  fill(#CD7F32); 
  rect(10, 10, 150, 40);
  fill(#F4C430);
  textSize(30);
  text("4. Hospital Ship (5x1)", 100, 110);
  text("5. Destroyer (4x1)", 100, 200);
  text("6. Frigate (3x1)", 100, 290);
  text("7. Submarine (3x1)", 100, 380);
  text("8. Reconnaissance Ship (1x1)", 100, 530);
  text("9. Patrol Boat (1x1)", 100, 620);
  textSize(25);
  text("- This is an orange 5x1 ship.", 120, 140);
  text("- This is a normal dark blue 4x1 ship.", 120, 230);
  text("- This is a normal cyan 3x1 ship.", 120, 320);
  text("- This is a submerged, green 3x1 ship. The special thing about the submarine is that when it is hit, it does NOT show up as \"hit\"", 120, 410);
  text("  but instead, it displays itself as though you had missed it! You can't ever be too sure if that \"miss\" you just had was a real ", 120, 440);
  text("  miss or if a submarine is just lurking below...", 120, 470);
  text("- This is an olive green 1x1 ship.", 120, 560);
  text("- This is a light purple 1x1 ship and is also the most common ship in the fleet.", 120, 650);
  text("Page 2 of 2", 700, 675);
  textSize(20);
  fill(0);
  text("Back", 60, 35);
}
void setUpS1(){
  background(0);
  fill(#CD7F32); 
  rect(10, 10, 150, 40);
  fill(#00FF00);
  rect(1340, 10, 150, 40);
  fill(#F4C430);
  textSize(45);
  text("SHIPS INFORMATION", 530, 60);
  textSize(30);
  text("1. Aircraft Carrier (11x1 + 3)", 100, 340);
  text("2. Cruiser (6x1)", 100, 460);
  text("3. Battleship (9x1)", 100, 580);
  textSize(25);
  text("In the game, the player and the computer are each given a fleet of ships. Each player's ship is randomly positioned within the", 100, 110);
  text("player's grid. Because of the way the computer's AI (targeting algorithm) works and the large number of ships in each fleet,", 100, 140);
  text("it is not necessary (and probably tedious) for the player to place their own ships, hence such a feature is not available.", 100, 170);
  text("Each fleet consists of 46 ships: 1 aircraft carrier, 1 battleship, 1 hospital ship, 4 cruisers, 8 destroyers, 16 patrols, ", 100, 220);
  text("3 reconnaissance ships, and 2 submarines. Each ship either has a different length, a different shape, or different attributes", 100, 250);
  text("that makes it distinct from the other types of ship, as described below.", 100, 280);
  text("- This ship has a shape distinct from all the others; rather than having the traditional width of 1, the aircraft carrier", 120, 370);
  text("  possesses an additional extension off to its side. This ship is also the largest one in the fleet and is bright gold", 120, 400);
  text("- This ship possesses armor that allows each segment of it to withstand an additional hit. You can think of this as the ", 120, 490);
  text("  ship having twice the usual amount of HP of a regular ship of its size would have. This ship is light gray.", 120, 520);
  text("- This ship possesses powerful armor that allows each segment of it to withstand TWO additional hits! This ship is dark gray", 120, 610);
  text("  and is the second largest ship in the fleet.", 120, 640);
  text("Page 1 of 2", 700, 675);
  fill(0);
  textSize(20);
  text("Back", 60, 35);
  text("Next", 1390, 35);
}
void setUpD2(){
  background(0);
  fill(#CD7F32); 
  rect(10, 10, 150, 40);
  fill(#50C878);
  textSize(30);
  text("4. Challenger (Represented by Orange)", 100, 110);
  text("5. Fiendish (Represented by Bright Red)", 100, 290);
  text("6. Apocalyptic (Represented by Dark Red)", 100, 530);
  textSize(25);
  text("- \"Challenge Accepted.\"", 120, 140);
  text("- A difficult opponent to best.", 120, 170);
  text("- The opponent may use each ability only once and can use all 6 abilities.", 120, 200);
  text("- There is a 2.5% chance that the opponent uses abilities on consecutive turns.", 120, 230);
  text("- \"War is hell, the home of the fiends.\"", 120, 320);
  text("- An incredibly intimidating opponent presenting the daunting task of defeating it.", 120, 350);
  text("- The Master of Battleship and the Lord of the Seven Seas.", 120, 380);
  text("- The opponent begins with 6 abilities, but for every 10 times you miss (excluding misses due to abilities),", 120, 410);
  text("the opponent will gain 1 ability, without a cap.", 120, 440);
  text("- With every miss (excluding misses due to abilities), the chance of the opponent using abilities on consecutive turns increases.", 120, 470);
  text("- \"Good luck. Because you're going to need it.\"", 120, 560);
  text("- Literally Death, Horseman of the Apocalypse.", 120, 590);
  text("- Similar to Fiendish difficulty, but with the added threat of the Nuke. (See the Abilities section for more information.)", 120, 620);
  text("- Hopefully you know how to survive nuclear weapons...", 120, 650);
  text("Page 2 of 2", 700, 675);
  fill(0);
  textSize(20);
  text("Back", 60, 35);
}
void setUpD1(){
  background(0);
  fill(#CD7F32); 
  rect(10, 10, 150, 40);
  fill(#00FF00);
  rect(1340, 10, 150, 40);
  fill(#50C878);
  textSize(45);
  text("DIFFICULTY INFORMATION", 500, 60);
  textSize(30);
  text("1. Brain-dead (Represented by Dark Green)", 100, 260);
  text("2. Simple (Represented by Light Green)", 100, 380);
  text("3. Balanced (Represented by Yellow)", 100, 500);
  textSize(25);
  text("There are six different difficulty levels available, each to suit the skill levels of different players. The difficulty levels are divided", 100, 110);
  text("into two branches: Casual and Master. The former consists of the levels Brain-dead, Simple, and Balanced. These difficulty levels ", 100, 140);
  text("are meant for beginners and those looking for casual fun. The latter consists of Challenger, Fiendish, and Apocalyptic. These ", 100, 170);
  text("difficulty levels are designed for those who have mastered the game, those looking for a challenge, and experienced veterans.", 100, 200);
  text("- \"Can I play, Daddy?\"", 120, 290);
  text("- An incredibly foolish opponent that just fires randomly, without regard for anything else. No abilities available to the Computer.", 120, 320);
  text("- \"Take it easy.\"", 120, 410);
  text("- An opponent that employs basic strategy. No abilities available to the Computer.", 120, 440);
  text("- \"Perfectly balanced, as all things should be.\"", 120, 530);
  text("- A relatively capable opponent that incorporates different abilities into its strategy.", 120, 560);
  text("- The opponent may use each ability only once, can use up to any 3 abilities, and cannot use abilities on consecutive turns.", 120, 590);
  text("- This is basically the default setting for the player.", 120, 620);
  text("Page 1 of 2", 700, 675);
  fill(0);
  textSize(20);
  text("Back", 60, 35);
  text("Next", 1390, 35);
}
void setUpA2(){
  background(0);
  fill(#CD7F32); 
  rect(10, 10, 150, 40);
  fill(#FF2052);
  textSize(30);
  text("5. Spontaneous Explosion", 100, 110); 
  text("6. Reconnaissance", 100, 210);
  text("7. Nuke", 100, 375);
  textSize(25);
  text("- destroys all enemy 1x1 ships", 120, 150);
  text("- reveals all enemy surface vessels located within a series of squares in a large diamond-like formation (targets selected at random)", 120, 250);
  text("- using this ability counts as a move, although it initially does nothing", 120, 415);
  text("- if the player misses 3 consecutive times after this ability is used, the nuke goes off, destroying all of the player's ships", 120, 445);
  text("- misses due to abilities do not contribute towards this", 120, 475);
  text("- This is only available to the Computer on Apocalyptic difficulty", 120, 505);
  text("Page 2 of 2", 700, 675);
  textSize(45);
  text("COMPUTER ABILITIES (Available to the Computer Only)", 100, 315);
  fill(0);
  textSize(20);
  text("Back", 60, 35);
}
void setUpA1(){
  background(0);
  fill(#CD7F32); 
  rect(10, 10, 150, 40);
  fill(#00FF00);
  rect(1340, 10, 150, 40);
  fill(#FF2052);
  textSize(45);
  text("ABILITIES", 650, 60);
  text("GENERAL ABILITIES (Available to Player & Computer)", 100, 235);
  textSize(30);
  text("1. Missiles", 100, 285);
  text("2. Carpet Bombing", 100, 385);
  text("3. Laser", 100, 485);
  text("4. Sonar", 100, 585);
  textSize(25);
  text("The Battleship grid of this game is 26x26, meaning there are 676 squares. Typically, a majority of the squares have to be hit", 100, 110);
  text("in order for the game to end. That's quite a lot of squares you'd have to press. As a result, Abilities are part of the game!", 100, 140);
  text("Abilities are used to help the player defeat the computer opponent in a more timely and more fun manner.", 100, 170);
  text("- shoots at 75 squares that have not been hit yet (targets selected at random)", 120, 315);
  text("- utterly annihilates a series of squares in a diamond-like formation (targets selected at random)", 120, 415);
  text("- utterly annihilates a square, its row, its column, and additional squares in a diagonal pattern (targets selected at random)", 120, 515);
  text("- reveals the location of enemy submarines", 120, 615);
  text("Page 1 of 2", 700, 675);
  fill(0);
  textSize(20);
  text("Back", 60, 35);
  text("Next", 1390, 35);
}
void setUpHelp(){
  background(#CD7F32); //bronze
  fill(#A52A2A); //brown
  rect(10, 10, 150, 40);
  fill(#FF2052); //Awesome
  rect(240, 200, 1050, 60);
  fill(#F4C430); //saffron
  rect(240, 280, 1050, 60);
  fill(#4997D0); //celestial blue
  rect(240, 360, 1050, 60);
  fill(#50C878); //emerald green
  rect(240, 440, 1050, 60);
  textSize(20);
  fill(0);
  text("Back", 60, 35);
  textSize(30);
  text("Abilities", 660, 240);
  text("Ships", 669, 320);
  text("Rules", 669, 400);
  text("Difficulty Information", 589, 480);
  text("------------------------------------SELECT WHAT YOU NEED HELP WITH------------------------------------", 187, 110);
  textSize(45);
  text("HELP", 660, 60);
}
void setUpVictory(){
  println("You won! Congratulations!");
  fill(#00FF00);
  textSize(125);
  text("VICTORY", 499, 140);
  rect(240, 400, 1050, 80);
  textSize(35);
  text("Congratulations!", 600, 250);
  fill(0);
  text("Return Home", 655, 455);
  Dd = 0;
}
void setUpDefeat(){
  println("You lost. Better luck next time!");
  fill(#FF0000);
  textSize(125);
  text("DEFEAT", 525, 140);
  rect(240, 400, 1050, 80);  
  textSize(35);
  text("Better luck next time!" , 580, 250);
  fill(0);
  text("Return Home", 655, 455);
  Dd = 0;
}
void setUpFinishedGame(){
  background(0);
  if (veryEasy){recorded_difficulty = VeryEasy;}
  if (easy){recorded_difficulty = Easy;}
  if (normal){recorded_difficulty = Normal;}
  if (hard){recorded_difficulty = Hard;}
  if (veryHard){recorded_difficulty = VeryHard;}
  possible_targets.clear(); computer_targets.clear(); possible_computer_targets.clear(); 
  targeting = false; target_basis = null; in_play = false; usedsonar = false;
  fmissiles = false; fbomb = false; flaser = false; fsonar = false; fspontaneousexplosion = false; freconnaissance = false;
  emissiles = false; ebomb = false; elaser = false; esonar = false; espontaneousexplosion = false; ereconnaissance = false;
  veryEasy = false; easy = false; normal = false; hard = false; veryHard = false; veryveryHard = false; DEATH = 0; ALLDEATH = 0;
}
void setUpSettings(){
  background(#CD7F32);
  fill(#FF00FF); //magenta
  rect(580, 620, 340, 60);
  fill(0);
  textSize(45);
  text("SETTINGS", 600, 60);
  textSize(30);
  text("SELECT NUMBER OF ABILITIES------------------------------------------------------DEFAULT: 3", 147, 90);
  text("SAVE", 720, 660);
  cero.display(); uno.display(); dos.display(); tres.display(); cuatro.display(); cinco.display(); seis.display();
  ABILITIES = SET_ABILITIES;
  textSize(20); fill(0);
  text("0", 445, 225); text("1", 545, 225); text("2", 645, 225); text("3", 745, 225); text("4", 845, 225); text("5", 945, 225); text("6", 1045, 225);
}
void setUpMenu(){
  background(BC);
  fill(#22C655); 
  rect(240, 100, 1050, 60);
  fill(#00FF00); 
  rect(240, 180, 1050, 60);
  fill(#FFFF00);
  rect(240, 260, 1050, 60);
  fill(#FFA500); //orange
  rect(240, 380, 1050, 60);
  fill(#FF0000);
  rect(240, 460, 1050, 60);
  fill(#660000); //blood red
  rect(240, 540, 1050, 60);
  fill(#A52A2A); //brown
  rect(10, 10, 150, 40);
  fill(0);
  textSize(20);
  text("Back", 60, 35);
  textSize(45);
  text("SELECT DIFFICULTY", 530, 60);
  textSize(30);
  text("--------------------------------------------------------------CASUAL--------------------------------------------------------------", 87, 90);
  text("Brain-dead", 650, 140);
  text("Simple", 675, 220);
  text("Balanced", 659, 300);
  text("--------------------------------------------------------------MASTER--------------------------------------------------------------", 87, 370);
  text("Challenger", 653, 420);
  text("Fiendish", 666, 500);
  fill(#FF0000);
  text("Apocalyptic", 653, 580);
}
void setUpHome(){
  veryEasy = false; easy = false; normal = false; hard = false; veryHard = false; veryveryHard = false;
  victory = false; defeat = false;
  background(0);
  fill(CYAN);
  textSize(125);
  text("BATTLESHIP", 449, 140);
  textSize(75);
  text("Special Edition", 549, 220);
  fill(#800080); //violet
  textSize(45);
  text("Made by and Developed by Nelson So", 439, 280);
  fill(#00FF00);
  rect(240, 400, 1050, 80);
  fill(0);
  text("PLAY", 725, 455);
  fill(#FF7F00); //orange
  rect(240, 500, 518, 60);
  fill(#C0C0C0); //silver
  rect(773, 500, 518, 60);
  fill(0);
  textSize(30);
  text("Help", 460, 540);
  text("Settings", 960, 540);
}
void setUpPlay(){
  ABILITIES = SET_ABILITIES;
  if (ABILITIES >= 1){circleLight1 = new Ability(circleLight1x, circleLightyA); }
  if (ABILITIES >= 2){circleLight2 = new Ability(circleLight2x, circleLightyA); }
  if (ABILITIES >= 3){circleLight3 = new Ability(circleLight3x, circleLightyA); }
  if (ABILITIES >= 4){circleLight4 = new Ability(circleLight1x, circleLightyB); }
  if (ABILITIES >= 5){circleLight5 = new Ability(circleLight2x, circleLightyB); }
  if (ABILITIES >= 6){circleLight6 = new Ability(circleLight3x, circleLightyB); }
  background(BC); victory = false; defeat = false; played = true;
  fmissiles = true; fbomb = true; flaser = true; fsonar = true; fspontaneousexplosion = true; freconnaissance = true;
  emissiles = true; ebomb = true; elaser = true; esonar = true; espontaneousexplosion = true; ereconnaissance = true;
  usedsonar = false; DEATH = 0; ALLDEATH = 0;
  EHP = 181; //HP of all enemy ships combined in enemy grid
  FHP = 181; //HP of all friendly ships combined in friendly grid
  if (circleLight1 != null){circleLight1.abilitylights(); }
  if (circleLight2 != null){circleLight2.abilitylights(); }
  if (circleLight3 != null){circleLight3.abilitylights(); }
  if (circleLight4 != null){circleLight4.abilitylights(); }
  if (circleLight5 != null){circleLight5.abilitylights(); }
  if (circleLight6 != null){circleLight6.abilitylights(); }
  Egrid = new Grid();
  Fgrid = new Grid();
  Egrid.drawGridEnemy();
  Fgrid.drawGridFriendly();
  Egrid.link(Egrid);
  Fgrid.link(Fgrid);
  Egrid.Eplace();
  Fgrid.Fplace();
  Fmissiles.turnOn(); Fbomb.turnOn(); Flaser.turnOn(); Fsonar.turnOn(); Fspontaneousexplosion.turnOn(); Freconnaissance.turnOn();
  Fmissiles.display(); Fbomb.display(); Flaser.display(); Fsonar.display(); Fspontaneousexplosion.display(); Freconnaissance.display();
  textSize(18);
  fill(0);
  text("Missiles", 1280, 250); text("Carpet  Bombing", 1260, 320); text("Laser", 1288, 390); text("Sonar", 1288, 460); text("Spontaneous Explosion", 1233, 530); text("Reconnaissance", 1258, 600);
  //text("Please view the console to see actions.", 30, 55); //"Enemy Action"
  //text("Your Action:", 620, 55);
  textSize(50);
  text("BATTLESHIP", 50, 60);
  if (veryEasy){text("Difficulty: Brain-dead", 400, 60);}
  if (easy){text("Difficulty: Simple", 400, 60);}
  if (normal){text("Difficulty: Balanced", 400, 60);}
  if (hard){text("Difficulty: Challenger", 400, 60);}
  if (veryHard){text("Difficulty: Fiendish", 400, 60);}
  if (veryveryHard){text("Difficulty: Apocalyptic", 400, 60);}
  textSize(18);
  text("Use your mouse and the console to play.", 1100, 45);
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
