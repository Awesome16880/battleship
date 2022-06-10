class Submarine extends Ship{
  Submarine(int xx, int yy, boolean F){
    super(xx, yy, SUBMARINE, F);
  }
  void EplaceSubmarine(){
    this.type = SUBMARINE;
    this.Friendly = false;
    this.headx = Erollx();
    this.heady = EFrolly();
    this.Length = 3;
    this.HP = 3;
    boolean z = super.EDo();
  }
  void FplaceSubmarine(){
    this.type = SUBMARINE;
    this.Friendly = true;
    this.headx = Frollx();
    this.heady = EFrolly();
    this.Length = 3;
    boolean z = super.FDo();
  }
  int Erollx(){
    int A = int(random(3, 23)); int B = A * 21; int C = B + 5; return C;
  }
  int Frollx(){
    int A = int(random(3, 23)); int B = A * 21; int C = B + 601; return C;
  }
  int EFrolly(){
    int A = int(random(3, 23)); int B = A * 21; int C = B + 150; return C;
  }
}
