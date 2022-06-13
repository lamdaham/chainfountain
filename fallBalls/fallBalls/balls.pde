import java.util.*;

class Ball {
  
  float x, y;
  float radius;
  float vx = 0;
  float vy = 0;
  int id;
  double mass;
  int colors;
  
  arrow varrow = new arrow(x, y, 10* Math.sqrt(vx * vx + vy * vy), -1*Math.atan2(vy, vx));
 
  Ball(float xin, float yin, float din, int idin) {
    x = xin;
    y = yin;
    radius = din;
    id = idin;
    mass = radius *radius / 20;
    colors = 255;
  }
  
  Ball(float xin, float yin, float din, int idin, int c) {
    x = xin;
    y = yin;
    radius = din;
    id = idin;
    mass = radius *radius / 20;
    colors = c;
  } 
  
  
  
  void move() {
    x += vx;
    y += vy;
    if (x<radius) {
      vx  = -1 * vx;
      x=radius;
    } else if (x > WIDTH-radius) {
      vx  = -1 * vx;
      x=(WIDTH-radius);
    }
    
    if (y< HEIGHT - radius) {
      vy += gravity;
      y += vy;
    }
     if (y > HEIGHT - radius) {
        vy = -1 * vy;
        y =HEIGHT-radius;
     } else if (y<radius) {
        vy = -1 * vy;
        y=radius;
     }
    varrow = new arrow(x, y, 10*Math.sqrt(vx * vx + vy * vy), Math.atan2(vy, vx));
  }
  
  void display() {
    fill(colors);
    stroke(0);
    ellipse(x, y, radius*2, radius*2);
    varrow.display();
  }
  
  
}
