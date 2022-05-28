class Submarine extends Ship{
  //if friendly display, else hide
  Submarine(int xx, int yy, boolean F){
    super(xx, yy, SUBMARINE, F);
  }
  void EplaceSubmarine(){
    this.type = SUBMARINE;
    this.Friendly = false;
    this.headx = Erollx();
    this.heady = EFrolly();
    this.Length = 3;
    boolean z = super.EDo();
    //while (z){
    //  boolean zz = super.EDo();
    //  if (zz == false){
    //    z = false;
    //    break;
    //  }
    //}
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
