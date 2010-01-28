#include <Servo.h> 

int leftPin = 2;
int rightPin = 3;

Servo left;  // create servo object to control a servo 
Servo right;  // create servo object to control a servo 

boolean leftWhisker = false;
boolean rightWhisker = false;

void setup() 
{ 
  left.attach(9); 
  right.attach(10);
  attachInterrupt(0, bumpLeft, CHANGE);
  attachInterrupt(1, bumpRight, CHANGE);
} 


void loop() 
{ 
  if(leftWhisker && rightWhisker){
    go(-90);
  }else if(leftWhisker || rightWhisker){
    if(leftWhisker){
      turnRight();
    }else{
      turnLeft();
    }
  }else{
    go(90);
  }
  delay(1000);
}

void bumpLeft(){  
  leftWhisker = !digitalRead(leftPin);
}

void bumpRight(){
  rightWhisker = !digitalRead(rightPin);
}

void go(int wheelSpeed){
  int leftSpeed = 90 + wheelSpeed;
  int rightSpeed = 90 - wheelSpeed;
  left.write(leftSpeed);
  right.write(rightSpeed);
}

void forward(){
  go(-10);
}

void turnRight(){
  left.write(120);
  right.write(120);
}

void turnLeft(){
  left.write(50);
  right.write(50);
}

void wheelStop(){
  left.write(90);
  right.write(90);
}

