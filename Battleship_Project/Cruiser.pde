class Cruiser extends Ship{
  Cruiser(int xx, int yy, boolean F){
    super(xx, yy, CRUISER, F);
  }
  void EplaceCruiser(){
    this.type = CRUISER;
    this.Friendly = false;
    this.headx = Erollx();
    this.heady = EFrolly();
    this.Length = 6;
    this.HP = 12; // 6 boxes, 2 HP each
    boolean z = super.EDo();
  }
  void FplaceCruiser(){
    this.type = CRUISER;
    this.Friendly = true;
    this.headx = Frollx();
    this.heady = EFrolly();
    this.Length = 6;
    this.HP = 2;
    boolean z = super.FDo();
  }
  int Erollx(){
    int A = int(random(6, 20)); int B = A * 21; int C = B + 5; return C;
  }
  int Frollx(){
    int A = int(random(6, 20)); int B = A * 21; int C = B + 601; return C;
  }
  int EFrolly(){
    int A = int(random(6, 20)); int B = A * 21; int C = B + 150; return C;
  }
}
