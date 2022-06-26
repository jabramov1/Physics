class target{
  float x;
  float x0;
  public target(float x_, float x0_){
    x=x_;
    x0= x0_;
  }
  void display() {
    fill(#84C011);  
    stroke(#84C011);
    rect(x, 798, x0-x, 4);
    /*strokeWeight(2);
    line(x+7, 800 ,x+ 7, 780);
    line(x+17, 800 ,x+ 17, 780);
    line(x+27, 800 ,x+ 27, 780);
    line(x+37, 800 ,x+ 37, 780);*/
  }
}
