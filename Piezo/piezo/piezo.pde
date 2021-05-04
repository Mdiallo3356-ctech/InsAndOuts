import processing.serial.*;

int val = 0;

Serial myPort;

void setup()
{
 size(500, 500);
 textSize(44);
 textAlign(CENTER, CENTER);
 

 String portName = Serial.list()[4];
 
 myPort = new Serial(this, portName, 9600);
}

void draw()
{
 background(mouseX, mouseY, mouseX/2);
 fill(mouseY + 100, 0, mouseX);
 text("PRESS AND MOVE", width/2, height/2);
 
 if(mousePressed)
 {
  val = int(map(mouseX, 0, width, 0, 255));
  myPort.write(val);
  println(val);
 }
}
