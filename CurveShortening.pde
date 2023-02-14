ArrayList<Float> x = new ArrayList<>();
ArrayList<Float> y = new ArrayList<>();

int initX = 0;
int initY = 0;

float finX = 0;
float finY = 0;

int t = 0;

float[] xDiff = {};
float[] yDiff = {};

boolean done = false;
boolean mouseDown = false;
boolean beginFlow = false;

void setup() {
    size(800, 600);
}

void draw() {
    background(235, 228, 218);
    if (frameCount % 1 == 0) {
        if (mouseDown && !beginFlow) {
            x.add((float)mouseX);
            y.add((float)mouseY);
        }
    }
    for (int i = 0; i < x.size(); i++) {
        //ellipse(x.get(i), y.get(i), 2, 2);
        if (x.size() > 1) {
            if (i != x.size() - 1) {
                line(x.get(i), y.get(i), x.get(i+1), y.get(i+1));
            }
            //else {
                //if(beginFlow) {
                    //line(x.get(i), y.get(i), x.get(0), y.get(0));
               // }
            //}
        }
    }
    fill(0);
    //text("Draw a closed curve (preferably a funky one), then press space", 50, 30);
    text("t = " + (int)(t/2), 50, 50);
    if (beginFlow) {
        xDiff = new float[x.size()];
        yDiff = new float[y.size()];
        for (int i = 0; i < x.size(); i++) {
            float xAvg = 0;
            float yAvg = 0;
            if (i == 0) {
                xAvg = (x.get(1)+x.get(x.size()-1))/2;
                yAvg = (y.get(1)+y.get(y.size()-1))/2;
                //xAvg = (x.get(1)+initX)/2;
                //yAvg = (y.get(1)+initY)/2;
            }
            else if (i == x.size() - 1) {
                xAvg = (x.get(i-1)+x.get(0))/2;
                yAvg = (y.get(i-1)+y.get(0))/2;
                //xAvg = (x.get(i-1)+finX)/2;
                //yAvg = (y.get(i-1)+finY)/2;
            }
            else {
                xAvg = (x.get(i-1)+x.get(i+1))/2;
                yAvg = (y.get(i-1)+y.get(i+1))/2;
            }
            xDiff[i] = xAvg-x.get(i);
            yDiff[i] = yAvg-y.get(i);
        }
        for (int i = 0; i < x.size(); i++) {
            x.set(i, x.get(i)+(xDiff[i]));
            y.set(i, y.get(i)+(yDiff[i]));
        }
        t++;
    }
}

void mousePressed() {
    mouseDown = true;
    initX = mouseX;
    initY = mouseY;
}

void mouseReleased() {
    mouseDown = false;
}

void keyPressed() {
    if (key == ' ' & !beginFlow) {
        beginFlow = true;
        finX = x.get(x.size() - 1);
        finY = y.get(y.size() - 1);
    }
    else if (key == ' ' & beginFlow) {
        beginFlow = false;
    }
}
