class Spring {

  PVector anchor;

  float restLength;
  float k = 0.15; // spring constant

  Spring(float x, float y, float l) {
    anchor = new PVector(x, y);
    restLength = l;
  }

  void connect(Ball b) {
    //determine force from how much the spring is stretched
    PVector force = PVector.sub(b.pos, anchor); 
    float x = force.mag() - restLength; //x = magnitude of stretch

    //apply spring force on to ball using spring constant and stretch
    force.normalize();
    force.mult(-k*x); //Hooke's Law
    b.applyForce(force);
  }

  void display(Ball b) {
    stroke(0);
    strokeWeight(2);
    line(b.pos.x, b.pos.y, anchor.x, anchor.y);
  }
}
