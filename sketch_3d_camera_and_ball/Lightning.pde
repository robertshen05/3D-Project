class Lightning extends GameObject {

  float x, z, timer;
  int lives;

  Lightning() {
    lives = 1;
    x = random(-2000, width+500);
    z = random(-2000, width-500);
    timer = 60;
  }

  void act() {
    if (timer == 0) {
      lives = 0;
    } else timer--;
  }

  void show() {
    world.pushMatrix();
    world.noStroke();
    world.fill(255);
    world.translate(x, 1000, z);
    world.box(100, 10000, 100);
    world.popMatrix();
  }
}

void addLightning() {
  if (lightningTime == 0) {
    objects.add(new Lightning()); 
    lightningTime = (int)(random(180, 240));
  } else {
    lightningTime--;
  }
}
