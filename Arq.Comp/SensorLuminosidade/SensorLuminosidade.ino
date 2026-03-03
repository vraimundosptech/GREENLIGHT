const int PINO_SENSOR_LDR = A3;
float valorLuminosidade;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int valorLuminosidade = analogRead(PINO_SENSOR_LDR);

  Serial.print("Min:200,Max:800,Luminosidade:");
  Serial.println(valorLuminosidade);

  delay(2000);
}