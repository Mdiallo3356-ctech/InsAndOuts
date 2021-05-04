#define SENSOR1 A0 //photocell
#define SENSOR2 A1 // potentiometer
#define SENSOR3 8 // push button

//track values from our sensors
int sensor1Val = 0;
int sensor2Val = 0;
//int sensor3Val = 0;


int inByte = 0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  while(!Serial)
  {
    delay(10);
  }

  //pinMode(SENSOR3, INPUT_PULLUP);
  establishContact();
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 0)
  {
    inByte = Serial.read();

    sensor1Val = analogRead(SENSOR1)/4;
    delay(10);

    sensor2Val = analogRead(SENSOR2)/4;
    delay(10);

    //sensor3Val = map(digitalRead(SENSOR3), 0, 1, 0, 255);

    Serial.write(sensor1Val);
    Serial.write(sensor2Val);
    //Serial.write(sensor3Val);
  }
}

void establishContact() 
{
  if(Serial.available() <= 0)
  {
    Serial.print('A');
    delay(300);
  }
}
