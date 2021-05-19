// Mamadou Diallo - Midterm 

String state;

//Bird info
color birdieWingB = color(46,57,231);
color birdieWingG = color(249,166,2);
int birdX = 0;
boolean center = false;
boolean body = true;
boolean wings = false;
int red;
int green;
int blue;

//Tap Tap stuff
boolean gameRunning = false;
boolean gameEnd = false;
int score = 0;
int highScore = 0;
boolean targetMade = false;
int radius;
int targetX;
int targetY;
float begin;
float duration = 10;
float time = 30;

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
  strokeWeight(2);
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
  background(150); // change background to white  
  
  makeBird();
  
  if(!center)
  {
    text("Use A and D to move the bird \nto the middle of the screen", 30, 400);  
  }
  else
  {
    UI();
  }
  if(birdX <= -140)
  {
    center = true; 
  }
  else if(birdX >= 36)
  {
   birdX = 36;
  }

  if(keyPressed)
  {
    if(key == 'q')
    {
       state = "select";
    }
    if(key == 'a' && !center)
    {
     birdX -= 1; 
    }
    if(key == 'd' && !center)
    {
     birdX += 1; 
    }
    if(key == 'l')
    {
     print(birdX); 
    }
  }
  
  if(mousePressed)
  {
   if(mouseX >= 180 && mouseX <= 200 && mouseY >= 450 && mouseY <= 470)
   {
    body = !body; 
    wings = !wings;
   }
   if(mouseX >= 300 && mouseX <= 320 && mouseY >= 450 && mouseY <= 470)
   {
    body = !body; 
    wings = !wings;
   }
  }
}

