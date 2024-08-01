let starts = [];
let rads = [];
t = 0;

let currX = 800/2;
let currY = 800/2;

let up = false;
let down = false;
let right = false;
let left = false;

function setup() {
  createCanvas(800, 800);
  for(let r = 0; r < height/100; r++) {
    let arr = [];
    let arr_ = []
    for(let c = 0; c < width/100; c++) {
      arr.push(int(Math.random() * 200));
      arr_.push(int(Math.random() * 2) + 1);
    }
    starts.push(arr);
    rads.push(arr_);
  }
}

function draw() {
  //background(240, 150, 0);
  background(0);
  t+=1;
  fill(240, 150, 20);
  //if (!boundary() && distance(mouseX, mouseY, currX, currY) < 50) {
    //currX = mouseX;
    //currY = mouseY;
  //}
  currX = mouseX;
  currY = mouseY;
  //ellipse(currX, currY, 10, 10);
  for(let r = 0; r < height/100; r++) {
    for(let c = 0; c < width/100; c++) {
      let dx = currX - (50 + (c * 100));
      let dy = currY - (50 + (r * 100));
      let d = Math.sqrt((dx*dx) + (dy*dy));
      let angle = atan2(dy, dx);
      //stroke(200, 120, 0);
      fill(230 - d/3, 230 - d/3, 255 - d/3);
      ellipse(50 + (c * 100) + (rads[r][c]*cos(t/5 + starts[r][c])), 50 + (r * 100) + (rads[r][c]*sin(t/5 + starts[r][c])), 80 + (rads[r][c]*sin(t/3 + starts[r][c])), 80 + (rads[r][c]*sin(t/3 + starts[r][c])));
      noStroke();
      fill(100 - d, 200 - d, 0 - d);
      ellipse(50 + (c * 100) + (20 * cos(angle)) + (rads[r][c]*cos(t/5 + starts[r][c])), 50 + (r * 100) + (20 * sin(angle)) + (rads[r][c]*sin(t/5 + starts[r][c])), 40, 40);
      fill(40 - d/3, 120 - d/3, 180 - d/3);
      ellipse(50 + (c * 100) + (20 * cos(angle)) + (rads[r][c]*cos(t/5 + starts[r][c])), 50 + (r * 100) + (20 * sin(angle)) + (rads[r][c]*sin(t/5 + starts[r][c])), 20, 20);
      fill(255 - d/3);
      ellipse(50 + (c * 100) + (25 * cos(angle)), 50 + (r * 100) + (25 * sin(angle)), 5, 5);
    }
  }
  if (up) {
    currY -= 3;
    if (boundary()) {
      currY += 3;
    }
  }
  if (down) {
    currY += 3;
    if (boundary()) {
      currY -= 3;
    }
  }
  if (right) {
    currX += 3;
    if (boundary()) {
      currX -= 3;
    }
  }
  if (left) {
    currX -= 3;
    if (boundary()) {
      currX += 3;
    }
  }
}

function boundary() {
  for(let r = 0; r < height/100; r++) {
    for(let c = 0; c < width/100; c++) {
      let posX = 50 + (c * 100) + (rads[r][c]*cos(t/5 + starts[r][c]));
      let posY = 50 + (r * 100) + (rads[r][c]*sin(t/5 + starts[r][c]));
      let size = 80 + (rads[r][c]*sin(t/3 + starts[r][c]))
      if (distance(mouseX, mouseY, posX, posY) < size/2 + 5) {
        return true;
      }
    }
  }
  return false;
}
  
function distance(x1, y1, x2, y2) {
  return Math.sqrt(((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)));
}

/*function keyPressed() {
  if(keyCode == UP_ARROW) {
    up = true;
  }
  if(keyCode == DOWN_ARROW) {
    down = true;
  }
  if(keyCode == RIGHT_ARROW) {
    right = true;
  }
  if(keyCode == LEFT_ARROW) {
    left = true;
  }
}

function keyReleased() {
  if(keyCode == UP_ARROW) {
    up = false;
  }
  if(keyCode == DOWN_ARROW) {
    down = false;
  }
  if(keyCode == RIGHT_ARROW) {
    right = false;
  }
  if(keyCode == LEFT_ARROW) {
    left = false;
  }
}*/