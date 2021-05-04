#define BUZZER 5
// const int buzzer = 5;

int val = 0;
int freq = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode(BUZZER, OUTPUT);
  Serial.begin(9600);

}

void loop() {

       if(Serial.available())
       {
          val = Serial.read();
          delay(10);
       }
       freq = map(val, 0, 255, 100, 1500);
       tone(BUZZER, freq, 10);
       delay(1);
}
