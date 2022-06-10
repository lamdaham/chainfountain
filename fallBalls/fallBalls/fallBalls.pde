int numBalls = 12;
float spring = 0.05;
float gravity = 0.3;
float friction = -0.9;
float elasticity = 0;
ArrayList<Ball> ballArray = new ArrayList();

void setup() {
  size(640, 640);
  for (int i = 0; i < numBalls; i++) {
    ballArray.add(new Ball(random(width), random(height), random(30, 40), i));
  }
  noStroke();
  fill(255, 204);
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
  background(0);
  collide();
  for (Ball ball : ballArray) {
    ball.move();
    ball.display();  
  }
  
}
