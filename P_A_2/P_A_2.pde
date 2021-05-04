import processing.serial.*;

int val = 0;

Serial myPort;

void setup()
{
 size(500,500);
 background(155);
 fill(0);
 textSize(22);
 textAlign(CENTER, CENTER);
 
 String portName = Serial.list()[4];
 myPort = new Serial(this, portName, 9600);
}

void draw()
{
  fill(255);
  rect(195, 240, 110,30);
  fill(0);
  text("Click Here", width/2, height/2); 
 
  if(mouseX >= 195 && mouseX <= 305 && mouseY >= 240 && mouseY <= 270)
  {
    if(mousePressed)
    {
     boolean rand =  random(1) > .5;
     println(rand);
     if(rand == true)
     {
      val = 1; 
     }
     else { val = 0;}
     
     myPort.write(val);
     println(val);
    }
  }
}
