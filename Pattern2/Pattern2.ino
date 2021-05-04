// Creating 2 unique LED patterns using button

const int GREEN = 11;
const int WHITE = 10;
const int RED = 9;
const int BLUE = 6;

bool patternOn = false;
bool increasing = true;

const int buttonPin = 2;

int buttonState = LOW;
int lastButtonState = LOW;


void setup() {
  // put your setup code here, to run once:
  pinMode(buttonPin, INPUT);
  pinMode(GREEN, OUTPUT);
  pinMode(WHITE, OUTPUT);
  pinMode(RED, OUTPUT);
  pinMode(BLUE, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  buttonState = digitalRead(buttonPin);
  delay(10);

  if (buttonState == HIGH && lastButtonState == LOW)
  {
    patternOn = !patternOn;
  } else { // do nothing
  }


  if (!patternOn)
  {
    unsigned long currentMillis = millis();
    unsigned long previousMillis = 0;
    unsigned long interval = 100;
    if(increasing)
    {
      for (int brightness = 0; brightness <= 120; brightness += 10)
      {
        currentMillis = millis();
        if (currentMillis - previousMillis >= interval)
        {
          previousMillis = currentMillis;
          analogWrite(GREEN, brightness);
          analogWrite(WHITE, brightness);
          analogWrite(RED, brightness);
          analogWrite(BLUE, brightness);
        }
        if(brightness == 120)
        {
          increasing = false;
        }
      } 
    }
    else
    {
      for (int brightness = 120; brightness >= 0; brightness -= 10)
      {
        currentMillis = millis();
        if (currentMillis - previousMillis >= interval)
        {
          previousMillis = currentMillis;
          analogWrite(GREEN, brightness);
          analogWrite(WHITE, brightness);
          analogWrite(RED, brightness);
          analogWrite(BLUE, brightness);
        }
        if(brightness == 0)
        {
          increasing = true;
        }
      }
    }

  }
}
