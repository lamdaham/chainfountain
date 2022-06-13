public class arrow {
  
  float cx,cy;
  double len;
  double angle;
 
  
  arrow(float cx, float cy, double len, double angle){
    this.cx = cx;
    this.cy = cy;
    this.len = len;
    this.angle = angle;
  }
  
  
  void display(){
    line(cx, cy, (float)(cx + len * Math.cos(angle)), (float)(cy + len * Math.sin(angle))); 
  }
}
