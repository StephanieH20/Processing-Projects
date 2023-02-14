class block {
 int bs = 20;
 int y;
 int x;
 boolean CLEAR;
 boolean Visited = false;
 boolean path = false;
 boolean start = false;
 boolean end = false;
 boolean selectEnd = false;
 boolean startSelectionDone = false;
 boolean endSelectionDone = false;
 
 block(boolean b) {
  CLEAR = b;
 }
 
 
 void draw() {
   if(start) {
     fill(40, 180, 0);
   }
   else if(end) {
     fill(150, 80, 0);
   }
  else if(CLEAR) {
    fill(210);
  }
  else if(path) {
    fill(180, 50, 50);
  }
  else if(Visited) {
    fill(130);
  }
  else {
   fill(20); 
  }
  noStroke();
  rect(x * bs, y * bs, bs, bs); 
}//

public void setVisit(boolean b) {
 Visited = b; 
 CLEAR = false;
}

public void setPath(boolean b) {
  if(Visited) {
    path = b;
  }
}

public boolean Clear() {
  return CLEAR;
}
public boolean visited() {
  return Visited;
}
}

int bSize = 20;
int rowsG = 800/bSize;
int colsG = 800/bSize;
//boolean[][] visited = new boolean[10][5];
//block[][] maze = new block[10][5];

boolean done = false;

ArrayList<Integer> xPos = new ArrayList<Integer>();
ArrayList<Integer> yPos = new ArrayList<Integer>();
ArrayList<ArrayList<Integer>> stepSet = new ArrayList<ArrayList<Integer>>();
int[] xDir = {1, -1, 0, 0};
int[] yDir = {0, 0, -1, 1}; //right, left, up, down

ArrayList<Integer> path = new ArrayList<Integer>();
ArrayList<block> pathB = new ArrayList<block>();
ArrayList<ArrayList<block>> blockSet = new ArrayList<ArrayList<block>>();

int startX = 10;
int startY = 0;
int i = 0;
int endX = 9;
int endY = 4;

block[][] maze = new block[40][40];

/*{{new block(false), new block(false), new block(false), new block(false), new block(false), new block(false), new block(true), new block(true), new block(false), new block(false)},
 {new block(false), new block(true), new block(true), new block(false), new block(true), new block(true), new block(true), new block(false), new block(false), new block(false)},
 {new block(false), new block(true), new block(true), new block(true), new block(true), new block(false), new block(true), new block(true), new block(false), new block(true)},
 {new block(true), new block(true), new block(false), new block(false), new block(true), new block(false), new block(false), new block(true), new block(true), new block(true)},
 {new block(true), new block(false), new block(false), new block(false), new block(true), new block(false), new block(false), new block(false), new block(true), new block(true)},
 {new block(true), new block(false), new block(false), new block(false), new block(true), new block(false), new block(false), new block(false), new block(true), new block(true)},
 {new block(false), new block(false), new block(false), new block(false), new block(true), new block(false), new block(false), new block(false), new block(true), new block(true)}
}; */

boolean drawMaze = true;
boolean selectStart = false;
boolean selectEnd = false;
boolean startSearch = false;
boolean search = false;

ArrayList<Integer> start = new ArrayList<Integer>();
ArrayList<block> startB = new ArrayList<block>();


void setup() {
  //startX = 0;
  //startY = 0;
  //endX = 9;
  //endY = 4;
  size(800, 800);
  background(240);
  for(int r = 0 ; r < 40; r++) {
    for(int c = 0; c < 40; c++) {
      maze[r][c] = new block(true);
    }
  }
}

