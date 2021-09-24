PImage bg;
int maxN = 10;//the max at once
Mover[][] moves;
/*Mover[] movesL1;
Mover[] movesL2;
Mover[] movesR1;
Mover[] movesR2;*/
//Mover move;

void setup() {
    size(500,300,P2D);
    bg = loadImage("bg.png");
    background(bg);
    //////////////////////////////
    setstart();
}

void draw() {
    background(bg);
    updateMover();
}

void mousePressed() {
    textSize(20);
    text(mouseX, mouseX, mouseY + 20);
    text(mouseY, mouseX + 40, mouseY + 20);
}

void setstart() {
    moves = new Mover[4][maxN];
    
    for (int i = 0;i < 4;i++) {
        if (i ==  0 ||  i ==  1) {
            moves[i][0] = new Mover(i,int(random( -50,0)));
        } else if (i ==  2 ||  i ==  3) {
            moves[i][0] = new Mover(i,int(random(250,300)));
        }
        for (int t = 1;t < maxN;t++) {
            moves[i][t] = new Mover(i,int(moves[i][t - 1].loc.x));
        }
    }
}
void updateMover() {
    for (int i = 0;i < 4;i++) {
        for (int t = 0;t < maxN;t++) {
            moves[i][t].update(i,t,moves);
        }
    }
}