class PatrolBoat extends Ship{
  PatrolBoat(int xx, int yy, boolean F){
    super(xx, yy, PATROL_BOAT, F);
  }
  void EplacePatrolBoat(){
    this.type = PATROL_BOAT;
    this.Friendly = false;
    this.headx = Erollx();
    this.heady = EFrolly();
    this.Length = 1;
    this.HP = 1;
    boolean z = super.EDo();
  }
  void FplacePatrolBoat(){
    this.type = PATROL_BOAT;
    this.Friendly = true;
    this.headx = Frollx();
    this.heady = EFrolly();
    this.Length = 1;
    boolean z = super.FDo();
  }
  int Erollx(){
    int A = int(random(0, 26)); int B = A * 21; int C = B + 5; return C;
  }
  int Frollx(){
    int A = int(random(0, 26)); int B = A * 21; int C = B + 601; return C;
  }
  int EFrolly(){
    int A = int(random(0, 26)); int B = A * 21; int C = B + 150; return C;
  }
}
