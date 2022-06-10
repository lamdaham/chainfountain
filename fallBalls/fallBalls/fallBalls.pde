int numBalls = 12;
float spring = 0.05;
float gravity = 0.3;
float friction = -0.9;
float elasticity = 0;
Ball[] balls = new Ball[numBalls];
//Button bom = new Button(300, 340, 300, 340, "Bread");
final int WIDTH=640;
final int HEIGHT=640;
void setup() {
  size(1080, 1080);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(WIDTH), random(HEIGHT), random(30, 40), i, balls);
  }
  noStroke();
  fill(255, 204);
  
  
}

void draw() {
  rect(0, 0, 640, 640);
  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display();  
  }
  bom.show();
  //if(mousePressed){
  //  print(bom.pressed());
  //}
  
}
