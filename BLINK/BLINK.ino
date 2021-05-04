const int LED = 11;
unsigned long interval = 1000;

unsigned long previousMillis = 0;
int ledState = LOW;


void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  unsigned long currentMillis = millis();
  if(currentMillis - previousMillis >= interval)
  {
    previousMillis = currentMillis;
    if(ledState == LOW)
    {
      ledState = HIGH;
      interval = 2b 00;
    }
    else
    {
      ledState = LOW;
      interval = 4000;
    }
  }
  digitalWrite(LED, ledState);
}
