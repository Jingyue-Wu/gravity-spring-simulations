class Ball {
  PVector pos;
  float period;
  float amplitude;

  Ball() {
    pos = new PVector(250, 600);    
    period = 90;
    amplitude = 200;
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(179, 25, 255);
    ellipse(pos.x, pos.y, 50, 50);
    line(250, 0, 250, pos.y - 25); //line from anchor to ball position
  }

  void oscillate() {
    //use sin wave to simulate oscillation by moving the ball's y position
    pos.y = amplitude * sin(TWO_PI * frameCount / period) + 250;
  }

  void decay() {
    //slowly decrease amplitude of wave over time
    if (amplitude >= 0) {
      amplitude *= 0.998;
    }
  }
}
