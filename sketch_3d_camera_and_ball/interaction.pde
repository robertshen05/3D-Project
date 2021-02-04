void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true; 
  if (key == 'a' || key == 'A') akey = true; 
  if (key == 's' || key == 'S') skey = true; 
  if (key == 'd' || key == 'D') dkey = true;

  if (key == ' ') spacekey = true;
  if (key == 'e' || key == 'E') ekey = true;
  if (keyCode == SHIFT) shiftkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false; 
  if (key == 'a' || key == 'A') akey = false; 
  if (key == 's' || key == 'S') skey = false; 
  if (key == 'd' || key == 'D') dkey = false;
  if (key == ' ') spacekey = false;
  if (key == 'e' || key == 'E') ekey = false;
  if (keyCode == SHIFT) shiftkey = false;
}

void mouseReleased() {
  if (mode == INTRO) {
    mode = GAME;
  } else if (mode == GAME) {
    mode = PAUSE;
  } else if (mode == PAUSE) {
    mode = GAME;
  }
}
