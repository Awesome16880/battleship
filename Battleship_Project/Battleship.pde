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
    super.EDo();
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
