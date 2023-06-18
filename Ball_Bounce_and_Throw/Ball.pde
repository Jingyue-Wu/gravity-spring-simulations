class Ball {
  PVector pos;
  PVector vel;
  PVector force;
  PVector acceleration;
  

  Ball() {
    pos = new PVector(0, 0);
    vel = new PVector(0, 0);
    force = new PVector(-0.1, 0.5); //force.x = wind, force.y = gravity
  }


  void display() {
    fill(104, 179, 247);
    stroke(0);
    strokeWeight(2);
    ellipse(pos.x, pos.y, 50, 50);
  }


  void applyForce() {
    if (mousePressed && (dist(mouseX, mouseY, pos.x, pos.y) < 60)) { //larger hitbox for easier throwing
    
    //determine velocity from the difference between mouse and pmouse
      vel.x = mouseX - pmouseX;
      vel.y = mouseY - pmouseY;

      //stop forces when mouse is pressed on ball
      force.x = 0;
      force.y = 0;
    } else {
      force.x = -0.1;
      force.y = 0.5;
    }
    
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
      vel.y *= -0.9;
    } 

    //prevent bal from getting stuck on edges when dropping and dragging
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

    //check if ball stopped bouncing
    if (pos.y >= height-25) {
      pos.y = height-25;
    }

    if (pos.x <= 25) {
      pos.x = 25;
    }
  }
}
