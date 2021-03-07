/*
  click mouse and P at the same time to spawn the player at teh location of the 
  mouse pointer. 
  
  Use WASD control to move to any of the 4 quadrants to see different changes in
  the player
*/

int playerX;
int playerY;
int rad = 30;
boolean playerSpawned = false;
boolean NW;
boolean NE;
boolean SW; 
boolean SE;
boolean isCircle = true;

void setup()
{
  frameRate(60);
  size(500, 500);
}


void draw()
{
  background(100, 40, 6);
  stroke(255);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  if (!playerSpawned && mousePressed && keyPressed && key == 'p')
  {
    playerX = mouseX;
    playerY = mouseY;
    playerSpawned = true;
  }

  if (playerSpawned)
  {
    makePlayer();
  }
  
  if (playerX < width/2 && playerY < height/2)
  {
    NW = true;
    NE = false;
    SW = false;
    SE = false;
  }
  else if (playerX < width/2 && playerY > height/2)
  {
    NW = false;
    NE = false;
    SW = true;
    SE = false;
  }
  else if (playerX > width/2 && playerY < height/2)
  {
    NW = false;
    NE = true;
    SW = false;
    SE = false;
  }
  else if (playerX > width/2 && playerY > height/2)
  {
    NW = false;
    NE = false;
    SW = false;
    SE = true;
  }
  
  quadrant();
}

void keyPressed()
{
  if (keyCode == 83) //if W
  {
    playerY += 2;
  }

  if (keyCode == 87) //if S
  {
    playerY -= 2;
  } 

  if (keyCode == 65) //if A
  {
    playerX -= 2;
  }

  if (keyCode == 68) //if D
  {
    playerX += 2;
  }
}

void quadrant()
{
 if(NW)
 {
   frameRate(5);
   fill(random(255),random(255),random(255));
   rad = int(random(180));
 }
 if(NE)
 {
  frameRate(60);
  isCircle = !isCircle;
  makePlayer();
 }
 if(SW)
 {
  if(rad < 200)
  {
   rad++; 
  }
 }
 if(SE)
 {
  if(rad > 5)
  {
   rad --; 
  }
 }
}

void makePlayer()
{
 if(isCircle)
 {
   ellipse(playerX, playerY, rad, rad);
 }
 else
 {
   shapeMode(CENTER-RIGHT);
  rect(playerX, playerY, rad, rad); 
 }
}
