import java.util.Arrays;

int points = 50;
float[] x = new float[points];
float[] y = new float[points];

boolean[] isHull = new boolean[points];

ArrayList<Point> hullpts = new ArrayList<>();

ArrayList<Float> hullinsX = new ArrayList<>();
ArrayList<Float> hullinsY = new ArrayList<>();

Point[] ps = new Point[points];

int starti = 0;
float min = 10;

void setup() {
  size(1200, 800);
  for(int i = 0; i < points; i++) {
    isHull[i] = false;
    x[i] = 300 * random(-0.9, 0.9);
    y[i] = 800 * random(0.3, 0.7);
    ps[i] = new Point(x[i], y[i], i);
    if(ps[i].x < min) {
      min = ps[i].x;
      starti = i;
    }
  }
  for(int i = 0; i < points; i++) {
    ps[i].intan(ps[starti].x, ps[starti].y);
    float x1 = 300 + cx;
    float y1 = ((ps[i].x/200)*(300))+ps[i].y;
    float x2 = -300 + cx;
    float y2 = ((ps[i].x/200)*(-300))+ps[i].y;
    
    ps[i].x1 = x1;
    ps[i].y1 = y1;
    ps[i].x2 = x2;
    ps[i].y2 = y2;
  }
  Arrays.sort(ps);
  hullpts.add(ps[0]);
  ps[0].isHull = true;
}

int cx = 900;
int cy = 300;

int index = 1;

void draw() {
  hullinsX.clear();
  hullinsY.clear();
  noStroke();
  strokeWeight(3);
  background(200);
  stroke(0);
  line(600, 0, 600, 800);
  for(int i = 0; i < points; i++) {
    if(i < index) {
      fill(100);
      stroke(100);
    }
    else {
      fill(0);
      stroke(0);
    }
    
    //if(ps[i].isHull) {
      //stroke(80, 140, 20);
    //}
    
    ellipse(ps[i].x + 300, ps[i].y, 5, 5);
    line(ps[i].x1, ps[i].y1, ps[i].x2, ps[i].y2);
  }
  
  stroke(160, 50, 20);
  
  line(ps[0].x + 300, ps[0].y, hullpts.get(hullpts.size() - 1).x + 300, hullpts.get(hullpts.size() - 1).y);
  
  for(int i = 0; i < points; i++) {
    ps[i].isHull = false;
  }
  
  stroke(80, 140, 20);
  for(int i = 0; i < hullpts.size(); i++) {
    fill(70, 180, 20);
    hullpts.get(i).isHull = true;
    if(hullpts.size() > 1 && i < hullpts.size() - 1) {
      line(hullpts.get(i).x + 300, hullpts.get(i).y, hullpts.get((i + 1) % points).x + 300, hullpts.get((i + 1) % points).y);
      
      float m1 = (hullpts.get(i).y1-hullpts.get(i).y2)/(hullpts.get(i).x1-hullpts.get(i).x2);
      float m2 = (hullpts.get(i+1).y1-hullpts.get(i+1).y2)/(hullpts.get(i+1).x1-hullpts.get(i+1).x2);
      float b1 = hullpts.get(i).y1 - (m1 * hullpts.get(i).x1);
      float b2 = hullpts.get(i+1).y1 - (m2 * hullpts.get(i+1).x1);
      
      float xSol = (b1-b2)/(m2-m1);
      float ySol = (m1 * xSol) + b1;
      
      hullinsX.add(xSol);
      hullinsY.add(ySol);
    }
    ellipse(hullpts.get(i).x + 300, hullpts.get(i).y, 7, 7);
  }
  strokeWeight(4);
  if(hullinsX.size() > 0) {
    stroke(80, 140, 20);
    line(hullpts.get(0).x1, hullpts.get(0).y1, hullinsX.get(0), hullinsY.get(0));
    line(hullpts.get(hullpts.size() - 1).x2, hullpts.get(hullpts.size() - 1).y2, hullinsX.get(hullinsX.size() - 1), hullinsY.get(hullinsX.size() - 1));
  }
  for(int i = 0; i < hullinsX.size(); i++) {
    ellipse(hullinsX.get(i), hullinsY.get(i), 7, 7);
    stroke(80, 140, 20);
    if(i < hullinsX.size() - 1) {
      line(hullinsX.get(i), hullinsY.get(i), hullinsX.get(i+1), hullinsY.get(i+1));
    }
  }
  
  if(frameCount % 10 == 0 && index < points) {
    hull();
  }
  
  if(index == points) {
    line(hullpts.get(hullpts.size() - 1).x + 300, hullpts.get(hullpts.size() - 1).y, hullpts.get(0).x + 300, hullpts.get(0).y);
  }
}

void hull() {
  if(index == 1) {
    hullpts.add(ps[index]);
  }
  
  else {
  float vec1_x = hullpts.get(hullpts.size() - 1).x - hullpts.get(hullpts.size() - 2).x;
  float vec1_y = hullpts.get(hullpts.size() - 1).y - hullpts.get(hullpts.size() - 2).y;
  
  float vec2_x = -(hullpts.get(hullpts.size() - 1).x - ps[index].x);
  float vec2_y = -(hullpts.get(hullpts.size() - 1).y - ps[index].y);
  
  float det = (vec1_x * vec2_y) - (vec1_y * vec2_x);
  
  while(det < 0 && hullpts.size() > 1) {
    hullpts.get(hullpts.size() - 1).isHull = false;
    hullpts.remove(hullpts.size() - 1);
    
    if (hullpts.size() >= 2) {
      vec1_x = hullpts.get(hullpts.size() - 2).x - hullpts.get(hullpts.size() - 1).x;
      vec1_y = hullpts.get(hullpts.size() - 2).y - hullpts.get(hullpts.size() - 1).y;
      vec2_x = hullpts.get(hullpts.size() - 1).x - ps[index].x;
      vec2_y = hullpts.get(hullpts.size() - 1).y - ps[index].y;
      det = (vec1_x * vec2_y) - (vec1_y * vec2_x);
    }
  }
  hullpts.add(ps[index]);
  ps[index].isHull = true;
  }
  index++;
}

class Point implements Comparable{
    float x, y, angle;
    float x1, y1, x2, y2;
    int i;
    boolean isHull;
    
    Point(float x, float y, int i) {
        this.x = x;
        this.y = y;
        this.i = i;
        isHull = false;
    }
    
    void intan(float x, float y) {
        float xDiff = x - this.x;
        if(xDiff == 0) angle = -1000;
        else angle = atan((y - this.y)/(x - this.x));
    }
    
    int compareTo(Object o) {
        Point other = (Point)o;
        if (other.angle > angle)  return -1;
        if (other.angle == angle) return 0;
        return 1;
    }
}
