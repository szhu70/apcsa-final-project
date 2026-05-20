Engine physics = new Engine(this);
Body box;

void setup(){
  size(800,800);
  physics.createGround(width/2,height,width,40);
  box = physics.createBox(width/2, height/2, 500,500, 0.1);
}

void draw(){
     background(0,0,0);
     physics.update();
     physics.displayBox(box, 500, 500);
}
