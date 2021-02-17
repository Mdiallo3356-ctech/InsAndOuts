PImage cupcake;
PImage hand;

int y = 0;
boolean win = false;
boolean lose = false;
boolean restart = false;
void setup()
{
size(500,500);
background(255);
imageMode(CENTER);

cupcake = loadImage("cupcake.png");
hand = loadImage("hand.jpg");
}

void draw() 
{
  
  background(255);
  
  image(hand, width/3, height/2);
  image(cupcake, width/2, 0+y);
  
  if(!win && !lose)
  {
    y+=2;  
  }
  if(y > height/1.5)
  {
     lose = true; 
  }
  
  if(y >= height)
  {
     y = 0; 
  }
  
  if(mousePressed == true && (y > height/3 && y < height/1.5))
  {
    win = true;
  }
 
  if(win)
  {
      fill(0,0,0);
      text("YOU WIN", width/2, height/4); 
  }
  if(lose)
  {
    fill(0,0,0);
    text("YOU LOSE", width/2, height/4);
    delay(3000);
    y = 0;
    restart = true;
  }
  
  if(restart)
  {
   win = false;
   lose = false;
   restart = false;
   println("restarting");
  }
}
