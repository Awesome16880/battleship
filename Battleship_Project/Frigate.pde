class Frigate extends Ship{
  Frigate(int xx, int yy, boolean F){
    super(xx, yy, FRIGATE, F);
  }
  void EplaceFrigate(){
    this.type = FRIGATE;
    this.Friendly = false;
    this.headx = Erollx();
    this.heady = EFrolly();
    this.Length = 3;
    super.EDo();
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
