import org.jbox2d.dynamics.contacts.*;

Level level;
int currentLevel;
int maxLevel;
Engine engine;



void setup(){
  size(1600,800);

  currentLevel = 0;
  maxLevel = 1;

  loadLevel();
}

void loadLevel(){

  engine = new Engine(this);

  // walls
  engine.createGround(width/2,height-50,width,100);
  engine.createGround(0, height/2, 0.1, height);
  engine.createGround(width, height/2, -0.1, height);
  engine.createGround(width/2,-1,width,0.1);

  level = new Level(currentLevel, engine);
}


void draw(){
  level.load(engine);
}

void mousePressed(){
  if (!level.ended()){
    Vec2 pos = engine.physics.getBodyPixelCoord(level.birds.get(0).getBody());
    if(dist(mouseX,mouseY,pos.x,pos.y) < 30) {
      level.sling.startDrag();
    }
  }
}

void mouseReleased(){
  if (!level.ended())
    level.sling.release(engine);
}

void keyPressed(){
  if (key == 'r') setup();
  if (key == 'n' && currentLevel < maxLevel) {
    currentLevel++;
    loadLevel();
  }
  if (key == 'b' && currentLevel > 0) {
    currentLevel--;
    loadLevel();
  }
}


void beginContact(Contact c){
  Body a = c.getFixtureA().getBody();
  Body b = c.getFixtureB().getBody();
  
  Object objectA = a.getUserData();
  Object objectB = b.getUserData();

  Vec2 va = a.getLinearVelocity();
  Vec2 vb = b.getLinearVelocity();

  float impact = va.sub(vb).length();

  if(impact < 5)return;

  if(objectA instanceof Obstacle){
    ((Obstacle) objectA).takeDamage(impact, engine);
  }
  
  if(objectB instanceof Obstacle){
    ((Obstacle) objectB).takeDamage(impact, engine);
  }

  if(objectA instanceof Pig){
    ((Pig) objectA).takeDamage(impact, engine);
  }
  
  if(objectB instanceof Pig){
    ((Pig) objectB).takeDamage(impact, engine);
  }
}