void makeBird()
{
  //Birdie Start
  fill(birdieWingB);
  noStroke();
  circle(442+birdX,157,35);
  //Eye
  fill(0);
  circle(452+birdX,157,6);
  triangle(449+birdX,156,453+birdX,154,449+birdX,152);
  triangle(451+birdX,159,455+birdX,157,454+birdX,162);
  fill(255,255,255);
  circle(451+birdX,155,2);
  //Beak
  fill(birdieWingB);
  triangle(457+birdX,164,454+birdX,167,464+birdX,174);
  triangle(455+birdX,167,451+birdX,170,460+birdX,177);
  //Chin thing
  fill(birdieWingG);
  circle(446+birdX,167,13.25);
  //Wing 1- Gold
  triangle(420+birdX,105,413+birdX,134,409+birdX,94);
  triangle(420+birdX,105,413+birdX,134,424+birdX,111);
  triangle(434+birdX,121,413+birdX,134,424+birdX,111);
  triangle(434+birdX,121,413+birdX,134,438+birdX,132);
  triangle(440+birdX,140,413+birdX,134,438+birdX,132);
  triangle(413+birdX,134,398+birdX,170,382+birdX,176);
  triangle(442+birdX,144,440+birdX,156,413+birdX,134);
  triangle(440+birdX,139,442+birdX,144,413+birdX,134);
  triangle(413+birdX,134,440+birdX,156,397+birdX,171);
  triangle(440+birdX,165,440+birdX,170,397+birdX,170);
  triangle(440+birdX,170,439+birdX,173,397+birdX,170);
  triangle(440+birdX,155,436+birdX,159,397+birdX,170);
  triangle(436+birdX,159,438+birdX,162,397+birdX,170);
  triangle(440+birdX,165,438+birdX,162,397+birdX,170);
  triangle(397+birdX,170,419+birdX,199,442+birdX,173);
  triangle(419+birdX,199,397+birdX,170,368+birdX,215);
  triangle(368+birdX,215,375+birdX,224,419+birdX,199);
  triangle(368+birdX,215,375+birdX,224,360+birdX,220);
  triangle(346+birdX,234,375+birdX,224,360+birdX,220);
  
  //Birdie's Feet
  fill(211,186,137);
  triangle(418+birdX,199,397+birdX,211,417+birdX,204);
  triangle(417+birdX,204,409+birdX,210,397+birdX,211);
  triangle(397+birdX,211,409+birdX,210,404+birdX,213);
  triangle(404+birdX,213,410+birdX,212,409+birdX,210);
  fill(71,58,36); 
  quad(409+birdX,210,417+birdX,204,420+birdX,205,410+birdX,212);
  quad(410+birdX,212,417+birdX,211,424+birdX,205,420+birdX,205);
  quad(417+birdX,211,424+birdX,211,429+birdX,208,424+birdX,205);
  quad(424+birdX,211,431+birdX,211,434+birdX,208,429+birdX,208);
  quad(431+birdX,211,434+birdX,208,440+birdX,208,440+birdX,211);
  quad(440+birdX,208,443+birdX,208,443+birdX,211,440+birdX,211);
  quad(430+birdX,211,440+birdX,211,437+birdX,213,432+birdX,213);
  triangle(440+birdX,211,437+birdX,213,441+birdX,214);
  quad(413+birdX,216,418+birdX,216,424+birdX,211,417+birdX,211);
  quad(417+birdX,216,413+birdX,216,412+birdX,218,414+birdX,217);
  triangle(412+birdX,218,414+birdX,218,414+birdX,220); 
  
  //Tail
  fill(birdieWingB);
  quad(352+birdX,217,360+birdX,220,352+birdX,228,345+birdX,222);
  quad(345+birdX,222,349+birdX,223,304+birdX,254,301+birdX,252);
  triangle(295+birdX,257,304+birdX,254,301+birdX,252);
  quad(348+birdX,225,352+birdX,228,312+birdX,270,310+birdX,267);
  triangle(352+birdX,217,360+birdX,220,369+birdX,215);
  quad(369+birdX,215,352+birdX,217,387+birdX,178,395+birdX,175);
  
  //Back
  quad(395+birdX,175,398+birdX,170,382+birdX,176,373+birdX,183);
  quad(392+birdX,81,391+birdX,164,413+birdX,134,409+birdX,94);
  quad(391+birdX,157,391+birdX,165,382+birdX,176,378+birdX,179);
  triangle(370+birdX,71,392+birdX,95,392+birdX,81);
  
  //First Wing
  quad(381+birdX,100,372+birdX,84,378+birdX,79,392+birdX,96);
  quad(374+birdX,92,377+birdX,92,382+birdX,100,378+birdX,100);
  triangle(392+birdX,96,381+birdX,100,391+birdX,157);
  quad(378+birdX,120,385+birdX,118,386+birdX,124,378+birdX,122);
  quad(380+birdX,120,378+birdX,110,383+birdX,110,385+birdX,118);
  triangle(380+birdX,120,378+birdX,110,374+birdX,112);
  quad(374+birdX,101,378+birdX,110,383+birdX,109,382+birdX,100);
  
  //Other Wing
  quad(380+birdX,121,396+birdX,129,396+birdX,151,380+birdX,178);
  quad(380+birdX,178,373+birdX,176,372+birdX,184,379+birdX,179);
  triangle(380+birdX,122,380+birdX,178,373+birdX,176);
  quad(365+birdX,180,373+birdX,176,380+birdX,122,371+birdX,119);
  quad(367+birdX,158,358+birdX,150,364+birdX,116,371+birdX,119);
  quad(347+birdX,147,358+birdX,150,364+birdX,116,355+birdX,113);
  quad(334+birdX,135,343+birdX,110,355+birdX,113,347+birdX,147);
  quad(308+birdX,119,326+birdX,104,343+birdX,110,334+birdX,135);
  quad(295+birdX,115,302+birdX,103,326+birdX,104,308+birdX,119);
  triangle(295+birdX,115,302+birdX,103,274+birdX,103);
  triangle(363+birdX,154,368+birdX,158,363+birdX,166);
  triangle(361+birdX,152,363+birdX,154,362+birdX,159);
  triangle(357+birdX,149,361+birdX,152,359+birdX,154);
  //Birdie Complete 
}

