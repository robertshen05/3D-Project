void intro() {
  background(0);
  PFont g = createFont("Georgia", 20);
  textFont(g);
  textAlign(CENTER);
  textSize(40);
  String y = "YOURCRAFT";
  
  float z = 10; //flashing text
  for (int i = 0; i < y.length(); i++){
   fill(random(255)); 
   char c = y.charAt(i);
   z = z + textWidth(c);
  }
  text(y, width/2, height/2);
  textSize(20);
  text("Click Anywhere to Begin", width/2, height/2+100);
  text("W,A,S,D to move, E/Shift to fly/desend, click anywhere to pause/unpause", width/2, height/2+150);
}

void game() {
  world.beginDraw();
  world.textureMode(NORMAL);
  world.colorMode(HSB);

  x = x + 0.1;
  world.background(119, 235, x);

  if (x >= 240) {
    x = 0;
  } 

  int s = 0;
  while (s < 100) {
    Snowflake mySnowflake = snowList.get(s);
    mySnowflake.act();
    mySnowflake.show();
    s = s + 1;
    world.colorMode(RGB);
  }  

  world.pointLight(255, 255, 255, eyex, eyey, eyez);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  move();

  drawAxis();
  drawFloor(-2000, 2000, height, gridSize); //floor
  //drawFloor(-2000, 2000, height-gridSize*4, gridSize); //ceiling
  drawMap();

  drawInterface();

  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  
  addLightning();
  
  world.endDraw();
  image(world, 0, 0);

  HUD.beginDraw();
  HUD.clear();
  drawCrosshair();
  drawMinimap();
  HUD.endDraw();
  image(HUD, 0, 0);
}

void gameClicks() {
  mode = PAUSE;
}

void gameover() {
  background(125);
  text("Better luck next time", width/2, height/2);
}

void gameoverClicks() {
  mode = INTRO;
}

void pause() {
  //tried making the pause text move by replacing width/2 with textX 
  //float textX = 0; 
  //float speedX = 5;
  colorMode(RGB);
  background(120, 25, 10);
  textSize(20);
  text("Paused", width/2, height/2);
  //if (textX < 100){
  //textX = textX + speedX;
  //}
}

void pauseClicks() {
  mode = GAME;
}
