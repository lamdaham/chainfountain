int numBalls = 12;
float spring = 0.05;
float gravity = 0.3;
float friction = -0.9;
float elasticity = 0;
Ball[] balls = new Ball[numBalls];
Button bom = new Button(300, 340, 300, 340, "Bread");

void setup() {
  size(640, 640);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 40), i, balls);
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
  bom.show();
  if(mousePressed){
    print(bom.pressed());
  }
  
}
