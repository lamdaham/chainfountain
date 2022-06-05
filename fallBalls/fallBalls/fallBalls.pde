int numBalls = 12;
float spring = 0.05;
float gravity = 3;
float friction = -0.9;
float elasticity = 1;
Ball[] balls = new Ball[numBalls];

void setup() {
  size(640, 360);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
  noStroke();
  fill(255, 204);
}

void draw() {
  background(0);
  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display();  
  }
  System.out.println(mouseX + "," + mouseY);
}
