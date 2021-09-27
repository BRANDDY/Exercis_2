class Hum{
    PImage img;
    PVector loc;
    int dir;//image left/right
    int dirN;//go l 1/r -1
    int imgN;
    float speed = 0.5;
    
    Hum(int i) {
        setImg();
        setLoc(i);
        image(img,loc.x,loc.y);
    }
    void update(int i) {
        reset();
        run();
        loc.x = loc.x - speed * dirN;
    }
    void setLoc(int i) {
        switch(i) {
            case 0 : loc = new PVector(random(0,500),random(80,90));break;
            case 1 : loc = new PVector(random(0,500),random(200,240));break;
        }
    }
    void reset() {
        speed = random(0.01,1);
        if ((loc.x < - 20 &&  dir == 0) ||  loc.x>500 &&  dir == 1) {
            switch(dirN) {
                case 1 : loc = new PVector(500,loc.y);break;
                case - 1 : loc = new PVector( -20,loc.y);break;             
            }
            setImg();
        }
    }
    void setImg() {
        dir = int(random(0,2));
        imgN = int(random(0,4));
        switch(dir) {
            case 0 : dirN = 1; break;
            case 1 : dirN =-  1; break;
        }
        img = loadImage("man" + imgN + "-" + dir + ".png");
    }
    void run() {
        int r = int(random(28,30));
        //println(r);
        int s = frameCount % r;
        if (s < r/4*3+0.1) {
            img = loadImage("man" + imgN + "-" + dir + ".png");
        } else if ((s > r/4*3) && (s  < r)) {
            img = loadImage("man" + imgN + "-" + dir + "s.png");
        }    
        image(img,loc.x,loc.y); 
    }
}