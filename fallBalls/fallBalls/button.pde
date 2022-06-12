class Button{
  float xpos, ypos, xLeng, yLeng;
  String name;
  
  Button(float xpos, float ypos, float xLeng, float yLeng, String name){
   this.xpos = xpos;
   this.ypos = ypos;
   this.xLeng = xLeng;
   this.yLeng = yLeng;
   this.name = name;
  }
  
  boolean pressed(){
    //if(mousePressed){

    //  print(name, xpos-(xLeng/2) < mouseX , mouseX < xpos+(xLeng/2) , (ypos-(yLeng/2)) < mouseY , mouseY < (ypos+(yLeng/2)) );
    //  print("\n");
    //}

    if(mousePressed == true && (xpos < mouseX && mouseX < (xpos+xLeng)) && (ypos < mouseY && mouseY < (ypos+yLeng))){
      
      return true;
      
    }
    return false;
    
  }
  
  void show(){
    fill(150);
    stroke(0);
    rect(xpos, ypos, xLeng, yLeng);
    fill(0);
    textAlign(CENTER);
    textSize(FONTSIZE);
    text(name, xpos+xLeng/2, ypos+yLeng/2+FONTSIZE/2);
  }
}
  
