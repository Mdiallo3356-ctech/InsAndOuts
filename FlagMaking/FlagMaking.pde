void setup()
{
  size(500,500); 
  background(180);
}

void draw()
{
  if(mousePressed)
  {
    background(180);
   //flag(); 
   flag2();;
  }
}


void flag()
{
 int r1 = int(random(255));
 int g1 = int(random(255));
 int b1 = int(random(255));
 color color1 = color(r1,g1,b1);
 
 int r2 = int(random(255));
 int g2 = int(random(255));
 int b2 = int(random(255));
 color color2 = color(r2,g2,b2);
 
 int r3 = int(random(255));
 int g3 = int(random(255));
 int b3 = int(random(255));
 color color3 = color(r3,g3,b3);
 
 
 int rectX = int(random(20,400));
 int rectY = int(random(20,400));
 noStroke();
  fill(color1);
  rect(rectX, rectY, 20,40);
  
  fill(color2);
  rect(rectX+20, rectY, 20, 40);
  
  fill(color3);
  rect(rectX + 40, rectY, 20,40);
}

//void flag2()
//{
//   int r1 = int(random(255));
// int g1 = int(random(255));
// int b1 = int(random(255));
// color color1 = color(r1,g1,b1);
 
// int r2 = int(random(255));
// int g2 = int(random(255));
// int b2 = int(random(255));
// color color2 = color(r2,g2,b2);
 
// int r3 = int(random(255));
// int g3 = int(random(255));
// int b3 = int(random(255));
// color color3 = color(r3,g3,b3);
// int rectX = int(random(20,400));
// int rectY = int(random(20,400));
 
// fill(color1);
// rect(rectX, rectY, 60, 40);
// fill(color2);
// ellipse(rectX, rectY, 20,20);
// fill(color3);
// rect(rectX, rectY, 10, 10);
//}
