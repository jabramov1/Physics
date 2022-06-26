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
  float angle2= 0.152649328;
  void display() {
    if (MODE==2||x<700){
    ellipse(x, y, radius, radius);//set r to 40
    line(x, y, x, y-radius/2-5);
    }else{
      ellipse(680, 780, 40,40);
    }
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
    if (MODE==2) {
      if (x<700) {
        dy+=f*sin(angle1);
        dx-=f*cos(angle1);
      }
    }
    if (x>701){
        dy+=f;
    }
    if (x>700 && (MODE==1 || MODE==3) && counter==0) {
      dy=0;
      y=750;
      counter+=1;//or else never chnages
    }
    if (MODE==3) {
      if (x<650) {
        dy+=f*sin(angle2)/3;
        dx+=f*cos(angle2)/3;
      }
    }
    
  }
  
  void die(){
    if(MODE==3){
      if(y>= height-radius/2 && x>700 && (x<1200 || x>1300) ){
        dx=0;
        stroke(#FF5733);
        textSize(50); 
        text("Press 'BACKSPACE' to restart from level 1 ",200,400);
        textSize(10);
        text("Or you can press space to skip through",400,500);
      }
    }
    else if(y>= height-radius/2 && x>700 && (x<1000 || x>1100)){
        dx=0;
        stroke(#FF5733);
        fill(#FF5733);
        textSize(50); 
         text("Press 'BACKSPACE' to restart from level 1 ",200,400);
        textSize(10);
        text("Or you can press space to skip through",400,500);
      }
    }
  void friction() {
    if (y>=800-radius/2 && x>700) {
      if (dx>0) {
        dx-=.4;
      }
      else {
        dx=0;
      }
    }
  }
  void increaseVelocity() {
    if (x<700) {
      if (MODE==1) {  
        dx+=0.15;
      }
      if (MODE==2) {   
          dx+=0.20*cos(angle1);
          dy-=0.20*sin(angle1);
      }
        if (MODE==3&& x<650) {
          dx+=0.20*cos(angle2);
          dy+=0.20*sin(angle2);
        }
      }
  }
}
