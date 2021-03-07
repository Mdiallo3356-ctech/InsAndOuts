// Press Mouse to either grey out or bring back color
// Mamadou Diallo
int amount = 0; 
boolean grey = false;
color [] colorGenerator = new color[10];
void setup()
{
  size(625,625);
  for(int i = 0; i < colorGenerator.length; i++)
  {
   colorGenerator[i] = color(random(255),random(255), random(255)); 
  }
}

void draw()
{
  background(150);
  for(int i = 0; i < 625; i += 25)
  {
     for(int j = 0; j < 625; j+= 25)
     {
       fill(colorGenerator[int(random(colorGenerator.length))]);
       spawn(i, j);
     }
  }
  if(mousePressed)
  {
     grayOut(); 
  }
  delay(500);
}

void spawn(int i, int j)
{
  boolean shape = random(1) > 0.5;
  if(shape)
  {
     rect(i,j,20,20); 
  }
  else
  {
     shapeMode(CORNER);
     ellipse(i,j,20,20); 
  }
}

void grayOut()
{
  if(!grey)
  {
    grey = true;
    for(int i = 0; i < colorGenerator.length; i++)
    {
     colorGenerator[i] = color(random(30,180)); 
    }    
  }
  else
  {
    grey = false;
    for(int i = 0; i < colorGenerator.length; i++)
     {
      colorGenerator[i] = color(random(255),random(255), random(255)); 
      }
  }

}
