class Spikes{
  float x0;
  float x1;
  float x2;
  Spikes(float x0_,float x1_, float x2_){
    x0=x0_+40;
    x1=x1_;
    x2=x2_;
  }
  void display(){
    for(int i=0; i<((x1-x0)/20); i++){
      fill(#6a0dad);
      triangle(x0+i*20, 800, x0+i*20+10,790, x0+i*20+20, 800);
    }for(int i=0; i<((width-x2)/20); i++){
      triangle(x2+i*20, 800, x2+i*20+10,790, x2+i*20+20, 800);
    }
    
  }
}