void findPath(block[][] maze, int x, int y, int ex, int ey) {
  xPos.remove(0);
  yPos.remove(0);
  ArrayList<Integer> threshold = stepSet.remove(0);
  ArrayList<block> blockHold = blockSet.remove(0);
  ArrayList<Integer> previous = new ArrayList<Integer>();
  for(int i = 0; i < threshold.size(); i++) {
    previous.add(threshold.get(i));
  }
  ArrayList<block> bA = new ArrayList<block>();
  for(int i = 0; i < blockHold.size(); i++) {
   bA.add(blockHold.get(i)); 
  }
  
  if(x == ex && y == ey) {
    //println(threshold);
    path = threshold;
    pathB = blockHold;
    //drawPath(startX, startY, ex, ey);
    done = true;
    return;
  }
  
    for(int i = 0; i < xDir.length; i++) {
      if(x + xDir[i] >= 0 && x + xDir[i] < maze[0].length && y + yDir[i] >= 0 && y + yDir[i] < maze.length && maze[y + yDir[i]][x + xDir[i]].Clear()) {
        maze[y + yDir[i]][x + xDir[i]].setVisit(true);
        xPos.add(x + xDir[i]);
        yPos.add(y + yDir[i]);
        
        ArrayList<Integer> newSteps = new ArrayList<Integer>();
        for(int j = 0; j < previous.size(); j++) {
          newSteps.add(previous.get(j));
        }
        
        ArrayList<block> newBlocks = new ArrayList<block>();
        for(int j = 0; j < bA.size(); j++) {
         newBlocks.add(bA.get(j)); 
        }
        
        newSteps.add(i);
        stepSet.add(newSteps);
        newBlocks.add(maze[y + yDir[i]][x + xDir[i]]);
        blockSet.add(newBlocks);
      }
   
  }
  
}

void drawPath(ArrayList<Integer> path, int i) {
    //println(path.get(i));
    if(i > 0 && i < path.size()) {
   startX += xDir[path.get(i)];
   startY += yDir[path.get(i)];
    println(startX);
    println(startY);
    //maze[startY][startX].setPath(true);
   i++;
   // println(path.get(i));
   }
  }



void draw() {
  //println("test");
  background(240);
  //for(int i = 0
  //for(int r = 0; r < rowsG; r++) {//line(0, i * bSize, 800, i * bSize);
  //  for(int c = 0; c < colsG; c++) {//line(i * bSize, 0, i * bSize, 500);
  //    block b = new block(r, c);
  //    maze[r][c] = b;
  //    b.draw(210, 210, 210);
  //    b.set(true);
  //  }
  //}
   for(int r = 0; r < maze.length; r++) {
     for(int c = 0; c < maze[0].length; c++) {
       maze[r][c].x = c;
       maze[r][c].y = r;
       maze[r][c].draw();
     } 
   }
   if(drawMaze) {
     if(mousePressed) {
       maze[(int)mouseY/20][(int)mouseX/20].CLEAR = false;
     }
   }
   
   if(selectStart) {
     if(mousePressed && maze[(int)mouseY/20][(int)mouseX/20].CLEAR) {
       startX = (int) mouseX/20;
       startY = (int) mouseY/20;
       maze[startY][startX].start = true;
       selectStart = false;
       selectEnd = true;
     }
   }
   
   if(selectEnd) {
     if(mousePressed && maze[(int)mouseY/20][(int)mouseX/20].CLEAR && !maze[(int)mouseY/20][(int)mouseX/20].start) {
       endX = (int) mouseX/20;
       endY = (int) mouseY/20;
       maze[endY][endX].end = true;
       selectEnd = false;
       startSearch = true;
     }
   }
   
   

   if(startSearch) {
       startB.add(maze[startY][startX]);
  blockSet.add(startB);
  start.add(-1);
  stepSet.add(start);
  xPos.add(startX);
  yPos.add(startY);
  startSearch = false;
  search = true;
   }
   
   if(search) {
    if(frameCount % 1 == 0) {
   if(!done || (xPos.size() > 0 && yPos.size() > 0)) {
     int x = xPos.get(0);
     int y = yPos.get(0);
     findPath(maze, x, y, endX, endY);
   }
   
   if(done && i < pathB.size()) {
     ///for(int i = 0; i < pathB.size(); i++) {
       pathB.get(i).setPath(true);
       pathB.get(i).draw();
       i++;
     //if(startX != endX && startY != endY) {
     //println(path);
     drawPath(path, 1);
     }
// }
   }
   }
   
}

void keyPressed() {
  if(key == ' ') {
    if(drawMaze && !selectStart) {
      selectStart = true;
      drawMaze = false;
    }
  }
}
