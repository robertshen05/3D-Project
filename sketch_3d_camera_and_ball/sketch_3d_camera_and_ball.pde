import java.awt.Robot;

//color pallette
color black = #000000; //oak planks 
color white = #FFFFFF;  //empty space
color dullBlue = #7092BE; //mossyBricks

//modes
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;

//textures
PImage diamond;
PImage mossyStone;
PImage oakPlanks;

//Map variables
int gridSize;
float x = 0;
PImage map;

ArrayList<Snowflake> snowList;

Robot rbt;

boolean wkey, akey, skey, dkey, spacekey, ekey, shiftkey;

//rotation variable
float leftRightAngle;
float upDownAngle;

float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

//Game Object
ArrayList<GameObject> objects;


//canvases 
PGraphics world;
PGraphics HUD;

int lightningTime;

void setup() {
  //canvases
  world = createGraphics(width,height,P3D);
  HUD = createGraphics(width,height, P2D);
  
  mode = INTRO; 
  
  objects = new ArrayList<GameObject>();
  
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  diamond = loadImage("diamond.png");
  oakPlanks = loadImage("Oak_Planks.png");

  noCursor();
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  leftRightAngle = 0;
  upDownAngle = 0;

  size (displayWidth, displayHeight, P2D);

  snowList = new ArrayList<Snowflake>();
  int i = 0;
  while (i < 100) {
    snowList.add( new Snowflake() );
    i = i + 1;
  }

  eyex = width/2;
  eyey = 9*height/10;
  eyez = height/2;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 300;

  upx = 0;
  upy = 1;
  upz = 0;

  //initializing map
  map = loadImage("map.png");
  gridSize = 100;
  
}

void draw() {
    if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else {
    println("Error: Mode = " + mode);
  }
}
