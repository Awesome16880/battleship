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
    type = 9500;
    x = xx;
    y = yy;
    radius = 50;
  }
  Ability(int T, boolean F){
    OnOff = true;
    type = T;
    Friendly = F;
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
    hitstreak = 0;
    if (this.type == missiles){
      useMissiles(f);
    }
    else if (this.type == bomb){
      useBomb(f);
    }
    else if (this.type == laser){
      useLaser(f);
    }
    else if (this.type == sonar){
      useSonar(f);
    }
    else if (this.type == spontaneousexplosion){
      useSpontaneousExplosion(f);
    }
    else if (this.type == reconnaissance){
      useReconnaissance(f);
    }
    just_used_ability = true;
  } 
  void useReconnaissance(boolean f){
    Box B = null; ArrayList<Box> temp = new ArrayList<Box>(); int A = 0;
    if (!f && ereconnaissance){
      int x = int(random(769, 979)); int y = int(random(318, 528)); int xx = x - 601; int yy = y - 150; int C = xx / 21; int R = yy / 21;
      B = Fgrid.playaccess(Fgrid, R, C);
      if ((B != null && R >= 7 && R <= 18 && C >= 7 && C <= 18)){
        temp.add(B); temp.add(B.north); temp.add(B.east); temp.add(B.south); temp.add(B.west); 
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
        for (int m = temp.size() - 1; m >= A; m--){
          temp.add(temp.get(m).north); temp.add(temp.get(m).east); temp.add(temp.get(m).south); temp.add(temp.get(m).west);
        }
        for (int n = temp.size() - 1; n >= A; n--){
          temp.add(temp.get(n).north); temp.add(temp.get(n).east); temp.add(temp.get(n).south); temp.add(temp.get(n).west);
        }
        for (int o = 0; o < temp.size(); o++){
          Box tempBB = temp.get(o);
          if (!tempBB.repeat(targets)){
            targets.add(tempBB);
          }
        }
      }
    }
    if (f && freconnaissance){
      int x = int(random(173, 383)); int y = int(random(318, 528)); int xx = x - 5; int yy = y - 150; int C = xx / 21; int R = yy / 21;
      B = Egrid.playaccess(Egrid, R, C);
      if ((B != null && R >= 7 && R <= 18 && C >= 7 && C <= 18)){
        temp.add(B); temp.add(B.north); temp.add(B.east); temp.add(B.south); temp.add(B.west); 
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
        for (int m = temp.size() - 1; m >= A; m--){
          temp.add(temp.get(m).north); temp.add(temp.get(m).east); temp.add(temp.get(m).south); temp.add(temp.get(m).west);
        }
        for (int n = temp.size() - 1; n >= A; n--){
          temp.add(temp.get(n).north); temp.add(temp.get(n).east); temp.add(temp.get(n).south); temp.add(temp.get(n).west);
        }
        for (int o = 0; o < temp.size(); o++){
          Box tempBB = temp.get(o);
          if (!tempBB.repeat(targets)){
            targets.add(tempBB);
          }
        }
      }
    if (!f && ereconnaissance){
      for (int ii = 0; ii < targets.size(); ii++){
        for (int iii = 0; iii < possible_computer_targets.size(); iii++){
          if (targets.get(ii).same(possible_computer_targets.get(iii)) == true){
            possible_computer_targets.remove(iii);
            iii--;
          }
        }
        if (targets.get(ii).shipState == AIRCRAFT_CARRIER || targets.get(ii).shipState == BATTLESHIP || targets.get(ii).shipState == CRUISER || targets.get(ii).shipState == DESTROYER ||
        targets.get(ii).shipState == FRIGATE || targets.get(ii).shipState == HOSPITAL_SHIP || targets.get(ii).shipState == PATROL_BOAT || targets.get(ii).shipState == RECONNAISSANCE_SHIP ||
        targets.get(ii).shipState == SHIP){
          computer_targets.add(targets.get(ii));
        }
      }
    }
    if (f && freconnaissance){
      for (int i = 0; i < targets.size(); i++){
        targets.get(i).display_reconnaissance();
      }
    }
    targets.clear();
    if (f){
      freconnaissance = false;
    }
    if (!f){
      ereconnaissance = false;
      println("The enemy used their Reconnaissance ability!");
    }
  }
  }
  void useSpontaneousExplosion(boolean f){
    if (!f && espontaneousexplosion){
      for (int r = 0; r < 26; r++){
        for (int c = 0; c < 26; c++){
          if (Fgrid.grid[r][c].shipState == RECONNAISSANCE_SHIP){
            targets.add(Fgrid.grid[r][c]);
          }
          if (Fgrid.grid[r][c].shipState == PATROL_BOAT){
            targets.add(Fgrid.grid[r][c]);
          }
        }
      }
    }
    if (f && fspontaneousexplosion){
      for (int r = 0; r < 26; r++){
        for (int c = 0; c < 26; c++){
          if (Egrid.grid[r][c].shipState == RECONNAISSANCE_SHIP){
            targets.add(Egrid.grid[r][c]);
          }
          if (Egrid.grid[r][c].shipState == PATROL_BOAT){
            targets.add(Egrid.grid[r][c]);
          }
        }
      }
    }
    for (int P = 0; P < targets.size(); P++){
      targets.get(P).hit(f, true);
    }
    targets.clear(); 
    if (f){
      fspontaneousexplosion = false;
    }
    if (!f){
      espontaneousexplosion = false;
      println("The enemy used their Spontaneous Explosion ability!");
    }
  }
  void useSonar(boolean f){
    if (!f && esonar){
      for (int r = 0; r < 26; r++){
        for (int c = 0; c < 26; c++){
          if (Fgrid.grid[r][c].shipState == SUBMARINE){
            targets.add(Fgrid.grid[r][c]);
          }
        }
      }
      for (int P = 0; P < targets.size(); P++){
        computer_targets.add(targets.get(P));
      }
    }
    if (f && fsonar){
      for (int r = 0; r < 26; r++){
        for (int c = 0; c < 26; c++){
          if (Egrid.grid[r][c].shipState == SUBMARINE){
            targets.add(Egrid.grid[r][c]);
          }
        }
      }
      for (int P = 0; P < targets.size(); P++){
        targets.get(P).display_friendly();
      }
    }
    targets.clear();
    if (f){
      fsonar = false;
    }
    if (!f){
      esonar = false;
      println("The enemy used their Sonar ability!");
    }
  }
  void useLaser(boolean f){
    Box B = null; Box b = null; ArrayList<Box> temp = new ArrayList<Box>();
    Box b1 = null; Box b2 = null; Box b3 = null; Box b4 = null; Box b5 = null; Box b6 = null; Box b7 = null; Box b8 = null; Box b9 = null; Box b10 = null; Box b11 = null; Box b12 = null;
    if (!f && elaser){
      int R = int(random(3, 23)); int C = int(random(3, 23));
      B = Fgrid.playaccess(Fgrid, R, C);
      b1 = Fgrid.playaccess(Fgrid, R - 1, C - 1); b2 = Fgrid.playaccess(Fgrid, R - 2, C - 2); b3 = Fgrid.playaccess(Fgrid, R - 1, C + 1); b4 = Fgrid.playaccess(Fgrid, R - 2, C + 2);
      b5 = Fgrid.playaccess(Fgrid, R + 1, C - 1); b6 = Fgrid.playaccess(Fgrid, R + 2, C - 2); b7 = Fgrid.playaccess(Fgrid, R + 1, C + 1); b8 = Fgrid.playaccess(Fgrid, R + 2, C + 2);
      b9 = Fgrid.playaccess(Fgrid, R - 3, C - 3); b10 = Fgrid.playaccess(Fgrid, R - 3, C + 3); b11 = Fgrid.playaccess(Fgrid, R + 3, C - 3); b12 = Fgrid.playaccess(Fgrid, R + 3, C + 3);
      if (B != null && b1 != null && b2 != null && b3 != null && b4 != null && b5 != null && b6 != null && b7 != null && b8 != null && b9 != null && b10 != null && b11 != null && b12 != null){
        temp.add(B); temp.add(b1); temp.add(b2); temp.add(b3); temp.add(b4); temp.add(b5); temp.add(b6); temp.add(b7); temp.add(b8); temp.add(b9); temp.add(b10); temp.add(b11); temp.add(b12);
        for (int i = 0; i < 26; i++){
          b = Fgrid.playaccess(Fgrid, i, C); temp.add(b);
          b = Fgrid.playaccess(Fgrid, R, i); temp.add(b);
        }
      }
    }
    else if (f && flaser){
      int R = int(random(3, 23)); int C = int(random(3, 23));
      B = Egrid.playaccess(Egrid, R, C);
      b1 = Egrid.playaccess(Egrid, R - 1, C - 1); b2 = Egrid.playaccess(Egrid, R - 2, C - 2); b3 = Egrid.playaccess(Egrid, R - 1, C + 1); b4 = Egrid.playaccess(Egrid, R - 2, C + 2);
      b5 = Egrid.playaccess(Egrid, R + 1, C - 1); b6 = Egrid.playaccess(Egrid, R + 2, C - 2); b7 = Egrid.playaccess(Egrid, R + 1, C + 1); b8 = Egrid.playaccess(Egrid, R + 2, C + 2);
      b9 = Egrid.playaccess(Egrid, R - 3, C - 3); b10 = Egrid.playaccess(Egrid, R - 3, C + 3); b11 = Egrid.playaccess(Egrid, R + 3, C - 3); b12 = Egrid.playaccess(Egrid, R + 3, C + 3);
      if (B != null && b1 != null && b2 != null && b3 != null && b4 != null && b5 != null && b6 != null && b7 != null && b8 != null && b9 != null && b10 != null && b11 != null && b12 != null){
        temp.add(B); temp.add(b1); temp.add(b2); temp.add(b3); temp.add(b4); temp.add(b5); temp.add(b6); temp.add(b7); temp.add(b8); temp.add(b9); temp.add(b10); temp.add(b11); temp.add(b12);
        for (int i = 0; i < 26; i++){
          b = Egrid.playaccess(Egrid, i, C); temp.add(b);
          b = Egrid.playaccess(Egrid, R, i); temp.add(b);
        }
      }
    }
    else{}
    for (int i = 0; i < temp.size(); i++){
      targets.add(temp.get(i));
    }
    if (f && flaser){
      for (int I = 0; I < targets.size(); I++){
        for (int II = 0; II < possible_targets.size(); II++){
          if (targets.get(I).same(possible_targets.get(II)) == true){
            possible_targets.remove(II);
            II--;
          }
        }
        targets.get(I).autoSink(f);
        targets.get(I).shotAt = true;
      }
    }
    if (!f && elaser){
      for (int I = 0; I < targets.size(); I++){
        for (int II = 0; II < possible_computer_targets.size(); II++){
          if (targets.get(I).same(possible_computer_targets.get(II)) == true){
            possible_computer_targets.remove(II);
            II--;
          }
        }
        targets.get(I).autoSink(f);
        targets.get(I).shotAt = true;
        if (targets.get(I).state != BLACK){
          if (targets.get(I).north.shotAt == false){
            computer_targets.add(targets.get(I).north);
          }
          if (targets.get(I).east.shotAt == false){
            computer_targets.add(targets.get(I).east);
          }
          if (targets.get(I).south.shotAt == false){
            computer_targets.add(targets.get(I).south);
          }
          if (targets.get(I).west.shotAt == false){
            computer_targets.add(targets.get(I).west);
          }
        }
      }
    }
    targets.clear();
    if (f){
      flaser = false;
    }
    if (!f){
      elaser = false;
      println("The enemy used their Laser ability!");
    }
  }
  void useBomb(boolean f){
    Box B = null; boolean q = false; int A = 0; ArrayList<Box> temp = new ArrayList<Box>();
    if (!f && ebomb){
      int x = int(random(727, 1021)); int y = int(random(276, 570)); int xx = x - 601; int yy = y - 150; int C = xx / 21; int R = yy / 21; int I = 0;
      B = Fgrid.playaccess(Fgrid, R, C);
      if ((B != null && R >= 6 && R <= 20 && C >= 6 && C <= 20) && I < 1000){
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
    else if (f && fbomb){
      int x = int(random(131, 425)); int y = int(random(276, 570)); int xx = x - 5; int yy = y - 150; int C = xx / 21; int R = yy / 21; int I = 0;
      B = Egrid.playaccess(Egrid, R, C);
      if ((B != null && R >= 6 && R <= 20 && C >= 6 && C <= 20) && I < 1000){
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
    if (fbomb && q && f){
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
    if (ebomb && q && !f){
      for (int QR = 0; QR < targets.size(); QR++){
        for (int u = 0; u < possible_computer_targets.size(); u++){
          if (targets.get(QR).same(possible_computer_targets.get(u)) == true){
            possible_computer_targets.remove(u);
            u--;
          }
        }
        targets.get(QR).autoSink(f);
        targets.get(QR).shotAt = true;
        if (targets.get(QR).state != BLACK){
          if (targets.get(QR).north.shotAt == false){
            computer_targets.add(targets.get(QR).north);
          }
          if (targets.get(QR).east.shotAt == false){
            computer_targets.add(targets.get(QR).east);
          }
          if (targets.get(QR).south.shotAt == false){
            computer_targets.add(targets.get(QR).south);
          }
          if (targets.get(QR).west.shotAt == false){
            computer_targets.add(targets.get(QR).west);
          }
        }
      }
    }
    targets.clear();
    if (f){
      fbomb = false;
    }
    if (!f){
      ebomb = false;
      println("The enemy used their Carpet Bombing ability!");
    }
  }
  void useMissiles(boolean f){
    Box B = null; 
    if (!f && emissiles){
      for (int i = 0; i < 75; i++){
        int ABCDEFGHIJKLMNOPQRSTUVWXYZ = int(random(0, possible_computer_targets.size()));
        B = possible_computer_targets.get(ABCDEFGHIJKLMNOPQRSTUVWXYZ);
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
    if (f && fmissiles){
      for (int ii = 0; ii < 75; ii++){
        targets.get(ii).hit(f, true);
        if (targets.get(ii).state == BLACK || targets.get(ii).state == HIT){
          targets.get(ii).shotAt = true;
        }
      }
    }
    if (!f && emissiles){
      for (int ii = 0; ii < 75; ii++){
        targets.get(ii).hit(f, true);
        if (targets.get(ii).state == BLACK || targets.get(ii).state == HIT){
          targets.get(ii).shotAt = true;
          int index = targets.get(ii).repeat(possible_computer_targets, 0);
          if (index >= 0){
            possible_computer_targets.remove(index);
          }
        }
      }
    }
    targets.clear();
    if (f && fmissiles){
      fmissiles = false;
    }
    if (!f && emissiles){
      emissiles = false;
      println("The enemy used their Missiles ability!");
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
  void turnOffLight(int a){
    if (circleLight1.OnOff == true && a >= 1){
      circleLight1.off();
    }
    else if (circleLight2.OnOff == true && a >= 2){
      circleLight2.off();
    }
    else if (circleLight3.OnOff == true && a >= 3){
      circleLight3.off();
    }
    else if (circleLight4.OnOff == true && a >= 4){
      circleLight4.off();
    }
    else if (circleLight5.OnOff == true && a >= 5){
      circleLight5.off();
    }
    else if (circleLight6.OnOff == true && a >= 6){
      circleLight6.off();
    }
    display();
  }
  void turnOn(){
    this.OnOff = true;
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
