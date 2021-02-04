class Particle extends GameObject {

  int i;
  float speed;
  PVector velocity;
  PVector gravity;

  Particle(PVector l) {
    loc = l.copy();
    float velocity1 = random(-10, 10);
    float velocity2 = random(0, 10);
    float velocity3 = random(-10, 10);
    velocity = new PVector (velocity1, velocity2, velocity3);
    velocity.setMag(40);
    lives = 255;

    gravity = new PVector(0, 5, 0);
  }


  void act() {
    if (loc.y >= height) {
      loc.y = height;
    }
    if (loc.y <=height-gridSize*2) {
      loc.y = height - gridSize*2;
    } else {
      velocity.add(gravity);
      loc.add(velocity);
    }
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white, lives);
    world.noStroke(); 
    world.box(size);
    world.popMatrix();
    lives = lives-15;
  }
}
