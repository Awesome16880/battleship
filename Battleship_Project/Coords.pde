class Coords{
  int x;
  int y;
  int r; 
  int c;
  Grid grid;
  Box box;
  int type;
  boolean occupied;
  
  Coords(int xx, int yy, Grid gridd){
    x = xx;
    y = yy;
    occupied = false;
    grid = gridd;
    if (this.grid == Egrid){
      c = (x - 5) / 21;
      r = (y - 150) / 21;
    }
    if (this.grid == Fgrid){
    }
  }
  Coords (int xx, int yy, Grid gridd, boolean occupiedd){
    this(xx, yy, gridd);
    occupied = occupiedd;
  }

  
  Box link(Grid GG, Coords coords){
    for (int r = 0; r < 26; r++){
      for (int c = 0; c < 26; c++){
        Box bbb = GG.access(GG, r, c);
        if (bbb.x == coords.x && bbb.y == coords.y){
          return bbb;
        }
      }
    }
    Box bbbb = GG.grid[25][25]; return bbbb;
  }
}
