import java.util.Arrays;

Point[] points = new Point[50];
Point[] pointsB = new Point[50];
Point[] pointsR = new Point[50];
Point startB = new Point(800, 0, 0, 0);
Point startR = new Point(800, 0, 0, 0);
ArrayList<Point> b_hullPts = new ArrayList<>();
ArrayList<Point> r_hullPts = new ArrayList<>();
ArrayList<Integer> q = new ArrayList<>();
ArrayList<Integer> qr = new ArrayList<>();
int index = 0;
int nextIndex = 0;
int index_r = 0;
int nextIndex_r = 0;
int ind = 0;
boolean b_stop = false;
boolean r_start = false;
boolean r_go = false;
boolean r_stop = false;

void setup() {
    size(800, 600);
    for(int i = 0; i < 50; i++) {
       int x = (int) random(100, 700);
       int y = (int) random(100, 500);
       points[i] = new Point(x, y, i/25, i);
       if(i < 25 && x <= startB.x) startB = points[i];
       if(i >= 25 && x <= startR.x) startR = points[i];
    }
    for(int i = 0; i < 50; i++) {
        points[i].intan(startB.x, startB.y);
    }
    Arrays.sort(points);
    boolean foundIt = false;
    int i = 1;
    while(!foundIt) {
      if(points[i].c == 0) foundIt = true;
      else i++;
    }
    nextIndex = i;
    b_hullPts.add(0, points[index]);
    b_hullPts.add(0, points[nextIndex]);
    q.add(index);
    q.add(nextIndex);
    
    foundIt = false;
    while(!foundIt) {
      if(points[i].c == 0) foundIt = true;
      else i++;
    }
    nextIndex = i;
}

void draw() {
    background(200);
    noStroke();
    for(int i = 0; i < 50; i++) {
        if(points[i].c == 0) fill(0, 0, 255);
        else fill(255, 0, 0);
        ellipse(points[i].x, points[i].y, 5, 5);
    }
    fill(0, 0, 255);
    ellipse(startB.x, startB.y, 10, 10);
    fill(255, 0, 0);
    ellipse(startR.x, startR.y, 10, 10);
    stroke(5);
    for(int i = 0; i < b_hullPts.size() - 1; i++) {
      line(b_hullPts.get(i).x, b_hullPts.get(i).y, b_hullPts.get(i + 1).x, b_hullPts.get(i + 1).y);
    }
    //line(b_hullPts.get(index).x, b_hullPts.get(index).y, b_hullPts.get(nextIndex).x, b_hullPts.get(nextIndex).y);
    //line(points[index].x, points[index].y, points[nextIndex].x, points[nextIndex].y);
    if(!b_stop && frameCount % 1 == 0) {
      hull();
    }
    
    if(r_start) {
      b_hullPts.add(0, points[0]);
      int index_r = 0;
      for(int i = 0; i < 50; i++) {
        points[i].intan(startR.x, startR.y);
      }
      Arrays.sort(points);
      boolean foundIt_r = false;
      int i_r = 1;
      while(!foundIt_r) {
        if(points[i_r].c == 1) foundIt_r = true;
        else i_r++;
      }
      nextIndex_r = i_r;
      r_hullPts.add(0, points[index_r]);
      r_hullPts.add(0, points[nextIndex_r]);
      qr.add(index_r);
      qr.add(nextIndex_r);
    
      foundIt_r = false;
      while(!foundIt_r) {
        if(points[i_r].c == 1) foundIt_r = true;
        else i_r++;
      }
      nextIndex_r = i_r;
      r_start = false;
      r_go = true;
   }
   
   if(r_go) {
     if(frameCount % 1 == 0) {
       hull_r();
     }
   }
     for(int i = 0; i < r_hullPts.size() - 1; i++) {
       line(r_hullPts.get(i).x, r_hullPts.get(i).y, r_hullPts.get(i + 1).x, r_hullPts.get(i + 1).y);
     }
}
    
void hull() {
 index = q.get(0);
 //index = nextIndex;
  float vec1_x = b_hullPts.get(1).x - points[index].x;
  float vec1_y = b_hullPts.get(1).y - points[index].y;
  float vec2_x = points[index].x - points[nextIndex].x;
  float vec2_y = points[index].y - points[nextIndex].y;
  float det = (vec1_x * vec2_y) - (vec1_y * vec2_x);
  //ellipse(points[nextIndex].x, points[nextIndex].y, 20, 20);
  //println(det);
  if(det < 0) {
    b_hullPts.remove(0);
    q.remove(0);
  }
  else {
    b_hullPts.add(0, points[nextIndex]);
    q.add(0, nextIndex);
    if(nextIndex < 49) {
      nextIndex++;
      while(points[nextIndex].c != 0 && nextIndex < 49 && !b_stop) {
        nextIndex++;
      }
      if(points[nextIndex].c == 1 || nextIndex == 49) {
        nextIndex = 0;
        b_stop = true;
        r_start = true;
      }
    }
  }
  
}

void hull_r() {
 index_r = qr.get(0);
 //index = nextIndex;
  float vec1_x = r_hullPts.get(1).x - points[index_r].x;
  float vec1_y = r_hullPts.get(1).y - points[index_r].y;
  float vec2_x = points[index_r].x - points[nextIndex_r].x;
  float vec2_y = points[index_r].y - points[nextIndex_r].y;
  float det = (vec1_x * vec2_y) - (vec1_y * vec2_x);
  //ellipse(points[nextIndex].x, points[nextIndex].y, 20, 20);
  //println(det);
  if(det < 0) {
    r_hullPts.remove(0);
    qr.remove(0);
  }
  else {
    r_hullPts.add(0, points[nextIndex_r]);
    qr.add(0, nextIndex_r);
    if(nextIndex_r < 49) {
      nextIndex_r++;
      while(points[nextIndex_r].c != 1 && nextIndex_r < 49 && !r_stop) {
        nextIndex_r++;
      }
    }
    if(points[nextIndex_r].c == 0) {
        nextIndex_r = 0;
        r_stop = true;
      }
      else if(nextIndex_r == 49) {
        r_hullPts.add(0, points[49]);
        r_hullPts.add(0, points[0]);
        r_stop = true;
  }
  
}
}

class Point implements Comparable{
    int x, y, c, i;
    float at;
    
    Point(int x, int y, int c, int i) {
        this.x = x;
        this.y = y;
        this.c = c;
        this.i = i;
    }
    
    void intan(float x, float y) {
        float xDiff = x - this.x;
        if(xDiff == 0) at = -1000;
        else at = atan((y - this.y)/(x - this.x));
    }
    
    int compareTo(Object o) {
        Point other = (Point)o;
        if (other.at > at)  return -1;
        if (other.at == at) return 0;
        return 1;
    }
}