void UI()
{
  if(mousePressed)
  {
     if(mouseY >= 310 && mouseY <= 330)
     {
      red = mouseX;
      if(mouseX <= 130)
      {
       red = 130; 
      }
      if(mouseX >= 370)
      {
       red = 370; 
      }
     }
     else if(mouseY >= 350 && mouseY <= 370)
     {
       green = mouseX;
       if(mouseX <= 130)
      {
       green = 130; 
      }
      if(mouseX >= 370)
      {
       green = 370; 
      }
     }
     else if(mouseY >= 390 && mouseY <= 410)
     {
       blue = mouseX;
       if(mouseX <= 130)
      {
       blue = 130; 
      }
      if(mouseX >= 370)
      {
       blue = 370; 
      }
     }
  }
   stroke(0);
   strokeWeight(5);
   line(100,0,100,500);
   line(400,0,400,500);
   line(0,300,500,300);
   noStroke();
   
   fill(map(red,130,270,0,255), 0,0);
   rect(130,310,240,20);
   fill(0,map(green,130,370,0,255),0);
   rect(130,350,240,20);
   fill(0,0,map(blue,130,370,0,255));
   rect(130,390,240,20);
    
   stroke(255);
   line(red,310,red,330);
   line(green,350,green,370);
   line(blue,390,blue,410);
   
   textSize(12);
   fill(0);
   text('R',110,325);
   text('G',110,365);
   text('B',110,405);
   
   text("Q to exit", 10,20);
    
   stroke(0);
   if(body)
   {
    fill(0);
    noStroke();
   }
   else
   {
     noFill();
     stroke(0);
   }
   rect(180,450,20,20);
   if(wings)
   {
    fill(0);
    noStroke();
   }
   else
   {
    noFill();
    stroke(0);
   }
   rect(300,450,20,20);
   rect(230,450,40,20);
    
   text("Body", 180,490);
   text("Wings", 300,490);  
   text("Change", 230,490);
}

void game()
{
  if(!gameRunning && !gameEnd)
  {
   textSize(45);
   text("Press S to start game",20,250);
   
   textSize(20);
   text("Press Q to quit", 200,400);   
   if(keyPressed && key == 's')
   {
     begin = millis();
    gameRunning = true; 
   }
   if(keyPressed && key == 'q')
   {
   state = "select";
   }
  }
  if(gameRunning && !gameEnd)
  {
    if(time > 0)
    {
     time = duration - (millis() - begin)/1000;
     textSize(70);
     text(time,130,495);
    }
    if(time <= 0)
    {
     gameEnd = true;
    }
  textSize(50);
  text(score, 250,50);
  if(!targetMade)
  {
   makeNew(); 
  }
   makeCircleTarget(targetX,targetY,radius); 
  
  if(mouseX >= targetX - radius && mouseX <= targetX + radius && mouseY >= targetY - radius && mouseY <= targetY + radius && mousePressed)
  {
    score++;
   targetMade = false;
   duration += 0.3;
  }
  if(keyPressed)
  {
     if(key == 'q')
     {
       score = 0;
       time = 20;
       duration = 10;
       gameEnd = false;
       gameRunning = false;
       state = "select";
     }
  }
  }
  if(gameEnd)
  {
    gameEnd();
  }
}

void makeNew()
{
 radius = int(random(20,50));
 targetX = int(random(50,475));
 targetY = int(random(50,475));
 fill(random(255),random(255),random(255));

  targetMade = true;
}
void makeCircleTarget(int x, int y,int r)
{
 circle(x,y,r); 
}

void gameEnd()
{
  background(200);
  fill(0);
  textSize(100);
  text("SCORE", 100, 100);
   int r = int(random(30,80));
  int g = int(random(20,40));
  int b = int(random(120,255));
  fill(r,g,b);
  text(score, 200,250);
  
  fill(0);
  textSize(20);
  text("Press S to restart",120,470);
  text("Press Q to exit", 120, 490);
  text("HIGH SCORE: " + highScore, 10,300); 
  if(keyPressed && key == 's')
  {
   score = 0;
   begin = millis();
   time = 20;
   duration = 10;
   gameEnd = false;
   gameRunning = true;
  }
  if(keyPressed && key == 'q')
  {
   score = 0;
   time = 20;
   duration = 10;
   gameEnd = false;
   gameRunning = false;
   state = "select"; 
  }

 if(score > highScore)
 {
  highScore = score; 
 }
}

void mouseClicked()
{
  if(state == "birdie")
  {
    if(mouseX >= 230 && mouseX <= 270 && mouseY >= 450 && mouseY <= 470)
    {
      if(body)
      {
        birdieWingG = color(map(red,130,270,0,255),map(green,130,270,0,255), map(blue,130,270,0,255));
      }
      if(wings)
      {
        birdieWingB = color(map(red,130,270,0,255),map(green,130,270,0,255), map(blue,130,270,0,255));

      }
    }
  }
}
