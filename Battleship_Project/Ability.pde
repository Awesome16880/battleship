class Ability{ 
  ArrayList<Box> targets = new ArrayList<Box>();
  int type;
  boolean Friendly;
  boolean OnOff;
  int x;
  int y;
  int radius;
  int Width;
  int Length;
  
  Ability(int xx, int yy){
    OnOff = true; //on
    type = 950;
    x = xx;
    y = yy;
    radius = 50;
  }

  Ability(int T, boolean F, int xx, int yy, int w, int l){
    OnOff = true;
    type = T;
    Friendly = F;
    x = xx;
    y = yy;
    Width = w;
    Length = l;
  }
  
  void use(){
    boolean f = this.Friendly;
    if (this.type == missiles){
      useMissiles(f);
    }
    else if (this.type == bomb){
      useBomb(f);
    }
  } 
  void useBomb(boolean f){
    Box B = null; boolean q = false; int A = 0; ArrayList<Box> temp = new ArrayList<Box>();
    if (!f && ebomb){
      
    }
    else if (f && fbomb){
      int x = int(random(89, 467)); int y = int(random(234, 612)); int xx = x - 5; int yy = y - 150; int C = xx / 21; int R = yy / 21; int I = 0;
      B = Egrid.playaccess(Egrid, R, C);
      if ((B != null && R >= 4 && R <= 22 && C >= 4 && C <= 22) && I < 1000){
        temp.add(B); temp.add(B.north); temp.add(B.east); temp.add(B.south); temp.add(B.west); q = true;
        for (int i = temp.size() - 1; i >= 0; i--){
          temp.add(temp.get(i).north); temp.add(temp.get(i).east); temp.add(temp.get(i).south); temp.add(temp.get(i).west);
        }
        A = temp.size() - 1;
        for (int j = temp.size() - 1; j >= 5; j--){
          temp.add(temp.get(j).north); temp.add(temp.get(j).east); temp.add(temp.get(j).south); temp.add(temp.get(j).west);
        }
        for (int k = temp.size() - 1; k >= A; k--){
          temp.add(temp.get(k).north); temp.add(temp.get(k).east); temp.add(temp.get(k).south); temp.add(temp.get(k).west);
        }
        for (int l = temp.size() - 1; l >= A; l--){
          temp.add(temp.get(l).north); temp.add(temp.get(l).east); temp.add(temp.get(l).south); temp.add(temp.get(l).west);
        }
        for (int m = 0; m < temp.size(); m++){
          Box tempBB = temp.get(m);
          if (!tempBB.repeat(targets)){
            targets.add(tempBB);
          }
        }
      }
    }
    else{}
    if (fbomb && q){
      for (int ii = 0; ii < targets.size(); ii++){
        for (int iii = 0; iii < possible_targets.size(); iii++){
          if (targets.get(ii).same(possible_targets.get(iii)) == true){
            possible_targets.remove(iii);
            iii--;
          }
        }
        targets.get(ii).autoSink(f);
        targets.get(ii).shotAt = true;
      }
    }
    targets.clear();
    if (f){
      fbomb = false;
    }
    if (!f){
      ebomb = false;
    }
  }
  void useMissiles(boolean f){
    Box B = null;
    if (!f && emissiles){
      for (int i = 0; i < 75; i++){
        int ABCDEFGHIJKLMNOPQRSTUVWXYZ = int(random(0, possible_computer_targets.size()));
        B = possible_computer_targets.get(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
        possible_computer_targets.remove(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
        targets.add(B);
      }
    }
    else if (f && fmissiles){
      for (int i = 0; i < 75; i++){
        int ABCDEFGHIJKLMNOPQRSTUVWXYZ = int(random(0, possible_targets.size()));
        B = possible_targets.get(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
        if (B.shotAt == false){
          possible_targets.remove(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
          targets.add(B);
        }
        else{
          i--;
        }
      }
    }
    else{}
    if (fmissiles){
      for (int ii = 0; ii < 75; ii++){
        targets.get(ii).hit(f);
        if (targets.get(ii).state == BLACK || targets.get(ii).state == HIT){
          targets.get(ii).shotAt = true;
        }
      }
    }
    targets.clear();
    if (f){
      fmissiles = false;
    }
    if (!f){
      emissiles = false;
    }
  }
  void abilitylights(){
    if (this.OnOff == true){ //on
      fill(#00FF00);
      circle(this.x, this.y, this.radius);
    }
    else{ //off
      fill(#FF0000);
      circle(this.x, this.y, this.radius);
    }
  }
  void turnOffLight(){
    if (circleLight1.OnOff == true){
      circleLight1.off();
    }
    else if (circleLight2.OnOff == true){
      circleLight2.off();
    }
    else if (circleLight3.OnOff == true){
      circleLight3.off();
    }
    display();
  }
  void display(){
    if (this.OnOff == true){ //on
      fill(#00FF00);
      rect(this.x, this.y, this.Width, this.Length);
    }
    else{
      fill(#FF0000);
      rect(this.x, this.y, this.Width, this.Length);
    }
  }
  void off(){
    this.OnOff = false;
    abilitylights();
  }
}
