String state = "down";
boolean start = false;
int x = 250;
int y = 250;
color theColor = color(255);
void setup()
{
 size(500,500); 
}

void draw()
{
 background(180);
 fill(theColor);
 rect(x,y,40,40);
 if(mousePressed)
 {
  start = true; 
 }
 if(start)
 {
    if(state == "down")
   {
     theColor = color(20,50,200); // makes color blue
    y += 5; 
   }  
   else if(state == "left")
   {
     theColor = color(10,180,30); // makes color green
    x -= 5;  
   }
   else if(state == "up")
   {
     theColor = color(#FF1D00);
    y -= 5; 
   }
   else if(state == "right")
   {
     theColor = color(#FF8800);
    x += 5;  
   }
 }
  if(x == 0)
  {
   changeState(); 
   
  }
  if(x == 460)
  {
   changeState(); 
  }  
  if(y == 0)
  {
   changeState(); 
  }
  if(y == height-40)
  {
   changeState(); 
  }  
}

void keyPressed()
{
  if(key == 's')
  {
    changeState();
  }
  if(key == 'r')
  {
   x = 250;
   y = 250;
   start = false;
  }
}

void changeState()
{
   if(state == "down")
   {
    state = "left";
   }
   else if(state == "left")
   {
    state = "up";
   }
   else if(state == "up")
   {
    state = "right";
   }
   else if(state == "right")
   {
    state = "down";
   }
}
