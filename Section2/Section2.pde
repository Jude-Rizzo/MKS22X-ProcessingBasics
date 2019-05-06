int recursions;
color bg,fg;

void setup() {
  size(800, 600);
  recursions = 0;
}


void Sg(int recursions, float x1, float y1, float x2, float y2, float x3, float y3) {
  if (recursions <= 0) triangle(x1, y1, x2, y2, x3, y3);
  else {
    float a = (x1+x2)/2;
    float b = (x2+x3)/2;
    float c = (x3+x1)/2;
    float x = (y1+y2)/2;
    float y = (y2+y3)/2;
    float z = (y3+y1)/2;

    Sg(recursions-1, x1, y1, a, x, c, z);
    Sg(recursions-1, a, x, x2, y2, b, y);
    Sg(recursions-1, c, z, b, y, x3, y3);

  }

}

void draw() { 

  background(50);  

  fill(255);
  text("Click the mouse to increase recursions, press a key to decrease levles",20,20);

  Sg(recursions, 0, height-10, width, height-10, width/2, 10);

  //koch(recursions,width-10, height/2,10, height/3 ); 
  //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
  recursions++;  
}

void keyPressed(){
  recursions--; 
}
