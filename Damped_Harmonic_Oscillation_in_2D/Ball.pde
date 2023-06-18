class Ball {
  PVector pos;
  PVector vel;
  PVector accel;
  float m = 24; //mass
  float decay = 0.99;

  boolean dragging = false;
  PVector dragOffset;
  

  Ball(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector();
    accel = new PVector();
    dragOffset = new PVector();
  }


  void display() {  
    stroke(0);
    strokeWeight(2);
    fill(93, 244, 173);
    ellipse(pos.x, pos.y, 50, 50);
  }


  void applyForce(PVector forces) {

    //Euler's method
    vel.add(accel);
    vel.mult(decay);
    pos.add(vel);
    accel.mult(0);

    //f = ma
    PVector f = forces;
    f.div(m);
    accel.add(f);
  }


  //check if ball is being dragged

  void pressed(int x, int y) {
    float d = dist(x, y, pos.x, pos.y);
    if (d < 25) {
      dragging = true;
      dragOffset.x = pos.x-x;
      dragOffset.y = pos.y-y;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  //move ball with mouse
  void dragBall(int x, int y) {
    if (dragging) {
      pos.x = x + dragOffset.x;
      pos.y = y + dragOffset.y;
    }
  }
}
