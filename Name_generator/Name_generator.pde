String[]names = {"Paola", "Zarina","Mamadou","Paolo","Harrison","Arash", "Sahan", 
"Steven", "Mohamed", "Camille", "Karla", "Cody", "Shanice", "Max", "Ling Mei"};

String [] usedNames;
void setup()
{
 size(500,500);
 textSize(30);
 textAlign(CENTER);
 fill(255);
}

void draw()
{
  // If the user presses their mouse. The background changes color and a name is shown
  if(mousePressed)
  {
    background(int(random(255)), int(random(255)), int(random(255)));
    String name = names[int(random(names.length))];
    if(name != " ")
    {
      text(name, width/2, height/2);
    }
     
  }
}
