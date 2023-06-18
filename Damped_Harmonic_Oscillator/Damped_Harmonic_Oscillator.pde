Ball b;


void setup() {
  size(500, 600);
  b = new Ball();
}


void draw() {
  background(255);

  b.display();
  b.oscillate();
  b.decay();
}
