Ball b;
Boolean drop = false;
Boolean recordMousePos = true;


void setup() {
  size(800, 600);
  b = new Ball();
}


void draw() {
  background(255);

  //can only drop ball once at start

  if (mousePressed && drop == false) {
    drop = true;
  }

  if (drop == true) {

    //record where mouse is pressed
    if (recordMousePos == true) {
      b.pos.x = mouseX;
      b.pos.y = mouseY;
      recordMousePos = false;
    }

    b.display();
    b.applyForce();
    b.bounce();
  }
}
