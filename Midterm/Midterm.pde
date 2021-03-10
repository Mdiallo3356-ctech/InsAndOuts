// Mamadou Diallo
// Midterm Presentation

String state;
void setup()
{
  size(500, 500);
  state = "select";
}

void draw()
{
  background(#FFCA01);
  if(state == "select")
  {
   selectMenu(); 
  }
  else if(state == "birdie")
  {
    birdie();
  }
  else if(state == "game")
  {
    game();
  }
}

void selectMenu()
{
  stroke(0);
  fill(#AF0FE6);
  rect(0,50,width,100);
  rect(0,200,width,100);
  
  fill(180);
  rect(0,350,width,100);
  
  fill(255);
  textSize(100);
  text("BIRDIE",100,140);
  text("TAP TAP",50,290);
  textSize(30);
  text("COMING SOON",150,410);
  
  // Creating Power Button 
  fill(200,30,20);
  rect(230, 475,40,20);
  noFill();
  stroke(255);
  ellipse(250,485,15,15);
  
  if(mousePressed)
  {
    // If the power button is pressed, close the program
     if(mouseX >= 230 && mouseX <= 270 && mouseY >= 475 && mouseY <= 495)
     {
       exit(); 
     }
     
     // Go to selected scenes depending on what option is pressed
     if(mouseY >= 50 && mouseY <= 150)
     {
       state = "birdie";  
     }
     
     if(mouseY >= 200 && mouseY <= 350)
     {
       state = "game"; 
     }
     
     
     
  }

  
}

void birdie()
{
  background(255); // change background to white
  if(mousePressed)
  {
     state = "select" ;
  }
}

void game()
{
  if(keyPressed)
  {
     if(key == 'q')
     {
      state = "select";
     }
  }
}
