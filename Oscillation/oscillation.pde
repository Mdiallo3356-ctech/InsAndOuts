boolean right = true;
int x = 250;
int y = 250;
float r = 255;
float g = 157;
float b = 243;

float num = 0;
float radius = 100;
void setup()
{
  size(1000,1000);
}

void draw()
{
  //background(color(152,34,255));
  fill(r,g,b);
  rect(cos(num/10)*radius + x,sin(num/10)*radius + y,50,50);
  ellipse(-cos(num/10) * radius + 2*x, -sin(num/10) * radius + 2*y,25,25);
  
  if(right)
  {
     x += 5; 
  }
  else
  {
     x -= 5; 
  }
  if(x <= 0)
  {
     x = 0; 
     right = !right;
  }
  if(x >= 1000)
  {
    x = 1000; 
    right = !right;
  }
  if(mousePressed)
  {
     right = !right; 
     r = random(255);
     g = random(255);
     b = random(255);
  }
  num += 1;
}
