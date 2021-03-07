// Progress Bar
int timer = 10;
int currentTime = 0;
int savedTime = 0;
int X = 0;
color pColor;
void setup()
{
  size(1000,500);
  noFill();
  rect(0,250,1000,150);
}

void draw()
{
  colorManage();
  currentTime = millis();
  fill(pColor);
  quad(0,250,0,400,X,400, X,250);
  if(currentTime - savedTime > timer)
  {
    X += 5;
    savedTime = currentTime;
    if(X > 1000)
    {
      X = 1000;
     complete(); 
    }
  }
}

void complete()
{
 noLoop();
 background(50, 10, 220);
 textSize(50);
 fill(color(255));
 text("LOADING COMPLETE", 300, 250);
}

void colorManage()
{
 if(X < width*.10)
 {
   pColor = color(240,48,0);  
 }
 else if( X < width*.30)
 {
   pColor = color(242,147,12);
 }
 else if( X < width*.50)
 {
   pColor = color(219,185,0);
 } 
 else if( X < width*.80)
 {
   pColor = color(155,247,15);
 }
 else
 {
  pColor = color(0,235,60); 
 }
}
