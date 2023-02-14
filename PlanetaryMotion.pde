float x = 1;
float y = 0;
float vx = 0;
float vy = -1.2;  // <- y-axis is flipped in this interface
float n = 2;  // 2.1, 1.9, 3, -1
int scale = 50;

float KE = 0;
float PE = 0;

float vx2 = vx;
float vy2 = vy;

void setup() {
    size(500, 500);  //center = (255, 255);
    background(0);
}
float prevX = x;
float prevY = y;

void draw() {
    if(frameCount % 1 == 0) {
        strokeWeight(2);
        stroke(100);
        line(0, 250, 500, 250);
        line(250, 0, 250, 500);
        for(int i = -4; i <= 4; i++) {
            text(i, scale * i + 250 - 8, 265);
        }
        for(int i = -4; i <= 4; i++) {
            if(i != 0) text(i, 235, scale * i + 250 + 5);
        }
        //fill(0, 0, 0, 5);
        //rect(0, 0, 500, 500);
        fill(150);
        noStroke();
        //ellipse(100 * (float)x + 255, 100 * (float)y + 255, 10, 10);
        //float ax = -x/sqrt(((x * x) + (y * y)) * ((x * x) + (y * y)) * ((x * x) + (y * y)));
        //float ay = -y/sqrt(((x * x) + (y * y)) * ((x * x) + (y * y)) * ((x * x) + (y * y)));
        //float ax = -x/pow((x * x) + (y * y), (n + 1)/2);
        //float ay = -y/pow((x * x) + (y * y), (n + 1)/2);
        prevX = x;
        prevY = y;
        float ax = -x/sqrt(pow((x * x) + (y * y), 3)) - (0.1 * (-x/pow((x * x) + (y * y), 2)));
        float ay = -y/sqrt(pow((x * x) + (y * y), 3)) - (0.1 * (-y/pow((x * x) + (y * y), 2)));
        vx += ax * 0.1;
        vy += ay * 0.1;
        x += vx * 0.1;
        y += vy * 0.1;  // <- Euler increments of t = 0.001
        KE = (vx * vx) + (vy * vy) / 2;
        PE = -1/((n - 1) * pow(sqrt((x * x) + (y * y)), n - 1));
        vx2 += ax;
        vy2 += ay;
        stroke(200);
        strokeWeight(1);
        line(scale * prevX + 250, scale * prevY + 250, scale * x + 250, scale * y + 250);
       // println(x + " " + y + " " + vx2 + " " + vy2 + " " + KE + " " + PE);
    }
}

// float pow(float n, int p) {
//     float ret = 1;
//     for(int i = 0; i < p; i++) {
//         ret *= n;
//     }
//     return ret;
// }

 
        //println(x + " " + vx + " " + ax + "             " + y + " " + vy + " " + ay);
       // println(toThe(2, 5));
