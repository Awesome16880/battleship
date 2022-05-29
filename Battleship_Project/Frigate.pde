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
    this.HP = 3;
    boolean z = super.EDo();
    //while (z){
    //  boolean zz = super.EDo();
    //  if (zz == false){
    //    z = false;
    //    break;
    //  }
    //}
  }
  void FplaceFrigate(){
    this.type = FRIGATE;
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
