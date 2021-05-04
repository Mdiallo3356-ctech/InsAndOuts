//Receives data over Serial port from Processing to control 2 LEDS
//Hook up LEDs to pins 10 and 8;


byte val; // stores data received from serial port
const int LED1 = 10; // variable for which pin
const int LED2 = 6; // variable for which pin


void setup() {
  pinMode(LED1, OUTPUT); // set pin as output
  pinMode(LED2, OUTPUT); // set pin as output
  Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {
  if (Serial.available()) { // If data is available to read
    val = Serial.read(); // read it and store it in val
  }
  if (val == 0) { // If 0 received
    for(int br = 0; br <= 255; br += 5)
    {
      analogWrite(LED1, br);
      delay(10);
    }
    for(int br = 0; br <= 135; br += 5)
    {
      analogWrite(LED2, br);
      delay(10);
    }
    for(int br = 255; br >= 0; br -= 5)
    {
      analogWrite(LED1, br);
      delay(10);
    }
    for(int br = 135; br <= 255; br += 5)
    {
      analogWrite(LED2, br);
      delay(10);
      if(br == 255)
      {
        delay(2000);
        digitalWrite(LED2, LOW);
      }
    }
  }
  else if (val == 1) { // If 1 received
    for(int br = 0; br <= 255; br += 5)
    {
      analogWrite(LED1, br);
      delay(10);
    }
    for(int br = 255; br >= 0; br -= 5)
    {
      analogWrite(LED1, br);
      delay(10);
    }
    for(int br = 0; br <= 255; br += 5)
    {
      analogWrite(LED2, br);
      delay(10);
    }
    for(int br = 255; br >= 0; br -= 5)
    {
      analogWrite(LED2, br);
      delay(10);
    }
  }
  delay(10); // Wait 10 milliseconds
}
