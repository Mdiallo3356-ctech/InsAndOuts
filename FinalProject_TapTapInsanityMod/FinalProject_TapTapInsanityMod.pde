import processing.serial.*;
import processing.sound.*;
// Mamadou Diallo Final Project
// Tap Tap - Insanity Mod

SoundFile file;

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
float duration = 20; // The duration of the game in seconds
float time; // The amount of time remaining before game ends

PShape player;
void setup()
{
  file = new SoundFile(this, "insanityMod.wav");
  size(500, 500);

  String portName = Serial.list()[2];

  myPort = new Serial(this, portName, 9600);

  // Set player cursor to center of screen 
  xPos = 250; 
  yPos = 450;

  state = "menu";
}

void draw()
{
  player = createShape(ELLIPSE, xPos, yPos, 20, 20);
  background(#FFCA01); // Set background color to gold
  if (state  == "menu")
  {
    menu();
  } else if (state == "game")
  {
    game();
  }
}

void menu()
{
  stroke(0);
  strokeWeight(2);
  fill(#AF0FE6);
  rect(125, 300, width/2, 100);

  fill(0);
  textSize(100);
  text("TAP TAP", 50, 100);
  textSize(70);
  text("BE G IN", 125, 380);
  textSize(30);
  fill(255, 20, 20);
  text("Insanity Mod", 150, 150);

  // Creating Power Button 
  fill(200, 30, 20);
  rect(230, 475, 40, 20);
  noFill();
  stroke(255);
  ellipse(250, 485, 15, 15);

  stroke(0);
  ellipse(250, 350, 25, 25);

  fill(255);
  stroke(0);
  player.setFill(color(255));
  shape(player);

  if (mousePressed)
  {
    yPos--;
  }
  if (mousePressed && mouseX >= 230 && mouseX <= 270 && mouseY >= 475 && mouseY <= 495)
  {
    exit();
  }

  if ((xPos >= 230 && xPos <= 260 && yPos >= 330 && yPos <= 360) || key == 'r')
  {
    state = "game";
  }
}

void game()
{
  fill(0);
  stroke(0);
  player.setFill(color(255));
  shape(player);

  stroke(255);
  line(0, 70, 500, 70);
  line(0, 450, 500, 450);
  line(50, 0, 50, 500);
  line(450, 0, 450, 500);

  if (!gameRunning && !gameEnd)
  {
    textSize(20);
    fill(0);
    text("Move Cursor to Circle to Begin", 100, 450);
    noFill();
    stroke(random(255), random(255), random(255));
    ellipse(250, 250, 20, 20);
    if (xPos == 250 && yPos == 250)
    {
      begin = millis();
      duration = 20;
      time = 20;
      gameRunning = true;
      gameEnd = false;
    }
  }

  if (gameRunning && !gameEnd)
  {
    if (time > 0)
    {
      time = duration - (millis()-begin)/1000;
      textSize(50);
      text(time, 130, 495);
    }
    if (time <= 0)
    {
      gameEnd = true;
    }
    textSize(50);
    text(score, 250, 50);
    if (!targetMade)
    {
      makeNew();
    }
    makeCircleTarget(targetX, targetY, radius);

    if (xPos >= targetX - radius && xPos <= targetX + radius && yPos >= targetY - radius && yPos <= targetY + radius)
    {
      score++;
      targetMade = false;
      duration += 0.3;
      myPort.write(1);
    }
    if (keyPressed)
    {
      if (key == 'q')
      {
        score = 0;
        time = 20;
        duration = 20;
        gameEnd = false;
        gameRunning = false;
        state = "select";
      }
    }
  }
  if (gameEnd)
  {
    gameEnd();
  }
}

void makeNew()
{
  radius = int(random(20, 50));
  targetX = int(random(50+radius, 450-radius));
  targetY = int(random(50+radius, 450-radius));

  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  fill(r, g, b);
  stroke(r, g, b);
  targetMade = true;
}

void makeCircleTarget(int x, int y, int r)
{
  circle(x, y, r);
}

void gameEnd()
{ 
  background(#FFCA01);

  fill(255);
  stroke(0);
  player.setFill(color(255));
  shape(player);

  fill(0);
  textSize(100);
  text("SCORE", 100, 100);
  int r = int(random(30, 80));
  int g = int(random(20, 40));
  int b = int(random(120, 255));
  fill(r, g, b);
  text(score, 200, 250);

  fill(255);
  noStroke();
  ellipse(200, 350, 70, 70);
  fill(0);
  textSize(50);
  text("RESTART", 250, 370);

  fill(0);
  ellipse(200, 450, 70, 70);
  fill(255);
  textSize(50);
  text("QUIT", 250, 470);

  if (xPos >= 130 && xPos <= 270 && yPos >= 280 && yPos <= 420)
  {
    score = 0;
    begin = millis();
    time = 20;
    duration = 20;
    gameEnd = false;
    gameRunning = true;
  }
  if (xPos >= 130 && xPos <= 270 && yPos >= 380 && yPos <= 520)
  {
    score = 0;
    time = 20;
    duration = 20;
    gameEnd = false;
    gameRunning = true;
    state = "menu";
  }

  if (score > highScore)
  {
    highScore = score;
  }
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

    if (serialCount > 1)
    {
      xPos = int(map(serialInArray[0], 0, 255, 0, 500)); // Set X position of player to the first value recieved
      yPos = int(map(serialInArray[1], 0, 255, 0, 500)); // Set Y position of player to the second value recieved

      // Request more data from arduino by sending a byte back and reset serialCount
      myPort.write('A');
      serialCount = 0;
    }
  }
}
