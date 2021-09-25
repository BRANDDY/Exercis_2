class Hum{
    PImage img;
    PVector loc;
    int dir;//image left/right
    int dirN;//go l 1/r -1
    float speed=0.5;
    
    Hum(int i) {
        setImg();
        setLoc(i);
        image(img,loc.x,loc.y);
        //println(men[0][0].loc.x);
    }
    void update(int i) {
        loc.x= loc.x-speed*dirN;
        reset();
        image(img,loc.x,loc.y);
    }
    void setLoc(int i) {
        switch (i){
            case 0: loc = new PVector(random(0,500),random(80,90));break;
            case 1: loc = new PVector(random(0,500),random(200,240));break;
        }
    }
    void reset() {
        if ((loc.x < - 20 &&  dir == 0) ||  loc.x>500 &&  dir == 1){
            switch (dirN) {
                case 1: loc = new PVector(500,random(80,90));break;
                case -1: loc = new PVector(-50,random(200,240));break;             
            }
            setImg();
        }
    }
    void setImg() {
        dir = int(random(0,2));
        int n = int(random(0,4));
        switch(dir) {
            case 0 : dirN = 1; break;
            case 1 : dirN =-  1; break;
        }
        for (int i = 0;i < 4;i++) {
            for (int t = 0;t < 3;t++) {
                if(i==n&&t==dir)
                img = loadImage("man" + i + "-" + dir + ".png");
            }
        }
    }
}