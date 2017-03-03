import java.util.Calendar;
Shape s;
void setup(){
  size(700, 700, P2D);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);

  s = new Shape();
}

void draw(){
  background(0, 0, 100);
  s.run();
  s.show();
}

///////////////////////////////////////////
class Shape{
  ArrayList<Loc> locs;
  int vnum = 9;
  color colorA, colorB, colorC, colorD;

  Shape(){
    locs = new ArrayList<Loc>();

    for(int i=0; i<vnum; i++){
      locs.add(new Loc(random(width), random(height)));
    }

    colorA = color(random(360), 100, 100, 100);
    colorB = color(random(360), 100, 100, 100);
    colorC = color(random(360), 100, 100, 100);
    colorD = color(random(360), 100, 100, 100);
  }

  void run(){
    for(int i=0; i<locs.size(); i++){
      Loc l = locs.get(i);
      l.update();
    }
  }

  void show(){
    beginShape();

    fill(colorA);
    vertex(locs.get(0).pos.x, locs.get(0).pos.y);

    fill(colorB);
    bezierVertex( locs.get(1).pos.x, locs.get(1).pos.y,
                  locs.get(2).pos.x, locs.get(2).pos.y,
                  locs.get(3).pos.x, locs.get(3).pos.y);

    endShape();
  }

}

///////////////////////////////////////////
class Loc{
  PVector pos;
  PVector vel;

  Loc(float _x, float _y){
    pos = new PVector(_x, _y);
    vel = PVector.random2D();
    vel.mult(random(1, 3));
  }
  void update(){
    pos.add(vel);
    if(pos.x < 0 || pos.x > width){ vel.x *= -1; }
    if(pos.y < 0 || pos.y > height){ vel.y *= -1; }
  }
}
///////////////////////////////////////////



void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
