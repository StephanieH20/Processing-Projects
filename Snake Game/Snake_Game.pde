//snake game

ArrayList<Integer> xPos = new ArrayList<Integer>();
ArrayList<Integer> yPos = new ArrayList<Integer>();
int h = 20, w = 30, bs = 30;
int[] dirX = {1, - 1, 0, 0};
int[] dirY = {0, 0, 1, -1};
int dir = 0;
int appleX = (int)random(4, 26);
int appleY = (int)random(4, 16);
int redFill = 50;
int greenFill = 100;

boolean gameOver = false;


void setup() {
    xPos.add(5);
    yPos.add(5);
    size(900, 600); 
   
    
}

void draw() {
    background(180);
    noStroke();
    if(!gameOver) {
    if(xPos.get(0) >= w || xPos.get(0) < 0 || yPos.get(0) >= h || yPos.get(0) < 0) {
        gameOver = true;
    }
    
    for(int i = 0; i < xPos.size(); i++) {
        //fill(80, 150, 0);
        fill(redFill + 5 * i, greenFill + 5 * i, 0);
        rect(xPos.get(i) * bs, yPos.get(i) * bs, bs, bs);
    }
    
    fill(180, 50, 0);
    rect(appleX * bs, appleY * bs, bs, bs);
    
    if (frameCount % 5 == 0) {
        
        xPos.add(0, xPos.get(0) + dirX[dir]);
        yPos.add(0, yPos.get(0) + dirY[dir]);
        
        for(int i = 0; i < xPos.size(); i++) {
          if(i != 0 && xPos.get(0) == xPos.get(i) && yPos.get(0) == yPos.get(i)) {
            gameOver = true;
          }
        }
        
        if(xPos.get(0) == appleX && yPos.get(0) == appleY) {
            appleX = (int)random(4, 26);
            appleY = (int)random(4, 16);
        }
else {
        xPos.remove(xPos.size() - 1);
        yPos.remove(yPos.size() - 1);
}

 }
 
 fill(50, 100, 0);
rect(xPos.get(0) * bs, yPos.get(0) * bs, bs, bs);
    
    if(up) {
        dir = 3;
    }
    if(down) {
        dir = 2;
    }
    if(left) {
        dir = 1;
    }
    if(right) {
        dir = 0;
    } 
    }
    else {
        fill(200, 40, 0);
        textSize(30);
        text("GAME OVER", 350, 300);
    }
}
    
    boolean up = false;
    boolean down = false;
    boolean right = false;
    boolean left = false;
    
    
    void keyPressed() {
       if(key == 'w') {
           up = true;
       } 
       else if(key == 's') {
           down = true;
       }
       else if(key == 'd') {
           right = true;
       }
       else if(key == 'a') {
           left = true;
       }
        
    }
    
    void keyReleased() {
      if(key == 'w') {
           up = false;
       } 
       if(key == 's') {
           down = false;
       }
       if(key == 'd') {
           right = false;
       }
       if(key == 'a') {
           left = false;
       }  
    }
