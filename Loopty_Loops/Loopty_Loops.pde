int x = 0;
void setup()
{
  background(255);
  size(500,500);
}

//void draw()
//{
//   background(255);
//   while(x <= width)
//   {
//     stroke(2);
//     line(x,0, mouseX, mouseY);
//     x += 20;
//   }
//   x = 0;
//}

void draw()
{
 background(71,5,6);
 for(int radius = width*2; radius >= 0; radius -= 50)
 {
   for(int stroke = 10; stroke >= 0; stroke -= 1)
   {
     noFill();
     strokeWeight(stroke);
     ellipse(mouseX,mouseY, radius, radius);
   }
 }
}
