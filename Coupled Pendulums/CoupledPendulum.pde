float m1 = 25;
float m2 = 25;
float y = 200;
float x2 = 200;
float x1 = 400;
float k = 0.5;
float ax1 = (k * (((400-x1) + (x2-200))))/m1;
float ax2 = -(k * (((400-x1) + (x2-200))))/m2;
float vx1 = 0;
float vx2 = 0;
boolean selectOrange = false;
boolean selectGreen = false;
boolean orangeSize = false;
boolean greenSize = false;
float orY = 200;
float grY = 200;

void setup() {
    size(600, 400);
    background(200);
}

void draw() {
    noStroke();
    background(200);
    if(selectOrange) {
        x1 = mouseX;
    }
    if(selectGreen) {
        x2 = mouseX;
    }
    else if (orangeSize) {
        if (mouseY > 50 && mouseY < 350) {
            //float pm1 = m1;
            m1 = 0.1 * (400 - mouseY);
            //vx1 = vx1/(Math.abs(vx1)) * (float)Math.sqrt(pm1*vx1*vx1/m1);
            vx1 = 0;
            ax1 = 0;
            vx2 = 0;
            ax2 = 0;
            orY = mouseY;
        }
    }
    else if (greenSize) {
        if (mouseY > 50 && mouseY < 350) {
            //float pm2 = m2;
            m2 = 0.1 * (400 - mouseY);
            vx1 = 0;
            ax1 = 0;
            //vx2 = vx2/(Math.abs(vx2)) * (float)Math.sqrt(pm2*vx2*vx2/m2);
            vx2 = 0;
            ax2 = 0;
            grY = mouseY;
        }
    }
    
    vx1 += ax1;
    vx2 += ax2;
    x1 += vx1;
    x2 += vx2;
    fill(220, 120, 20);
    ellipse(x1, y, m1 * 2, m1 * 2);
    fill(60, 180, 20);
    ellipse(x2, y, m2 * 2, m2 * 2);
    
    ax1 = (k * (((400-x1) + (x2-200))))/m1;
    ax2 = -(k * (((400-x1) + (x2-200))))/m2;
    
    
    fill(160);
    rect(550, 50, 20, 300);
    rect(30, 50, 20, 300);
    fill(100);
    rect(545, orY, 30, 10);
    rect(25, grY, 30, 10);
}

void mousePressed() {
    if(isNear(mouseX, mouseY, x1, y, sqrt(((m1*2)*(m1*2))))) {
        selectOrange = true;
    }
    else if (isNear(mouseX, mouseY, x2, y, sqrt(((m2*2)*(m2*2))))) {
        selectGreen = true;
    }
    else if(mouseX > 550 && mouseX < 570) {
        orangeSize = true;
    }
    else if(mouseX < 50 && mouseX > 30) {
        greenSize = true;
    }
}

void mouseReleased() {
    selectOrange = false;
    orangeSize = false;
    selectGreen = false;
    greenSize = false;
}

boolean isNear(float x1, float y1, float x2, float y2, float threshold) {
    return sqrt(((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2))) <= threshold;
}
