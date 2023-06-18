class Ball {
  PVector pos;
  PVector vel;
  PVector force;

  Ball() {
    pos = new PVector(0, 0);
    vel = new PVector(0, 0);
    force = new PVector(-0.1, 0.8); //force.x = wind, force.y = gravity
  }

  void display() {
    fill(234, 128, 79);
    stroke(0);
    strokeWeight(2);
    ellipse(pos.x, pos.y, 50, 50);
  }

  void applyForce() {
    //Euler's method
    vel.add(force);
    pos.add(vel);
  }

  void bounce() {
    //check for edges
    if ((pos.x > width-25) || (pos.x < 25)) {
      vel.x *= -0.9;
    }
    if ((pos.y > height-25) || (pos.y < 25)) {
      vel.y *= -0.96;
    } 

    //prevent ball from getting stuck on edges when placed. 
    //if mouse is pressed right on the edge(inside the "wall"), place ball in nearest possbile location within the wall boundaries)
    if (pos.x < 25) {
      pos.x = 25;
    }
    if (pos.x > width-25) {
      pos.x = width-25;
    }
    if (pos.y < 25) {
      pos.y = 25;
    }
    if (pos.y > height-25) {
      pos.y = height-25;
    }

    //check if ball has stopped bouncing
    if (pos.y >= height-25) {
      pos.y = height-25;
    }
    if (pos.x <= 25) {
      pos.x = 25;
    }
  }
}
