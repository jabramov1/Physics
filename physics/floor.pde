class floor {
  float x0;
  float y0;
  float x1;
  float y1;
  public floor(float X_, float Y_, float X1_, float Y1_) {
    x0 = X_;
    y0 = Y_;
    x1 = X1_;
    y1 = Y1_;
  }
  void display() {
    stroke(222);
    line(x0, y0, x1, y1);
    line(x1, y1, x1, 800);
  }
}
