const int RED = 11;
const int WHITE = 10;
const int GREEN = 9;
const int BLUE = 6;

int red = 0;
int white = 0;
int green = 0; 
int blue = 0; 
void setup() {
  // put your setup code here, to run once:
  pinMode(LED_GREEN, OUTPUT);
  pinMode(LED_RED, OUTPUT);
  pinMode(LED_BLUE, OUTPUT);
  pinMode(LED_WHITE, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  // Pattern 1
  // red to half, blue to half, white to full, green to full
  // red to full, blue to full, , white to 0, green to 0
  // red to 0, blue to 0
  for(int half = 0; half < 127; half += 10)
  {
    analogWrite(RED, half);
    analogWrite(BLUE, half);
    delay(30);
  }
  delay(1000);
   for(int full = 0; full < 255; full += 10)
  {
    analogWrite(WHITE, full);
    analogWrite(GREEN, full);
    delay(10);
  }
  delay(1000);
   for(int full = 130; full < 255; full += 10)
  {
    analogWrite(RED, full);
    analogWrite(BLUE, full);
    delay(30);
  }
  delay(1000);
   for(int mt = 255; mt > 0; mt -= 10)
  {
    analogWrite(RED, mt);
    analogWrite(BLUE, mt);
    delay(10);
  }
  delay(1000);
  for(int mt = 255; mt > 0; mt -= 10)
  {
    analogWrite(WHITE, mt);
    analogWrite(GREEN, mt);
    delay(10);
  }
  delay(1000);
  
}
