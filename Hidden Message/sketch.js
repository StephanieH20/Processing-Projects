// Press UP and DOWN to go through the poem


const dots = 61;
const range = new Array(dots).fill();

let sentence1 = "What is the sum of 1/5 and 1/5²";
let sentence2 = "and 1/5³ and 1/5- so on ?";
let sentence3 = "Surely there must be a tool out there";
let sentence4 = "for us to find this sum of beyonds.";
let sentence5 = "If you are keen and be aware,";
let sentence6 = "you might find a beautiful clue.";
let sentence7 = "And after some searching here and there,";
let sentence8 = "you’ll see the answer right in front of you.";


let words = sentence1.split(" ");
words = words.concat(sentence2.split(" "));
words = words.concat(sentence3.split(" "));
words = words.concat(sentence4.split(" "));
words = words.concat(sentence5.split(" "));
words = words.concat(sentence6.split(" "));
words = words.concat(sentence7.split(" "));
words = words.concat(sentence8.split(" "));

const length2 = 4;
const range2 = new Array(length2).fill();

const length3 = 2;
const range3 = new Array(length3).fill(0);

const arr = range.map(e => range2.map(e => range3.map(e => e)));

let colorsR = [200, 120, 120, 200];
let colorsG = [120, 150, 200, 200];
let colorsB = [40, 220, 20, 50];

//let colorsR = [200, 255, 255, 255];
//let colorsG = [120, 255, 255, 255];
//let colorsB = [40, 255, 255, 255];

let factor = 1.07;

let div = 6.8;

let count = 0;

let up = false;
let down = false;

function setup() {
  createCanvas(600, 600);
  textAlign(CENTER, CENTER);

  for(let i = 0; i < dots; i++) {
    let a1 = (PI/4) + (PI/div) * (i);
    let a2 = (3*PI/4) + (PI/div) * (i);
    let a3 = (-3*PI/4) + (PI/div) * (i);
    let a4 = (-PI/4) + (PI/div) * (i);
    let initLen = width * sqrt(2)/2;
    let length = initLen/pow(sqrt(5), i);
    //print(length);
    //print(200 + length * cos(a1), 200 + length * sin(a1));
    //ellipse(200 + length * cos(a1), 200 + length * sin(a1), 10, 10);
    //ellipse(200 + length * cos(a2), 200 + length * sin(a2), 10, 10);
    //ellipse(200 + length * cos(a3), 200 + length * sin(a3), 10, 10);
    //ellipse(200 + length * cos(a4), 200 + length * sin(a4), 10, 10);
    arr[i][0][0] = 0 + length * cos(a1);
    arr[i][0][1] = 0 - length * sin(a1);
    
    arr[i][1][0] = 0 + length * cos(a2);
    arr[i][1][1] = 0 - length * sin(a2);
    
    arr[i][2][0] = 0 + length * cos(a3);
    arr[i][2][1] = 0 - length * sin(a3);
    
    arr[i][3][0] = 0 + length * cos(a4);
    arr[i][3][1] = 0 - length * sin(a4);
  }
}

