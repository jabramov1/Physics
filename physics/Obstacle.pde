class Obstacle {
  float x, y;
  Obstacle(float x_, float y_) {
    x=x_;
    y=y_;
  }
  void display() {
    fill(#9F8170);
    stroke(220,20,60);
    rect(x, y, 40, 20);
  }
}
