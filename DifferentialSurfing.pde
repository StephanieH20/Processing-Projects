int num = 5000;
float[] x = new float[num];
float[] y = new float[num];
color[] c = new color[num];
int t = 0;
float sy = 0;
int d = 50;

void setup() {
    size(700, 700);
    for(int i = 0; i < num; i++) {
        x[i] = 7*(float)Math.random(); //10
        y[i] = 7*(float)Math.random(); //4
        c[i] = color(random(150, 180), random(200, 230), random(200, 255));
    }
}

void draw() {
    background(155, 215, 255);
    t++;
    sy = 2*sin(t/4);
    for(int i = 0; i < num; i++) {
        float prevX = x[i];
        float prevY = y[i];
        x[i] += ((0.1*(x[i]) - 0.05*(x[i])*(y[i])) * 0.3);
        y[i] += ((-0.12*(y[i]) + 0.05*(x[i])*(y[i])) * 0.3);
        float slope = (prevY - y[i])/(prevX - x[i]);
        float x1 = x[i] + ((prevX - x[i])/(5*sqrt(((prevY - y[i])*(prevY - y[i]))+((prevX - x[i])*(prevX - x[i])))));
        float y1 = y[i] + ((prevY - y[i])/(5*sqrt(((prevY - y[i])*(prevY - y[i]))+((prevX - x[i])*(prevX - x[i])))));
        //fill(100, 150, 160, 40);
        //noStroke();
        stroke(50 - (10*x[i]), 135 - (10*x[i]), 160 - (10*x[i]), 40);
        strokeWeight(x[i]*20);
        if((x[i] > 4.5 && x[i] < 6 && y[i] > 1 && y[i] < 4)) {
            stroke(160 - (x[i]), 225 - (x[i]), 225 - (x[i]));
            strokeWeight(10);
        }
        line(x1 * 60, 700-y1 * 60, x[i] * 60, 700-y[i] * 60);
        stroke(c[i]);
        strokeWeight(5);
        line(x1 * 60, 700-y1 * 60, x[i] * 60, 700-y[i] * 60);
    }
    noStroke();
    fill(245, 200, 200);
    quad(340, 700-60+sy, 320, 700-55+sy, 280, 700-75+sy, 290, 700-80+sy);
    fill(220, 160-(d/1.2), 140-d);
    quad(290, 700-160+sy, 295, 700-170+sy, 310, 700-165+sy, 311, 700-140);
    quad(300, 700-100+sy, 320, 700-100+sy, 320, 700-70+sy, 315, 700-70+sy);
    //quad(310, 700-90+sy, 310, 700-80+sy, 300, 700-70+sy, 290, 700-70+sy);
    quad(290, 700-130+sy, 290, 700-140+sy, 275, 700-140+sy, 275, 700-135+sy);
    quad(320, 700-70+sy, 315, 700-70+sy, 305, 700-65+sy, 307, 700-60+sy);
    fill(200-d, 100-d, 60-d);
    quad(300, 700-150+sy, 320, 700-150+sy, 330, 700-120+sy, 305, 700-120+sy);
    quad(300, 700-150+sy, 310, 700-135+sy, 290, 700-130+sy, 290, 700-140+sy);
    fill(150-d, 40-d, 20-d);
    quad(305, 700-120+sy, 330, 700-120+sy, 320, 700-100+sy, 300, 700-100+sy);
    
    /*fill(255);
    textSize(25);
    text("[as]", 130, 585);*/
}
