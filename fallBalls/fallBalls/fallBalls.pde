
int numBalls = 12;
float spring = 0.05;
float gravity = 0.3;
float friction = -0.9;
float elasticity = 1;

ArrayList<Ball> ballArray = new ArrayList<Ball>();
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
    ball.display();
    ball.id = ballArray.indexOf(ball);
  }
  
  ballAdd.show();
  ballRemove.show();
  startButton.show();
  if(ballAdd.pressed() ){
    if(buttonCounter <= 0){
      buttonCounter = 15;
      addBall();
    }
  }
  if(ballRemove.pressed()){
    if(buttonCounter <= 0){
      buttonCounter = 15;
      ballArray.remove(ballArray.size()-1);
    
    }
    if(ballArray.size()<=1){
      addBall();
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
  Ball newBall = new Ball(rand1, rand2, rand3, ballArray.size()-1);
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
