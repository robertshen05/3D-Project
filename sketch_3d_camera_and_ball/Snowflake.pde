class Snowflake {

  //1. Instance variables: the data that each snowflake
  //                       needs to keep track of.
  float x, y, z, size, speed;

  //2. Constructor(s): initializes the instance variables.
  //   Rules: no return type (void), name matches class
  Snowflake() {
    x = random(-2000, width+500);
    y = random(-2000, height); 
    z = random(-2000, width-500);
    size = random(10, 18);
    speed = size+10;
  }

  //3. Behaviour Functions: functions that describe how
  //                        Snowflakes act and look.
  void act() {
    fill(255);
    y = y + speed;
    if (y > height) {
      y = 0;
      x = random(-2000, width+500);
      z = random(-2000, width+500);
    }
  }

  void show() {
    world.pushMatrix();
    world.noStroke();
    world.fill(255);
    world.translate(x, y, z);
    world.box(size);
    world.popMatrix();
  }
} 
