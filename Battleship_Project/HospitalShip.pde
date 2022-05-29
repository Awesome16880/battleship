class HospitalShip extends Ship{
  HospitalShip(int xx, int yy, boolean F){
    super(xx, yy, HOSPITAL_SHIP, F);
  }
  void EplaceHospitalShip(){
    this.type = HOSPITAL_SHIP;
    this.Friendly = false;
    this.headx = Erollx();
    this.heady = EFrolly();
    this.Length = 5;
    this.HP = 5;
    boolean z = super.EDo();
    //while (z){
    //  boolean zz = super.EDo();
    //  if (zz == false){
    //    z = false;
    //    break;
    //  }
    //}
  }
  void FplaceHospitalShip(){
    this.type = HOSPITAL_SHIP;
    this.Friendly = true;
    this.headx = Frollx();
    this.heady = EFrolly();
    this.Length = 5;
    boolean z = super.FDo();
  }
  int Erollx(){
    int A = int(random(5, 21)); int B = A * 21; int C = B + 5; return C;
  }
  int Frollx(){
    int A = int(random(5, 21)); int B = A * 21; int C = B + 601; return C;
  }
  int EFrolly(){
    int A = int(random(5, 21)); int B = A * 21; int C = B + 150; return C;
  }
}
