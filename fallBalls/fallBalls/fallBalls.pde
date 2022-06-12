
int numBalls = 12;
float spring = 0.05;
float gravity = 0.3;
float friction = -0.9;
float elasticity = 0;
Ball[] balls = new Ball[numBalls];
final int WIDTH=640;
final int HEIGHT=640;
boolean start = false;
Button ballAdd = new Button(800, 100, 120, 30, "Add Ball");
Button ballRemove = new Button(800, 150, 120, 30, "Remove Ball");
Button startButton = new Button(800, 200, 120, 30, "Start Simulation");
final int FONTSIZE = 12;
int buttonCounter = 50;
void setup() {
  size(1080, 1080);
  for (int i = 0; i < numBalls; i++) {
    addBall(i);
  }
  start=false;
  
  
}

void draw() {
  fill(255);
  rect(0, 0, 640, 640);
  if(buttonCounter > -10){
    buttonCounter--;
  }
  for (Ball ball : balls) {
    if(start){
      ball.collide();
      ball.move();
    }
    ball.display();  
  }
    
  ballAdd.show();
  ballRemove.show();
  startButton.show();
  if(ballAdd.pressed() ){
    if(buttonCounter <= 0){
      buttonCounter = 15;
      numBalls++;
    }
  }
  if(ballRemove.pressed()){
    if(buttonCounter <= 0){
      buttonCounter = 15;
      numBalls--;
    
    }
  }
  if(startButton.pressed()){
    if(buttonCounter <= 0){
      buttonCounter = 15;
      start = !start;
    }
  }
  if(mousePressed){
    //print(mouseX, mouseY, startButton.xpos, startButton.ypos, startButton.pressed());
    //print("\n");
    
  }
}
void addBall(int place){
  float rand1 = random(WIDTH-80)+40;
  float rand2 = random(HEIGHT/4)+40;
  float rand3 = random(30,40);
  boolean ok = false;
  while(!ok){
    ok = true;
    rand1 = random(WIDTH-80)+40;
    rand2 = random(HEIGHT/4)+40;
    rand3 = random(30,40);
    print(place, rand1, rand2, "\n");
    for(int j = 0; j < place; j++){
      Ball i = balls[j];
      double dist = Math.sqrt(Math.pow(rand1-i.x, 2) + Math.pow(rand2-i.y,2));
      if(dist < i.radius+rand3){
        ok = false;
      }
    }
  }
  balls[place] = new Ball(rand1, rand2, rand3, place, balls);
}
