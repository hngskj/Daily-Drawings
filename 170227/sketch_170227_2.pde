import java.util.Calendar;

Dot[] dots = new Dot[1000];
float x, y;

void setup(){
  size(700, 700);
  background(0);
  stroke(255);
  strokeWeight(5);

  for (int i=0; i<dots.length; i++){
    dots[i] = new Dot(0.8);
  }
  for (Dot d : dots){
    d.check();
    d.show();
  }
}

void draw(){

}


////////////////////////////////////
////////////////////////////////////
class Dot{
  float a;
  PVector pos = new PVector();
  PVector bound1, bound2;

  Dot(float _a){
    a = _a;

    bound1 = new PVector(200, 200);
    bound2 = new PVector(500, 500);
  }

  void check(){
    float r = random(1);
    if(a > r){
      in();
    } else {
      out();
    }
  }

  void in(){
    for (int i=0; i<100; i++){
        float _x = random(width);
        if (_x > bound1.x && _x < bound2.x){
          pos.x = _x;
          break;
        }
    }
    for (int i=0; i<100; i++){
        float _y = random(height);
        if (_y > bound1.y && _y < bound2.y){
          pos.y = _y;
          break;
        }
    }
  }

  void out(){
    for (int i=0; i<100; i++){
        float _x = random(width);
        if (_x < bound1.x || _x > bound2.x){
          pos.x = _x;
          break;
        }
    }
    for (int i=0; i<100; i++){
        float _y = random(height);
        if (_y < bound1.y || _y > bound2.y){
          pos.y = _y;
          break;
        }
    }
  }

  void show(){
    point(pos.x, pos.y);
  }
}





void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
