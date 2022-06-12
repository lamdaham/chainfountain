
int numBalls = 12;
float spring = 0.05;
float gravity = 0.3;
float friction = -0.9;
float elasticity = 0;

ArrayList<Ball> ballArray = new ArrayList();


Ball[] balls = new Ball[numBalls];
final int WIDTH=640;
final int HEIGHT=640;
<<<<<<< HEAD
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
=======

void setup() {
  size(1080, 1080);
  for (int i = 0; i < numBalls; i++) {
    ballArray.add(new Ball(random(width), random(height), random(30, 40), i));
>>>>>>> 8a6a3d944ac2f11d43120bf77c9cdb9e43e2a444
  }
  start=false;
  
  
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
          
          BallA.vx += collisionA * xCollision;
          BallA.vy += collisionA * yCollision;
          BallB.vx -= collisionB * xCollision;
          BallB.vy -= collisionB * yCollision;
        }
      }
    }
  }
}


void draw() {
<<<<<<< HEAD
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
=======
  background(0);
  collide();
  rect(0, 0, 640, 640);
  for (Ball ball : ballArray) {
  
    ball.move();
>>>>>>> 8a6a3d944ac2f11d43120bf77c9cdb9e43e2a444
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
