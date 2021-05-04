import processing.serial.*;

// Mamadou Diallo Final Project
// Tap Tap - Insanity Mod

Serial myPort;
int [] serialInArray = new int[2]; // Array to hold values from Arduino
int serialCount = 0; // Used to place values from arduino into specific indices
boolean firstContact = false; // shows whether Arduino and Processing are communicating 

// Game Variables
String state; // What screen the game is on

boolean gameRunning = false; // shows whether the game is being played or not
boolean gameEnd = false; // shows whether the player is on the end screen or not

int score = 0; // The player's score
int highScore = 0; // The highest score achieved in current playthrough. Default: 0

int xPos, yPos; // X and Y positions of the player(read from arduino)

boolean targetMade = false; // shows whether a target is currently on the screen or not
int radius; // The radius of the target
int targetX, targetY; // The target's X and Y positions, respectively

float begin; // The time when the game begins
float duration = 10; // The duration of the game in seconds
float time; // The amount of time remaining before game ends

void setup()
{
  size(500, 500);

  //String portName = Serial.list()[4];
  //myPort = new Serial(this, portName, 9600);

  // Set player cursor to center of screen 
  xPos = width/2; 
  yPos = height/2;
  
  state = "menu";
}

void draw()
{
  background(#FFCA01); // Set background color to gold
  if(state  == "menu")
  {
     menu(); 
  }
  else if(state == "game")
  {
    game(); 
  }
}

void menu()
{
  
}

void game()
{
  
}

void serialEvent(Serial myPort)
{
  // read a byte from the serial port
  int inByte = myPort.read();
  if (firstContact == false)
  {
    if (inByte == 'A')
    {
      myPort.clear(); // clear serial buffer
      firstContact = true; // first contact is made
      myPort.write('A'); // send signal to arduino to send more data
    }
  } else {
    serialInArray[serialCount] = inByte; // Store data from arduino into specified index in array
    serialCount++; // increment serial count
    
    if(serialCount > 1)
    {
       xPos = serialInArray[0]; // Set X position of player to the first value recieved
       yPos = serialInArray[1]; // Set Y position of player to the second value recieved
       
       // Request more data from arduino by sending a byte back and reset serialCount
       myPort.write('A');
       serialCount = 0;
    }
  }
  
}
