//const int BUTTON = 2;
const int GREEN = 4;
const int LED_RED = 7;
const int PIEZO = 6;

const int X_POT = A0;
const int Y_POT = A1;

int x_value;
int y_value;

int inByte = 0;

int period = 500;
unsigned long current_time;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  while(!Serial)
  {
    ;
  }

 // pinMode(BUTTON, INPUT);
  pinMode(GREEN, OUTPUT);
  pinMode(LED_RED, OUTPUT);
  pinMode(PIEZO, OUTPUT);
  pinMode(X_POT, INPUT);
  pinMode(Y_POT, INPUT);

  establishContact();
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 0)
  {
    inByte = Serial.read();
    if(inByte == 1) // if target is hit
    {
      digitalWrite(GREEN, HIGH);
      tone(PIEZO, 400,500);
      current_time = millis();

    }
    else if (inByte == 2) // if target is missed
    {
      digitalWrite(LED_RED, HIGH);
      tone(PIEZO, 100,500);
      current_time = millis();
    }
    else{}
  }
  if(millis() > current_time + period)
      {
        digitalWrite(GREEN, LOW);
        digitalWrite(LED_RED, LOW);
      }

  x_value = int(map(analogRead(X_POT),0,1024,0,255));
  y_value = int(map(analogRead(Y_POT),0,1024,0,255));

  Serial.write(x_value);
  Serial.write(y_value);
}

void establishContact()
{
  while(Serial.available() <= 0)
  {
    Serial.print('A');
    delay(300);
  }
}
