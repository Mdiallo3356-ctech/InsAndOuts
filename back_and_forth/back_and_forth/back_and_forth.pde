import processing.serial.*;

Serial myPort;

int [] serialInArray = new int[2];
int serialCount = 0;
boolean firstContact = false;

int xpos, ypos, bgcolor;

void setup()
{
  size(256,256);
  noStroke();
  
  xpos = width/2;
  ypos = height/2;
  
  printArray(Serial.list());
  String portName = Serial.list()[4];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  background(bgcolor);
  fill(255, 0, 0);
  ellipse(xpos, ypos, 20, 20);
}

void serialEvent(Serial myPort)
{
 // read a byte from the serial port
 int inByte = myPort.read();
 // if this is the first byte recieved, and it's an A, cclear the serial buffer and ntoe that you have first contact with the microcontroller
 
 if(firstContact == false){
  if(inByte == 'A')
  {
    myPort.clear(); // clear serial buffer
    firstContact = true; //first contact made
    myPort.write('A'); //ask for more data
  }
 }
 else
 {
  serialInArray[serialCount] = inByte;
  serialCount++;
  
  if(serialCount > 1)
  {
   xpos = serialInArray[0];
   ypos = serialInArray[1];
   
   println(xpos + ", " + ypos + ", " + bgcolor);
   
   //request more data by sending a byte back
   myPort.write('A');
   serialCount = 0;
  }
 }
}
