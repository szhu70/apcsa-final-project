Engine engine;
Bird bird;
Slingshot sling;
ArrayList<Bird> birds;
ArrayList<Obstacle> obstacles;
ArrayList<Pig> pigs;
Body ground;
Body leftWall;
Body rightWall;
Body ceiling;

void setup(){
  size(1200,800);
  engine = new Engine(this);
  ground = engine.createGround(width/2,height-50,width,100);
  leftWall = engine.createGround(0, height/2, 0.1, height);
  rightWall = engine.createGround(width, height/2, -0.1, height);
  ceiling = engine.createGround(width/2,-1,width,0.1);
  
  birds = new ArrayList<Bird>();
  birds.add(new Bird(200,500,20,engine));
  
  sling = new Slingshot(birds.get(0),200,500);
  
  obstacles = new ArrayList<Obstacle>();
  obstacles.add(new Obstacle(780,700,40,120,3,100,engine));
  obstacles.add(new Obstacle(880,700,40,120,3,100,engine));
  
  pigs = new ArrayList<Pig>();
  pigs.add(new Pig(830,700,25,100,engine));
}

void draw(){
  background(200);
  engine.update();
  
  fill(0,255,0);
  rectMode(CENTER);
  rect(width/2, height-50, width, 100); //floor
  
  sling.display();
  sling.dragBird(engine);
  
  birds.get(0).display(engine);
  
  for (Obstacle o : obstacles){
    o.display(engine);
  }
  
  for (Pig p : pigs) {
    p.display(engine);
  }
  
}

void mousePressed(){
  Vec2 pos = engine.physics.getBodyPixelCoord(birds.get(0).getBody());
  if(dist(mouseX,mouseY,pos.x,pos.y) < 30) {
    sling.startDrag();
  }
}

void mouseReleased(){
  sling.release(engine);
}
