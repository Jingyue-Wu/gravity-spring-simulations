Ball b1;
Ball b2;

Spring sa;
Spring s1;
Spring s2;


void setup() {
  size(600, 600);

  sa = new Spring(300, 0, 150); //string from ball 1 to anchor

  b1 = new Ball(300, 300);
  b2 = new Ball(300, 500);
}


void draw() {
  background(255);

  PVector gravity = new PVector(0, 6);

  //string in both directions between ball 1 and ball 2 so they can pull on eachother
  s1 = new Spring(b2.pos.x, b2.pos.y, 150);
  s2 = new Spring(b1.pos.x, b1.pos.y, 150);

  b1.applyForce(gravity);
  b2.applyForce(gravity);

  sa.connect(b1);
  s1.connect(b1); //b2 to b1
  s2.connect(b2); //b1 to b2

  b1.update();
  b2.update();

  b1.drag(mouseX, mouseY);
  b2.drag(mouseX, mouseY);

  sa.display (b1);
  s1.display(b1);

  b1.display();
  b2.display();
}


//activate and deactivate dragging 
void mousePressed() { 
  b1.clicked(mouseX, mouseY);
  b2.clicked(mouseX, mouseY);
}

void mouseReleased() {
  b1.stopDragging();
  b2.stopDragging();
}
