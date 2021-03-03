int playerX;
int playerY;

boolean playerSpawned = false;

void setup()
{
  size(500,500);
  background(100,40,6);
}


void draw()
{
  background(100,40,6);
  if(!playerSpawned && mousePressed && keyPressed && key == 'p')
  {
    playerX = mouseX;
    playerY = mouseY;
    playerSpawned = true;
  }
  
  if(playerSpawned)
  {
   ellipse(playerX, playerY, 30,30); 
  }
  
  
}

void keyPressed()
{
   if(keyCode == 83) //if W
   {
    playerY += 2;
   }

   if(keyCode == 87) //if S
   {
    playerY -= 2;
   } 

   if(keyCode == 65) //if A
   {
    playerX -= 2;
   }
   
   if(keyCode == 68) //if D
   {
    playerX += 2;
   }
   
}
