const int LED = 10;
byte val; // Stores data recieved from processing

void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if(Serial.available()) // If data is available
  {
    val = Serial.read(); //  read values
  }

  analogWrite(LED, val);
  delay(10);
}
