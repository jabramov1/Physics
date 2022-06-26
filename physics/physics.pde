  final float f= 0.07;
  int counter=0;
   Stickman man= new Stickman(15);
  

   Obstacle rock= new Obstacle(700,780);
      Unicycle dude;
    floor level;
       target targ;
       Spikes s;
       int MODE=1;
  void setup() {
    size(1400, 800);
    if(MODE==1){
       dude = new Unicycle(20, 780, 40);
       level = new floor(0, 800, 700, 800);
       targ = new target(900, 1000);
       s = new Spikes(level.x1, targ.x, targ.x0);
       level.display();
    }
    else if(MODE==2){
       dude = new Unicycle(20, 780, 40);
      level = new floor(0, 800, 700, 600);
       targ = new target(1000, 1100);
       s = new Spikes(level.x1, targ.x, targ.x0);
    }else{
       dude = new Unicycle(20, 680, 40);
       level = new floor(0, 700, 650, 800);
      targ = new target(1000, 1100);
       s = new Spikes(level.x1+50, targ.x, targ.x0);
    }
  }
 void keyPressed(){
   if (key == BACKSPACE){
     MODE=1;
     setup();
     counter=0;
   }
  if (keyCode==39){
    dude.increaseVelocity();
     
  }
  if (keyCode==32){
   if (MODE==3){
      MODE=0;
    }
    MODE++;
    setup();
    counter=0;
  }
  /*if (keyCode==37){
    dude.decreaseVelocity();
  }*/
 }
 void draw(){
   String pr;
   if (MODE==1){
     /*dude = new Unicycle(20, 780, 40);
     level = new floor(0, 800, 700, 800);
     targ = new target(1000, 1100);
     s = new Spikes(level.x1, targ.x, targ.x0);*/
   pr=("Level One");
}else if (MODE==2){
  /*dude = new Unicycle(20, 780, 40);
  level = new floor(0, 800, 700, 600);
  targ = new target(1000, 1100);
  s = new Spikes(level.x1, targ.x, targ.x0);*/
  pr=("Level Two");
}else{
  /*
  dude = new Unicycle(20, 580, 40);
       level = new floor(0, 600, 700, 800);
      targ = new target(1000, 1100);
       s = new Spikes(level.x1, targ.x, targ.x0);*/
  
  pr=("Level Three");
}
strokeWeight(4);
   background(255);
   dude.move();
   level.display();
   dude.friction();
   dude.gravity();
   dude.display();
   targ.display();
   dude.die();
   s.display();
nextLevel(dude,targ);
rock.display();

fill(0);
textSize(20);
text(frameRate,20,20);
text("vx: "+dude.dx,120,120);
text("vy: "+dude.dy,220,220);
text("x: "+dude.x,320,20);
text("gravity constant: 0.07",1020,20);
text("Distance to target: "+(targ.x-dude.x), 520,20);
text("gap to go over: "+(targ.x-700), 520,120);
text("Falling y-dist after Obstacle: 50", 1020,220);
text(pr,20,60);
if (dude.x>700 && MODE!=2){
  translate(0,30);
}
  translate (dude.x, dude.y+10);
   man.stickman();
 }
void nextLevel(Unicycle u, target t){
  if(u.y==800-u.radius/2 && u.x>t.x && u.x<t.x+100 && u.dx==0){
    delay(600);
    background(255);
    textSize(20);
    text("Nice. Press space to advance. Unless you finsihed all 3 levels",400,400);
  }
}
