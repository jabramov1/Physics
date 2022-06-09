  final float mg= 0.07;
  int MODE=2;
  void setup() {
   size(1400, 800);
 }
 Unicycle dude = new Unicycle(20, 780, 40);
 floor level = new floor(0, 800, 700, 600);
 target targ = new target(1000);
 void keyPressed(){
  if (keyCode==39){
    dude.increaseVelocity();
  }
  if (keyCode==32){
    if (MODE==3){
      MODE=0;
    }
    MODE++;
  }
  /*if (keyCode==37){
    dude.decreaseVelocity();
  }*/
 }
 void draw(){
   strokeWeight(4);
   background(255);
   dude.move();
   level.display();
   dude.friction();
   dude.gravity();
   dude.display();
   targ.display();
   nextLevel(dude,targ);
   String pr;
   if (MODE==1){
   pr=("Level One");
}else if (MODE==2){
  pr=("Level Two");
}else{
  pr=("Level Three");
}
fill(0);
text(frameRate,20,20);
text(pr,20,60);
}
void nextLevel(Unicycle u, target t){
  if(u.y==800-u.radius/2 && u.x>t.x && u.x<t.x+100 && u.dx==0){
    delay(600);
    background(255);
    text("HAHAHA JOSEPH IS JEWISH",400,400);
  }
}
