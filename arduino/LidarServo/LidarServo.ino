#include <I2C.h>
#include <Servo.h> 
#define    LIDARLite_ADDRESS   0x62          // Default I2C Address of LIDAR-Lite.
#define    RegisterMeasure     0x00          // Register to write to initiate ranging.
#define    MeasureValue        0x04          // Value to initiate ranging.
#define    RegisterHighLowB    0x8f          // Register to get both High and Low bytes in 1 call.

// HOW TO WIRE
// Specific to the cable I soldered to my personal servo and Lidar

// SOLID   ORANGE     GND
// STRIPED ORANGE     5V

// SOLID   BLUE       Pin 13 - Servo Signal

// SOLID   GREEN      Pin 16 - Lidar SCL
// STRIPED GREEN      Pin 17 - Lidar SDA

Servo myservo;
int pos = 0;
int range = 0;

int STARTANGLE = 45;
int ENDANGLE = 135;

void setup() {
  Serial.begin(9600); //Opens serial connection at 9600bps.
  I2c.begin(); // Opens & joins the irc bus as master
  delay(100); // Waits to make sure everything is powered up before sending or receiving data
  I2c.timeOut(50); // Sets a timeout to ensure no locking up of sketch if I2C communication fails
  
  myservo.attach(13);
}

int getLidarRange(){
  // Write 0x04 to register 0x00
  uint8_t nackack = 100; // Setup variable to hold ACK/NACK resopnses
  while (nackack != 0) { // While NACK keep going (i.e. continue polling until sucess message (ACK) is received )
    nackack = I2c.write(LIDARLite_ADDRESS, RegisterMeasure, MeasureValue); // Write 0x04 to 0x00
    delay(1); // Wait 1 ms to prevent overpolling
  }

  byte distanceArray[2]; // array to store distance bytes from read function

  // Read 2byte distance from register 0x8f
  nackack = 100; // Setup variable to hold ACK/NACK resopnses
  while (nackack != 0) { // While NACK keep going (i.e. continue polling until sucess message (ACK) is received )
    nackack = I2c.read(LIDARLite_ADDRESS, RegisterHighLowB, 2, distanceArray); // Read 2 Bytes from LIDAR-Lite Address and store in array
    delay(1); // Wait 1 ms to prevent overpolling
  }
  int distance = (distanceArray[0] << 8) + distanceArray[1];  // Shift high byte [0] 8 to the left and add low byte [1] to create 16-bit int
  return distance;
}

void spinAndScan(int pos){
  // move servo to position
  myservo.write(pos);

  //scan and print distance
  range = getLidarRange();
  Serial.print("range: ");
  Serial.print(range);
  Serial.print(" pos: ");
  Serial.println(pos - 90);
}
  

void loop() { 
  for(pos = STARTANGLE; pos < ENDANGLE; pos += 1){
    spinAndScan(pos);
  }
  for(pos = ENDANGLE; pos>=STARTANGLE; pos-=1){
    spinAndScan(pos);
  }
}

