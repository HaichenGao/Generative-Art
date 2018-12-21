PImage img;
float x;
float y;

float X;
float Y;

float I;
float J;




void setup() {
  img = loadImage("ear.jpg");
  size(2480, 3508);  
  background(img);
  x = 0;
  y = 0;
  
  X = width;
  Y = height;
  
  I = width/2;  
  J = height/2;
}


void draw() {
  
  loadPixels();
  img.loadPixels();
  float newx = constrain(x + random(-30, 30), 0, width);   
  float newy = constrain(y + random(-4, 4), 0, height-1);
  
  float newX = constrain(X + random(-30, 30), 0, width);   
  float newY = constrain(Y + random(-4, 4), 0, height-1);
  
  float newI = constrain(I + random(-30, 30), 0, width);   
  float newJ = constrain(J + random(-4, 4), 0, height-1);
  
  // Find the midpoint of the line
  int midx = int((newx + x) / 2);
  int midy = int((newy + y) / 2);
  
  int midX = int((newX + X) / 2);
  int midY = int((newY + Y) / 2);
  
  int midI = int((newI + I) / 2);
  int midJ = int((newJ + J) / 2);
  // Pick the color from the video, reversing x
  color c = img.pixels[midx + midy*img.width];
  
  color s = img.pixels[midX + midY*img.width];
    
  color a = img.pixels[midI + midJ*img.width];
  
  
  
  // Draw a line from (x,y) to (newx,newy)  
  stroke(c);  
  strokeWeight(6);  
  line(x, y, newx, newy);  
  
  stroke(s);  
  strokeWeight(6);  
  line(X, Y, newX, newY);
  
  stroke(a);  
  strokeWeight(6);  
  line(I, J, newI, newJ);
  
  // Save (newx,newy) in (x,y)  
  x = newx;  
  y = newy;
  
  X = newX;
  Y = newY;
  
  I = newI;
  J = newJ;
}

void keyPressed(){
 if(keyCode==ENTER){
  saveFrame("screed-###.png"); 
 }
}
