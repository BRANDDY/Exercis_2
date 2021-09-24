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
    int dir;//l-0 r-1 f-2 b-3
    PImage img;
    PVector loc;
    int speed;
    
    Mover(int d,int l,int locY) {
        dir = d;
        switch(d) {
            case 0 : speed = 1;break;
            case 1 : speed = -1;break;
        }
        loc = new PVector(speed*int(random(50,100))+ l,locY);
        println(loc.x);
        setImg();
    }
    
    void update(int i,Mover[] a) {
        image(img, loc.x,loc.y);
        loc.x -= speed;
        reset(a,i);
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
    
    void reset(Mover[] a,int i) {
        if ((loc.x < - 20 &&  dir == 0) ||  loc.x>500 &&  dir == 1) {
            setImg();
            if (i ==  0) {
                a[i].loc.x = a[maxN-1].loc.x + int(random(30,100))*speed;
            } else{
                a[i].loc.x = a[i - 1].loc.x + int(random(30,100))*speed;
            }
        }
        loc.x = a[i].loc.x;
    }
}