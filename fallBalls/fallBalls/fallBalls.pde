
int numBalls = 12;
float gravity = 0.3;
float elasticity = 1;

ArrayList<Ball> ballArray = new ArrayList<Ball>();
final int WIDTH=640;
final int HEIGHT=640;
boolean start = false;
Button ballAdd = new Button(660, 100, 120, 30, "Add Ball");
Button ballRemove = new Button(830, 100, 120, 30, "Remove Ball");
Button startButton = new Button(660, 20, 290, 60, "Start Simulation");
Button plusGravity = new Button(660, 150, 120, 30, "Increase Gravity");
Button minusGravity = new Button(830, 150, 120, 30, "Decrease Gravity");
Button increaseMass = new Button(660, 200, 120, 30, "Increase Ball Mass");
Button decreaseMass = new Button(830, 200, 120, 30, "Decrease Ball Mass");
Button increasexVel = new Button(660, 250, 120, 30, "Increase x-velocity");
Button decreasexVel = new Button(830, 250, 120, 30, "Decrease x-velocity");
Button increaseyVel = new Button(660, 300, 120, 30, "Increase y-velocity");
Button decreaseyVel = new Button(830, 300, 120, 30, "Decrease y-velocity");
final int FONTSIZE = 12;
int buttonCounter = 50;
Ball selectedBall;
void setup() {
  size(1000, 650);
  for (int i = 0; i < numBalls; i++) {
    addBall();
  }
  Ball ball = ballArray.get(0);
  ball.colors = 0;
}


void collide() {
  double xDist, yDist;
  
  for(int i = 0; i < ballArray.size(); i++) {
    Ball BallA = ballArray.get(i);
    for(int j = i + 1; j < ballArray.size(); j++) { 
      Ball BallB = ballArray.get(j);
      xDist = BallA.x - BallB.x;
      yDist = BallA.y - BallB.y;
      double distSquared = xDist * xDist + yDist * yDist;
      
      if(Math.sqrt(distSquared) <= (BallA.radius + BallB.radius) ) {
        double xVelocity = BallB.vx - BallA.vx;
        double yVelocity = BallB.vy - BallA.vy;
        double dotProduct = yDist * yVelocity + xDist * xVelocity;
        
        if(dotProduct > 0) {
          double collisionScale = dotProduct / distSquared;
          double xCollision = xDist * collisionScale;
          double yCollision = yDist * collisionScale;
          
          double combindedMass = BallA.mass + BallB.mass;
          double collisionA = 2 * BallB.mass / combindedMass;
          double collisionB = 2 * BallA.mass / combindedMass;
          
          BallA.vx += collisionA * xCollision * elasticity;
          BallA.vy += collisionA * yCollision * elasticity;
          BallB.vx -= collisionB * xCollision * elasticity;
          BallB.vy -= collisionB * yCollision * elasticity;
        }
      }
    }
  }
}


void draw() {
  background(200);
  fill(255);
  rect(0, 0, 640, 640);
  if(buttonCounter > -10){
    buttonCounter--;
  }
  collide();
  for (Ball ball : ballArray) {
    if(start){
      ball.move();
    }
    else{
      double dist = Math.sqrt(Math.pow(mouseX-ball.x, 2) + Math.pow(mouseY-ball.y,2));
      if(mousePressed && dist < ball.radius&& buttonCounter<=0){
        buttonCounter = 15;
        if(selectedBall == ball){
          selectedBall.colors = (int)random(100, 200);
          selectedBall = null;
        }
        else{
          if(selectedBall!= null){
            selectedBall.colors = (int)random(100, 200);
          }
          selectedBall = ball;
          selectedBall.colors = 255;
        }
      }
    }
    ball.display();
    ball.id = ballArray.indexOf(ball);
  }
  
  ballAdd.show();
  ballRemove.show();
  startButton.show();
  plusGravity.show();
  minusGravity.show();
  if(selectedBall != null){//////////////////HERE IS THE BUTTON BUTTONS
    increaseMass.show();
    decreaseMass.show();
    increasexVel.show();
    decreasexVel.show();
    increaseyVel.show();
    decreaseyVel.show();
  }
  if(ballAdd.pressed() ){
    if(buttonCounter <= 0){
      buttonCounter = 15;
      addBall();
      numBalls++;
    }
  }
  if(ballRemove.pressed()){
    if(buttonCounter <= 0){
      buttonCounter = 15;
      if(ballArray.size() >= 2){
        ballArray.remove(ballArray.size()-1);
        numBalls--;
      }
    
    }
    //if(ballArray.size()<=1){
    //  addBall();
    //}
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
  textAlign(LEFT);
  text("Gravity is " + gravity*32.7 + " meters per second", 650, 500);
  text("There are " + numBalls + " balls in the simulation", 650, 480);
  if(selectedBall != null){
    text("Ball mass is " + (int)selectedBall.mass + " kilograms", 650, 540);
    text("Ball's horizontal velocity is " + selectedBall.vx + "meters per second", 650, 560);
    text("Ball's vertical velocity is " + selectedBall.vy + "meters per second", 650, 580);
  }
}
void addBall(){
  float rand1 = random(WIDTH-80)+40;
  float rand2 = random(HEIGHT/4)+40;
  float rand3 = random(30,40);
  boolean ok = false;
  while(!ok){
    ok = true;
    rand1 = random(WIDTH-80)+40;
    rand2 = random(HEIGHT/4)+40;
    rand3 = random(30,40);
    for(Ball i : ballArray){
      double dist = Math.sqrt(Math.pow(rand1-i.x, 2) + Math.pow(rand2-i.y,2));
      if(dist < i.radius+rand3){
        ok = false;
      }
    }
  }
  Ball newBall = new Ball(rand1, rand2, rand3, ballArray.size()-1, (int)random(100,200));
  ballArray.add(newBall);
}

void keyPressed() {
  Ball ball = ballArray.get(0);
  if (keyCode == LEFT) {
    if (ball.vx > -30 || ball.vx == 0) {
      ball.vx -= 20;
    }
  }
  
  if (keyCode == RIGHT) {
    if (ball.vx < 30 || ball.vx == 0) {
      ball.vx += 20;
    }
  }
  

}
