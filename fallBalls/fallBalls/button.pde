class Button{
  float x1, x2, y1, y2;
  String name;
  
  Button(float x1, float x2, float y1, float y2, String name){
   this.x1 = min(x1, x2);
   this.x2 = max(x1,x2);
   this.y1 = min(y1, y2);
   this.y2 = max(y1, y2);
   this.name = name;
  }
  
  boolean pressed(){
    if(mousePressed == true && (x1 < mouseX && mouseX < x2) && (y1 < mouseY && mouseY < y2)){
      
      return true;
      
    }
    return false;
    
  }
  
  void show(){
    fill(255);
    stroke(255);
    rect(x1, y1, x2-x1, y2-y1);
    fill(0);
    textAlign(CENTER);
    textSize(12);
    text(name, x1+((x2-x1)/2), y1+((y2-y1)/2)+6);
  }
}
  
