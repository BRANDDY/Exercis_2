PImage bg;
int maxN=10;//the max at once
Mover[] movesL1;
Mover[] movesL2;
Mover[] movesR1;
Mover[] movesR2;
//Mover move;

void setup() {
    size(500,300,P2D);
    bg=loadImage("bg.png");
    background(bg);
    //////////////////////////////
    setstart();
}

void draw() {
    background(bg);
    updateMover();
}

void mousePressed(){
    textSize(20);
    text(mouseX, mouseX, mouseY+20);
    text(mouseY, mouseX+40, mouseY+20);
}

void setstart(){
    movesL1 = new Mover[maxN];
    movesL2 = new Mover[maxN];
    movesR1 = new Mover[maxN];
    movesR2 = new Mover[maxN];
    movesL1[0]=new Mover(0,int(random(-50,0)),110);
    movesL2[0]=new Mover(0,int(random(-50,0)),130);
    movesR1[0]=new Mover(1,int(random(250,300)),170);
    movesR2[0]=new Mover(1,int(random(250,300)),190);
    for(int i=1;i<maxN;i++){
        movesL1[i]=new Mover(0,int(movesL1[i-1].loc.x),110);
        movesL2[i]=new Mover(0,int(movesL2[i-1].loc.x),130);
        movesR1[i]=new Mover(1,int(movesR1[i-1].loc.x),170);
        movesR2[i]=new Mover(1,int(movesR1[i-1].loc.x),190);
    }
}
void updateMover(){
    for(int i=0;i<maxN;i++){
        movesL1[i].update(i,movesL1);
        movesL2[i].update(i,movesL2);
        movesR1[i].update(i,movesR1);
        movesR2[i].update(i,movesR2);
    }
}