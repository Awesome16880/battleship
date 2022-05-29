class AircraftCarrier extends Ship{
  AircraftCarrier(int xx, int yy, boolean F){
    super(xx, yy, AIRCRAFT_CARRIER, F);
  }
  void EplaceAircraftCarrier(){
    this.type = AIRCRAFT_CARRIER;
    this.Friendly = false;
    this.headx = Erollx();
    this.heady = EFrolly();
    this.Length = 11;
    this.HP = 14; //11 boxes, plus the 3 box extension
    boolean z = super.EDo();
    //while (z){
    //  boolean zz = super.EDo();
    //  if (zz == false){
    //    z = false;
    //    break;
    //  }
    //}
  }
  void FplaceAircraftCarrier(){
    this.type = AIRCRAFT_CARRIER;
    this.Friendly = true;
    this.headx = Frollx();
    this.heady = EFrolly();
    this.Length = 11;
    boolean z = super.FDo();
  }
  int Erollx(){
    int A = int(random(11, 15)); int B = A * 21; int C = B + 5; return C;
  }
  int Frollx(){
    int A = int(random(11, 15)); int B = A * 21; int C = B + 601; return C;
  }
  int EFrolly(){
    int A = int(random(11, 15)); int B = A * 21; int C = B + 150; return C;
  }
}
