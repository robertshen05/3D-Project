void move() {

if (spacekey == true) {
  objects.add(new Bullet()); 
}

  if (akey && canMoveLeft()) {
    eyex += cos(leftRightAngle - PI/2)*10;
    eyez += sin(leftRightAngle - PI/2)*10;
  }
  if (dkey && canMoveRight()) {
    eyex += cos(leftRightAngle + PI/2)*10;
    eyez += sin(leftRightAngle + PI/2)*10;
  }
  if (wkey && canMoveForward() ) {
    eyex += cos(leftRightAngle)*10;
    eyez += sin(leftRightAngle)*10;
  }
  if (skey && canMoveBackward()) {
    eyex -= cos(leftRightAngle)*10;
    eyez -= sin(leftRightAngle)*10;
  }
  if (ekey && eyey>100) {
    eyey -= 5;
  }
  if (shiftkey && eyey<height-100){
   eyey += 5; 
  }


  focusx = eyex + cos(leftRightAngle)*300;
  focusy = eyey + tan(upDownAngle)*300;
  focusz = eyez + sin(leftRightAngle)*300;

  leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.01;
  upDownAngle = upDownAngle + (mouseY - pmouseY)*0.01;

  if (upDownAngle >  PI/2.5 ) upDownAngle = PI/2.5;
  if (upDownAngle < -PI/2.5 ) upDownAngle = -PI/2.5;

  if (mouseX > width-2) rbt.mouseMove(3, mouseY);
  if (mouseX < 2) rbt.mouseMove(width-3, mouseY);
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  float leftx, leftz;
  float rightx, rightz;
  int mapx, mapy, mapleftx, mapleftz, maprightx, maprightz;

  fwdx = eyex + cos(leftRightAngle)*100;
  leftx = eyex + cos(leftRightAngle+radians(30))*100;
  rightx = eyex + cos(leftRightAngle-radians(30))*100;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*100;
  leftz = eyez + sin(leftRightAngle+radians(30))*100;
  rightz = eyez + sin(leftRightAngle-radians(30))*100;

  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;
  mapleftx = int (leftx+2000) / gridSize;
  mapleftz = int (leftz+2000) / gridSize;
  maprightx = int (rightx+2000) / gridSize;
  maprightz = int (rightz+2000) / gridSize;

  if (map.get(mapx, mapy) == white && map.get(mapleftx, mapleftz) == white && map.get(maprightx, maprightz) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float fwdx, fwdy, fwdz;
  float leftx, leftz;
  float rightx, rightz;
  int mapx, mapy, mapleftx, mapleftz, maprightx, maprightz;

  fwdx = eyex + cos(leftRightAngle - PI/2)*100;
  leftx = eyex + cos(leftRightAngle - PI/2+radians(30))*100;
  rightx = eyex + cos(leftRightAngle - PI/2 -radians(30))*100;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle - PI/2)*100;
  leftz = eyez + sin(leftRightAngle - PI/2+radians(30))*100;
  rightz = eyez + sin(leftRightAngle - PI/2-radians(30))*100;

  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;
  mapleftx = int (leftx+2000) / gridSize;
  mapleftz = int (leftz+2000) / gridSize;
  maprightx = int (rightx+2000) / gridSize;
  maprightz = int (rightz+2000) / gridSize;


  if (map.get(mapx, mapy) == white && map.get(mapleftx, mapleftz) == white && map.get(maprightx, maprightz) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float fwdx, fwdy, fwdz;
  float leftx, leftz;
  float rightx, rightz;
  int mapx, mapy, mapleftx, mapleftz, maprightx, maprightz;

  fwdx = eyex + cos(leftRightAngle + PI/2)*100;
  leftx = eyex + cos(leftRightAngle + PI/2+radians(30))*100;
  rightx = eyex + cos(leftRightAngle + PI/2 -radians(30))*100;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle + PI/2)*100;
  leftz = eyez + sin(leftRightAngle + PI/2+radians(30))*100;
  rightz = eyez + sin(leftRightAngle + PI/2-radians(30))*100;

  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;
  mapleftx = int (leftx+2000) / gridSize;
  mapleftz = int (leftz+2000) / gridSize;
  maprightx = int (rightx+2000) / gridSize;
  maprightz = int (rightz+2000) / gridSize;

  if (map.get(mapx, mapy) == white && map.get(mapleftx, mapleftz) == white && map.get(maprightx, maprightz) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBackward() {
  float fwdx, fwdy, fwdz;
  float leftx, leftz;
  float rightx, rightz;
  int mapx, mapy, mapleftx, mapleftz, maprightx, maprightz;

  fwdx = eyex + cos(leftRightAngle - PI/2)*100;
  leftx = eyex + cos(leftRightAngle - PI/2+radians(30))*100;
  rightx = eyex + cos(leftRightAngle - PI/2 -radians(30))*100;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle - PI/2)*100;
  leftz = eyez + sin(leftRightAngle - PI/2+radians(30))*100;
  rightz = eyez + sin(leftRightAngle - PI/2-radians(30))*100;

  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;
  mapleftx = int (leftx+2000) / gridSize;
  mapleftz = int (leftz+2000) / gridSize;
  maprightx = int (rightx+2000) / gridSize;
  maprightz = int (rightz+2000) / gridSize;

  if (map.get(mapx, mapy) == white && map.get(mapleftx, mapleftz) == white && map.get(maprightx, maprightz) == white) {
    return true;
  } else {
    return false;
  }
}
