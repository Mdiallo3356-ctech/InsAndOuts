/*
  DISCLAIMER: Well I actually forgot the contents of the assignment for this week so I'm actually 
  just winging this at 2am day of the assignment. It was going to be done yesterday 
  but I fell asleep and stayed that way all day. 

  ASSIGNMENT GUIDELINES MADE UP IN 5 MINUTES
  - Use shapes
  - Make shapes appear as a result of user input(mouse clicks)
  - Move shapes based on user input(spacebar to cause all shapes to move up and down quickly)
  - Use random function in some way 
*/ 

color backgroundColor = color(100,60,4);
color cc;
float shapeX;
float shapeY;
int shake = 0;
boolean rand;
boolean shaking;

int lineX = 500;
void setup()
{
 size(1000, 1000);
 background(backgroundColor);
}

void draw()
{
  rand = random(1) > 0.5;
  // On mouse click, begin spawn 10 shapes that either go left or right of the mouse location at random
  if(mousePressed)
  {
    strokeWeight(5);
    stroke(255);
    line(lineX,0,lineX,1000);
    if(mouseX >= lineX - 5 && mouseX <= mouseX + 5)
     {
      if(mousePressed)
      {  
        background(backgroundColor);
        lineX = mouseX; 
      }
    }
    for(int i = 0; i < 10; i++)
    {
      boolean random = random(1) > 0.5;
      if(random)
      {
        int circ = int(random(40));
        fill(cc);
        ellipse(mouseX+shapeX, mouseY + shapeY, circ, circ);
      }
      else
      {
        int circ = int(random(40));
        fill(255);
        rect(mouseX+shapeX, mouseY + shake, circ, circ);         
      }
    }
  }
  
  // When spacebar is presed, make shapes shaken 
  if(keyPressed)
  {
    if(key == 'm')
    {
       shaking = true;
       cc = color(random(256),random(256),random(256)); 
    }
  }
}
