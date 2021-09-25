/*
int l1=110;
int l2=130;
int r1=190;
int r1=210;
int f1=280;
int f2=300;
int b2=328;
int b2=348;
*/

class Mover {
    int dir;//l-0 r-1 f-2 b-3(for set image)
    int dirN;//left 1 ;right -1(for set dir of way)
    int locY;
    PImage img;
    PVector loc;
    int speed;
    
    Mover(int line,int l) {
        setLoc(line);
        loc = new PVector(speed * int(random(50,100)) + l,locY);
        setImg();
    }
    
    void update(int i,int t,Mover[][] a) {
        image(img, loc.x,loc.y);
        loc.x -= speed*2;
        reset(a,i,t);
    }
    
    void setImg() {
        int n = int(random(0,3));
        for (int i = 0;i < 3;i++) {
            for (int t = 0;t < 4;t++) {
                if ((n == i) && (dir ==  t)) {
                    img = loadImage("car" + i + "-" + t + ".png"); break;
                }
            }      
        }
    }
    
    void setLoc(int line) {
        switch(line) {
            case 0 : dir = 0; speed = 1; locY = 110;break;
            case 1 : dir = 0; speed = 1; locY = 130;break;
            case 2 : dir = 1; speed = -1; locY = 170;break;
            case 3 : dir = 1; speed = -1; locY = 190;break;
        }
    }
    
    void reset(Mover[][] a,int i,int t) {
        if ((loc.x < - 20 &&  dir == 0) ||  loc.x>500 &&  dir == 1) {
            setImg();
            if (t ==  0) {
                a[i][t].loc.x = a[i][maxCar - 1].loc.x + int(random(30,150)) * speed;
            } else{
                a[i][t].loc.x = a[i][t - 1].loc.x + int(random(30,150)) * speed;
            }
            if (dir == 0 && a[i][t].loc.x < 500) {
                a[i][t].loc.x = 500;
            } else if (dir == 1 && a[i][t].loc.x > 0) {
                a[i][t].loc.x = -20;
            }            
        }
        loc.x = a[i][t].loc.x;
    }
}