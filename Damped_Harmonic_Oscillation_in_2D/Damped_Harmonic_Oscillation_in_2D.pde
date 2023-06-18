//two springs, one ball
Ball b;

Spring s1;
Spring s2;

PVector gravity;


void setup() {
  size(600, 600);

  //one vertical and one horizontal spring
  //different spring constants
  s1 = new Spring(300, 0, 150, 0.1);
  s2 = new Spring(0, 300, 150, 0.15);

  b = new Ball(300, 300);
}


void draw() {
  background(255);
  gravity = new PVector(0, 2);

  //connect both springs to ball
  s1.connect(b);
  s2.connect(b);

  b.applyForce(gravity);
  
  b.dragBall(mouseX, mouseY);

  s1.display(b);
  s2.display(b);
  b.display();
}


//activate and deactivate dragging
void mousePressed() { 
  b.pressed(mouseX, mouseY);
}

void mouseReleased() {
  b.stopDragging();
}
