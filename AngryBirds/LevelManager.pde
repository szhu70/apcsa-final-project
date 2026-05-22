Engine physics = new Engine(this);
Body ground;
Body box;
Body circle;

void setup(){
    size(1200,800);
    physics.createGround(width/2,height,width,40);
    ground = physics.createGround(width/2, height-20, width, 100);
    box = physics.createBox(width/2+100, height/2, 10,100, 0.1);
    circle = physics.createCircle(150, 300, 50, 0.1);
}

void draw(){
    background(0,0,0);
    physics.update();
    physics.displayBox(box, 10, 100);
    physics.displayCircle(circle, 50);
}
void mousePressed(){
  Vec2 force = new Vec2(300,0);
  physics.applyForce(circle, force);
}
