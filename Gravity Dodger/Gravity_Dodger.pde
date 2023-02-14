//Processing project April 2017

//GLOBAL VARIABLES

//contains the coordinates and positions of certain objects such as the player object and the projectiles, stores certain concepts and values as well as images

int screen;
final int gamePlay = 1;
final int gameOver = 2;
PImage player;
String playerUrl = "http://piq.codeus.net/static/media/userpics/piq_323679_400x400.png";
int display_width = 1000;
int display_height = 800;
float x = display_width/2;
float y = display_height/2;
int player_width = 55;
int player_height = 55;
float y_velocity = 0;
float velocity_change = 0.08;
float x_change;
projectile[] proArray = new projectile[14];
int nextpro = 0; 
int h = 0;
PImage pImg;
String pUrl = "https://cdn0.iconfinder.com/data/icons/super-8x8-transparent-background-edition/512/Close.png";
float p_x, p_y;

class projectile {
  float p_x;
  float p_y;
  //defining the variable type 'projectile', stores coordinate positions
}

void addProjectile(float p_x, float p_y) {
  projectile pro = new projectile();
  proArray[nextpro] = pro;
  nextpro++;
  nextpro %= 14;
  pro.p_x = p_x;
  pro.p_y = p_y;
  //adds the concept of a projectile to the program; stores information such as which variables and arrays are associated with or contain the projectiles 
}

void drawProjectile (projectile pro) {
  image(pImg, pro.p_x, pro.p_y, 60, 60);
  //draws or blits/displays the projectile onto the screen
}
 
void drawProjectiles_p () { //<- draws multiple projectiles while running through an array
  for (projectile pro : proArray) {
    if (pro != null) {
      drawProjectile(pro);
    }
  }
}

void setup() {
    size(1000, 800);
    player = loadImage(playerUrl);
    screen = gamePlay;
    pImg = loadImage(pUrl);
    for(int i = 0; i < 14; i++) {
     addProjectile(random(0, width), random(0, -800));
    }
}

void draw() {
    /*int cl;
    h++; 
    if (h % 6 == 0) {
      cl = 0;
    }
    else {
      cl = 255;
    }*/
    
    background(0);
    drawProjectiles_p();
    
    if (screen == gamePlay) {
        play();
    }
    else if (screen == gameOver) {
        end();
    }
    //what to display/ what functions during a certain screen time
}

void play() {
    for(int i = 0; i < proArray.length; i++) {
    if (proArray[i] != null) {
      if(proArray[i].p_y >= display_height) {
          proArray[i].p_y = (int)random(0, -800);
          proArray[i].p_x = (int)random(0, width);
      }
    } //for when and where the projectiles spawn -> they start at random x(horizontal positions) and random y(vertical positions) in order to randomize the timing of the fall
      
  }
  for(int i = 0; i < proArray.length; i++) {
    int moved = (int)random(0, 10);
    if (proArray[moved] != null){
        proArray[moved].p_y += random(0, 8);
        drawProjectile(proArray[i]);
    }//spawns multiple projectiles
  }
  
  //Gravity
  //the ball accelerates vertically downwards because it's vertical position is being decreased by a velocity that is increasing; it's vertical position is increasingly decreasing
  y += y_velocity;
  x += x_change;
  y_velocity += 0.34;
  image(player, x, y, player_width, player_height);
  if (y + 15 > display_height - 20) {
      y_velocity *= -0.92; //bouncing back -> looses some velocity and reverses direction
  }
  else if (y < 0) {
    y_velocity = 2;
  }
  if (x + 15 > display_width) {
    x_change = -2;
  }
  else if (x -15 < 0) {
    x_change = 2;
  }
  if (space_hold == true) {
    y_velocity += -1;
  }
  if (l_hold == true) {
    x_change = 5;
    if (x + 40 > display_width) {
        x_change = 0;
    }
  }
  else if (j_hold == true) {
    x_change = -5;
    if (x < 0) {
        x_change = 0;
    }
  }
  else if (j_hold == false || l_hold == false) {
    x_change = 0;
  }
  crash(x, y);
}

void end() {
    background(0);
    fill(255, 30, 0);
    textSize(42);
    textAlign(CENTER, CENTER);
    text("GAME OVER", (display_width/2), display_height/2);
}

void crash(float x, float y) {
    int cutoff = 2;
    int addon = 55;
    for (int i = 0; i < proArray.length; i++) {
        if (((x > proArray[i].p_x + cutoff) && (x < proArray[i].p_x + addon)) ||
             ((x + player_width > proArray[i].p_x + cutoff) && (x + player_width < proArray[i].p_x + addon))) {
                 if (((y > proArray[i].p_y + cutoff) && (y < proArray[i].p_y + addon)) ||
                      ((y + player_height > proArray[i].p_y + cutoff) && (y + player_height < proArray[i].p_y + addon))) {
                         //check: println((int)y + " " + (int)(proArray[i].p_y + cutoff) + " " + (int)(proArray[i].p_y + addon) + " " 
                         //+(int)(y + player_height));  
                         screen = gameOver;
                      }
                 }
    }
}
//controls
//these had to be either true or false
boolean space_hold = false;
boolean l_hold = false;
boolean j_hold = false;

void keyPressed() {
    if (key == ' ') {
       space_hold = true;
    }
    if (key == 'l') {
      l_hold = true;
    }
    if (key == 'j') {
      j_hold = true;
    }
}

void keyReleased() {
   if (key == ' ') {
       space_hold = false;
    }
    if (key == 'l') {
      l_hold = false;
    }
    if (key == 'j') {
      j_hold = false;
    }
}
