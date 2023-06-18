class Ball {
  PVector pos;
  PVector vel;
  PVector accel;
  float m = 24;
  float decay = 0.97;

  //check if dragging
  boolean dragging = false;


  Ball(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector();
    accel = new PVector();
  }


  void display() {  
    stroke(0);
    strokeWeight(2);
    fill(247, 241, 116);
    ellipse(pos.x, pos.y, 50, 50);
  }


  void update() {
    //Euler's Method
    vel.add(accel);
    vel.mult(decay);
    pos.add(vel);
    accel.mult(0);
  }


  void applyForce(PVector forces) {
    //apply all forces (spring and gravity forces) to the ball
    //f = ma
    PVector f = forces.get();
    f.div(m);
    accel.add(f);
  }


  //start/stop dragging

  void clicked(int mx, int my) {
    if (dist(mx, my, pos.x, pos.y) < 25) {
      dragging = true;
    }
  }

  void stopDragging() {
    dragging = false;
  }


  void drag(int mx, int my) {
    //move ball to mouse position when dragging
    if (dragging) {
      pos.x = mx;
      pos.y = my;
    }
  }
}
