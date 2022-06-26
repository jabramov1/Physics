float rotation=0;
float rotationSpeed =-0.1;
    float minSpeed = 0.1;
    boolean isSlowing = false;
    
class Stickman {
  int start = int(random(360));
  float t, tk, tf0, tf1, tw;
  float unit = 1;
  Knee[] knees = new Knee[1];
  Foot[] feet = new Foot[1];
  Elbow[] elbows = new Elbow[1];
  Hand[] hands = new Hand[1];

  Stickman(float UNIT) {
    for (int i=0; i<1; i++) {
      knees[i] = new Knee(i);
      feet[i] = new Foot(i);
      elbows[i] = new Elbow(i);
      hands[i] = new Hand(i);
    }
    unit = UNIT;
    
  }

  void stickman() {
    strokeWeight(2);
    stroke(#e0ac69);
    t = (frameCount + start)%360;
    tk = sin (radians(t * 8));
    tf0 = sin (radians((t+12) * 8));
    tf1 = sin (radians((t-12) * 8));
    tw = sin (radians((t+82) * 16));
    pushMatrix();
    translate(0, tw*2);
    pushMatrix();
    translate (0, -unit * 4.5);
    ellipse (0, 0, unit, unit);
    translate (0, unit * 0.5);
    for (Elbow e:elbows) e.move();
    line (0, 0, 0, unit * 1.7);
    translate (0, unit * 1.7);
    for (Knee k:knees) k.move();
    popMatrix ();
    popMatrix ();
    strokeWeight(1);
  }

  class Knee {
    int id, dir;
    PVector p = new PVector();
    Knee(int i) {
      id = i;
      if (i==0) dir = 1;
      else dir = -1;
    }
    void move() {
      if (rotation>PI/4){
      rotationSpeed=-0.02;
      }
      if(rotation<0){
        rotationSpeed=0.02;
      }
      rotation+=rotationSpeed*sqrt(dude.dx*dude.dx+dude.dy*dude.dy)/3;
      pushMatrix ();
      rotate(rotation/2);
      line(0, 0, unit*1.15, 0);
      translate (0, unit*1.15);
      feet[id].move();
      popMatrix ();
    }
  }

  class Foot {
    float angle;
    int dir;
    PVector p = new PVector();
    Foot(int i) {
      if (i==0) dir = 1;
      else dir = -1;
    }
    void move(){
      
      rotation+=rotationSpeed*sqrt(dude.dx*dude.dx+dude.dy*dude.dy)/3;
      pushMatrix ();
      if (dude.x<700)
      rotate(rotation/10);
      if(rotation<PI/4 && rotation>PI/10 && rotationSpeed<0){
        line(9, 0, unit*1.15-1, -unit*1.15-1);
      }
      else{line(unit*1.15, 0, unit*1.15, -unit*1.15);}
      popMatrix();
    }
  }
  

  class Elbow {
    int id, dir;
    PVector p = new PVector();
    Elbow(int i) {
      id = i;
      if (i==0) dir = 1;
      else dir = -1;
    }
    void move() {
      float angle = -dir * radians(tk);
      pushMatrix ();
      if (dude.dx==0){
      angle=0;
    }
      rotate(angle/2);
      line(0, 0, 0, unit*1.1);
      translate (0, unit*1.1);
      hands[id].move();  
      popMatrix();
    }
  }

  class Hand {
    float angle;
    int dir;
    PVector p = new PVector();
    Hand(int i) {
      if (i==0) dir = 1;
      else dir = -1;
    }
    void move() {
      if (dir==-1) angle = -radians(30*tf0 + 100);
      else angle = -radians(30*tf1 + 25);
      pushMatrix();
      if (dude.dx==0){
      angle=0;
    }
      rotate(angle/2);
      line(0, 0, 0, unit*1.1);
      popMatrix();
    }
  }
}
