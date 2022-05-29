class Battleship extends Ship{
  Battleship(int xx, int yy, boolean F){
    super(xx, yy, BATTLESHIP, F);
  }
  void EplaceBattleship(){
    this.type = BATTLESHIP;
    this.Friendly = false;
    this.headx = Erollx();
    this.heady = EFrolly();
    this.Length = 9;
    this.HP = 27; //9 boxes, 3 HP each
    boolean z = super.EDo();
    //while (z){
    //  boolean zz = super.EDo();
    //  if (zz == false){
    //    z = false;
    //    break;
    //  }
    //}
  }
  void FplaceBattleship(){
    this.type = BATTLESHIP;
    this.Friendly = true;
    this.headx = Frollx();
    this.heady = EFrolly();
    this.Length = 9;
    this.HP = 3;
    boolean z = super.FDo();
  }
  int Erollx(){
    int A = int(random(9, 17)); int B = A * 21; int C = B + 5; return C;
  }
  int Frollx(){
    int A = int(random(9, 17)); int B = A * 21; int C = B + 601; return C;
  }
  int EFrolly(){
    int A = int(random(9, 17)); int B = A * 21; int C = B + 150; return C;
  }
}
