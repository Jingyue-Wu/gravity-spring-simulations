Ball b;
Boolean drop = false;
Boolean recordMousePos = true;


void setup() {
  size(800, 600);
  b = new Ball();
}


void draw() {

  background(255);

  //only drop ball once at the start
  if (mousePressed && drop == false) {
    drop = true;
  }

  if (drop == true) {

    //drop ball where mouse is pressed
    if (mousePressed && recordMousePos == true) {
      b.pos.x = mouseX;
      b.pos.y = mouseY;
      recordMousePos = false; //prevents ball from being re-dropped
    }

    b.display();
    b.applyForce();
    b.bounce();
  }
}
