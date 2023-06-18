class Spring {

  PVector anchor;
  float restLength;
  float springConstant;


  Spring(float x, float y, float l, float k) {
    anchor = new PVector(x, y); //where the string is attached to the walls
    restLength = l;
    springConstant = k; // spring constant
  }


  void connect(Ball b) {

    //find the magnitude of the force of the stretch
    PVector force = PVector.sub(b.pos, anchor);
    float x = force.mag() - restLength; //x = magnitude of stretch

    //apply spring force on to ball using spring constant and stretch
    force.normalize();
    force.mult(-springConstant*x); //Hooke's Law
    b.applyForce(force);
  }


  void display(Ball b) {
    stroke(0);
    strokeWeight(2);
    line(b.pos.x, b.pos.y, anchor.x, anchor.y);
  }
}
