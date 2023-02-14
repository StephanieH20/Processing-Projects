int len = 100;
float angle = PI/3;
float c = 1.4;
float t = 0;

void setup() {
    size(800, 800);
}

void draw() {
    background(30, 37, 60);
    strokeWeight(2);
    branch(400, 400, len, angle);
   angle = -(((t)));
    t += 0.05;
    if(t >= 2 * PI) t = 0;
     stroke(60, 90, 20);
}

void branch(float x, float y, float l, float a) {
    line(x, y, x - (l * cos(a)), y - (l * sin(a)));
    if(l > len/(c * c * c * c * c * c * c * c * c * c * c)) {
        branch(x - (l * cos(a)), y - (l * sin(a)), l/c, a + angle);
        branch(x - (l * cos(a)), y - (l * sin(a)), l/c, a - angle);
    }
}