function draw() {
  background(255);
  if(up) count += 1;
  if(down) count -= 1;
  translate(width/2, height/2);
  let f = pow(factor, count);
  for(let i = 0; i < dots; i++) {
    /*fill(255, 0, 0);
    ellipse(arr[i][0][0], arr[i][0][1], 5, 5);
    fill(255, 255, 0);
    ellipse(arr[i][1][0], arr[i][1][1], 5, 5);
    fill(0, 255, 0);
    ellipse(arr[i][2][0], arr[i][2][1], 5, 5);
    fill(0, 0, 255);
    ellipse(arr[i][3][0], arr[i][3][1], 5, 5);*/
    
    if(i < dots - 1) {
      //fill(255);
      
      fill(220, 200, 20);
      triangle(f * arr[i][1][0], f * arr[i][1][1], f * arr[i][0][0], f * arr[i][0][1], f * arr[i + 1][1][0], f * arr[i + 1][1][1]);
      
      fill(200, 120, 40);
      triangle(f * arr[i][0][0], f * arr[i][0][1], f * arr[i][3][0], f * arr[i][3][1], f * arr[i + 1][0][0], f * arr[i + 1][0][1]);
      
      fill(120, 200, 20);
      triangle(f * arr[i][2][0], f * arr[i][2][1], f * arr[i][1][0], f * arr[i][1][1], f * arr[i + 1][2][0], f * arr[i + 1][2][1]);
      
      fill(120, 150, 220);
      triangle(f * arr[i][3][0], f * arr[i][3][1], f * arr[i][2][0], f * arr[i][2][1], f * arr[i + 1][3][0], f * arr[i + 1][3][1]);
      
      
      /*fill(colorsR[i % 4], colorsG[i % 4], colorsB[i % 4]);
      triangle(f * arr[i][1][0], f * arr[i][1][1], f * arr[i][0][0], f * arr[i][0][1], f * arr[i + 1][3][0], f * arr[i + 1][3][1]);
      
      fill(colorsR[(i + 3) % 4], colorsG[(i + 3) % 4], colorsB[(i + 3) % 4]);
      triangle(f * arr[i][0][0], f * arr[i][0][1], f * arr[i][3][0], f * arr[i][3][1], f * arr[i + 1][2][0], f * arr[i + 1][2][1]);
      
      fill(colorsR[(i + 6) % 4], colorsG[(i + 6) % 4], colorsB[(i + 6) % 4]);
      triangle(f * arr[i][3][0], f * arr[i][3][1], f * arr[i][2][0], f * arr[i][2][1], f * arr[i + 1][1][0], f * arr[i + 1][1][1]);
      
      fill(colorsR[(i + 9) % 4], colorsG[(i + 9) % 4], colorsB[(i + 9) % 4]);
      triangle(f * arr[i][2][0], f * arr[i][2][1], f * arr[i][1][0], f * arr[i][1][1], f * arr[i + 1][0][0], f * arr[i + 1][0][1]);*/
    
    let x1 = arr[i][0][0];
    let x2 = arr[i][3][0];
    let x3 = arr[i + 1][0][0];
    let y1 = arr[i][0][1];
    let y2 = arr[i][3][1];
    let y3 = arr[i + 1][0][1];
    
    if(i >= sentence1.split(" ").length) {
      x1 = arr[i][1][0];
      x2 = arr[i][0][0];
      x3 = arr[i + 1][1][0];
      y1 = arr[i][1][1];
      y2 = arr[i][0][1];
      y3 = arr[i + 1][1][1];
    }
      
    if(i >= sentence1.split(" ").length + sentence2.split(" ").length) {
      x1 = arr[i][2][0];
      x2 = arr[i][1][0];
      x3 = arr[i + 1][2][0];
      y1 = arr[i][2][1];
      y2 = arr[i][1][1];
      y3 = arr[i + 1][2][1];
    }
      
    if(i >= sentence1.split(" ").length + sentence2.split(" ").length + sentence3.split(" ").length) {
      x1 = arr[i][3][0];
      x2 = arr[i][2][0];
      x3 = arr[i + 1][3][0];
      y1 = arr[i][3][1];
      y2 = arr[i][2][1];
      y3 = arr[i + 1][3][1];
    }
      
      if(i >= sentence1.split(" ").length + sentence2.split(" ").length + sentence3.split(" ").length + sentence4.split(" ").length) {
      x1 = arr[i][0][0];
      x2 = arr[i][3][0];
      x3 = arr[i + 1][0][0];
      y1 = arr[i][0][1];
      y2 = arr[i][3][1];
      y3 = arr[i + 1][0][1];
    }
      
      if(i >= sentence1.split(" ").length + sentence2.split(" ").length + sentence3.split(" ").length + sentence4.split(" ").length + sentence5.split(" ").length) {
      x1 = arr[i][1][0];
      x2 = arr[i][0][0];
      x3 = arr[i + 1][1][0];
      y1 = arr[i][1][1];
      y2 = arr[i][0][1];
      y3 = arr[i + 1][1][1];
    }
      
      if(i >= sentence1.split(" ").length + sentence2.split(" ").length + sentence3.split(" ").length + sentence4.split(" ").length + sentence5.split(" ").length + sentence6.split(" ").length) {
      x1 = arr[i][2][0];
      x2 = arr[i][1][0];
      x3 = arr[i + 1][2][0];
      y1 = arr[i][2][1];
      y2 = arr[i][1][1];
      y3 = arr[i + 1][2][1];
    }
      
      if(i >= sentence1.split(" ").length + sentence2.split(" ").length + sentence3.split(" ").length + sentence4.split(" ").length + sentence5.split(" ").length + sentence6.split(" ").length + sentence7.split(" ").length) {
      x1 = arr[i][3][0];
      x2 = arr[i][2][0];
      x3 = arr[i + 1][3][0];
      y1 = arr[i][3][1];
      y2 = arr[i][2][1];
      y3 = arr[i + 1][3][1];
    }
      
    let cx = f * (x1 + x2 + x3)/3;
    let cy = f * (y1 + y2 + y3)/3;
      
    
    //let s = 32/pow(sqrt(1.2), f);
    fill(0);
    let d = dist(f * x1, f * x2, f * y1, f * y2);
    textSize(d/15);
    text(words[i], cx, cy);
      
    }
  }
}

function dist(x1, x2, y1, y2) {
  return sqrt(((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)));
}

function keyPressed() {
  if(keyCode == UP_ARROW) {
    up = true;
  }
  if(keyCode == DOWN_ARROW) {
    down = true;
  }
}

function keyReleased() {
  if(keyCode == UP_ARROW) {
    up = false;
  }
  if(keyCode == DOWN_ARROW) {
    down = false;
  }
}