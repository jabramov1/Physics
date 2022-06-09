class Unicycle {
  float x, y;
  float dx, dy;
  float radius;
  public Unicycle(float x_, float y_, float radius_) {
    x = x_;
    y = y_;
    dx = 0;
    dy = 0;
    radius=radius_;
  }
  float angle1= 0.278299659;
  void display() {
    ellipse(x, y, radius, radius);//set r to 40
    line(x, y, x, y-radius);
  }
  void move() {
    x+=dx; 
    y+=dy;
    if (x >= width-radius/2 || x <= radius/2-1) {
      dx*=-1;
      if (x >= width-radius/2) {
        x= width-radius/2;
      } else {
        x = radius/2-1;
        dx=0;
      }
    }
  }
  void gravity() {
     if (y>= height-radius/2) {
      y=height-radius/2;
      dy=0;
     }
     if (MODE==2){
      if (x<700) {
        dy+=mg*sin(angle1);
        dx-=mg*cos(angle1);
      }
      else{
        dy+=mg;
      }
    }
  }
  void friction() {
    if (MODE==2){
    if(y>=800-radius/2){
      if (dx>0){
        dx-=.2;
      }
      else{
        dx=0;
      }
    }
    }
  }
  void increaseVelocity() {
    if (MODE==1){
      dx+=0.15;
    }
    if (MODE==2){
      if(x>=0 && x<=700){
        dx+=0.20*cos(angle1);
        dy-=0.20*sin(angle1);
      }
    }
  }
  /*void decreaseVelocity() {
    dx-=0.15;
  }*/
  void climbObst(){
    if (MODE==2 && x>=200 && x<=700){
      float angle= 0.278299659;//arctan of (200/700)
      dx-=mg*cos(angle);
      dy+=mg*sin(angle);
    }
  }
}
