int timer = 1000;
int currentTime = 0;
int savedTime = 0;
int locX = 250;
int locY = 250;
int sizeX = 100;
int sizeY = 100;
void setup()
{
  size(500,500);
  frameRate(5);
}

void draw()
{
  currentTime = millis();
  fill(random(255),random(255),random(255));
  shapeMode(CENTER);
 rect(locX,locY,sizeX,sizeY);
 
 if(currentTime - savedTime > timer)
 {
   doStuff();
    savedTime = currentTime; 
 }
}

void doStuff()
{
 int stuff = int(random(5));
 if(stuff > 2)
 {
  locX = int(random(500));
  locY = int(random(500));
  sizeX = int(random(300));
  sizeY = int(random(300));
 }
}
