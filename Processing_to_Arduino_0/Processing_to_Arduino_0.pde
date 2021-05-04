import processing.serial.*;

int val = 0;

Serial myPort;

void setup()
{
 size(500,500);
 background(55);
 fill(0);
 textSize(22);
 textAlign(CENTER, CENTER);
 
 String portName = Serial.list()[4];
 myPort = new Serial(this,portName, 9600);
}

void draw()
{
   text("Dimmer", width/4, height/2);
   text("Brighter", width-width/4, height/2);
   
   val = int(map(mouseX, 0, width, 0, 255));
   myPort.write(val);
   println(val);
}
