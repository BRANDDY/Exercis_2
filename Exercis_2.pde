PImage bg;
int maxCar = 10;//the max at once
int maxHum = 40;
Mover[][] moves;
Hum[][] men;

void setup() {
    size(500,300,P2D);
    bg = loadImage("bg.png");
    background(bg);
    //——————————————————————————————
    setCar();
    setHum();
}

void draw() {
    background(bg);
    updateMover();
    updateHum();
}

void mousePressed() {
    textSize(20);
    text(mouseX, mouseX, mouseY + 20);
    text(mouseY, mouseX + 40, mouseY + 20);
}
/////////
void setCar() {
    moves = new Mover[4][maxCar];
    for (int i = 0;i < 4;i++) {
        if (i ==  0 ||  i ==  1) {
            moves[i][0] = new Mover(i,int(random( -50,0)));
        } else if (i ==  2 ||  i ==  3) {
            moves[i][0] = new Mover(i,int(random(250,300)));
        }
        for (int t = 1;t < maxCar;t++) {
            moves[i][t] = new Mover(i,int(moves[i][t - 1].loc.x));
        }
    }
}
void updateMover() {
    for (int i = 0;i < 4;i++) {
        for (int t = 0;t < maxCar;t++) {
            moves[i][t].update(i,t,moves);
        }
    }
}
/////////
void setHum(){
    men=new Hum[2][maxHum];
    for(int i=0;i<2;i++){
        for (int t=0;t<maxHum;t++){
            men[i][t]=new Hum(i);
        }
    }
}
void updateHum(){
    for (int i=0;i<2;i++){
        for(int t=0;t<maxHum;t++){
            men[i][t].update(i);
        }
    }
}