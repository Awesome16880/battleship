class Settings{
  boolean OnOff;
  int size;
  int x; 
  int y;
  
  Settings(int xx, int yy, int s){
    x = xx;
    y = yy;
    size = s;
    OnOff = false; //off
  }
  Settings(int xx, int yy, int s, boolean onoff){
    this(xx, yy, s);
    OnOff = onoff;
  }
  void Switch(){
    this.OnOff = !this.OnOff;
    display();
  }
  void display(){
    if (this.OnOff == true){ //on
      fill(#00FF00);
      square(this.x, this.y, this.size);
    }
    else{
      fill(#FF0000);
      square(this.x, this.y, this.size);
    }
  }
}
