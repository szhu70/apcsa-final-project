import org.jbox2d.dynamics.contacts.*;

ArrayList<Level> levels;
int currentLevel;
Engine engine;


void setup(){
  size(1200,800);
  engine = new Engine(this);
  // walls
  engine.createGround(width/2,height-50,width,100);
  engine.createGround(0, height/2, 0.1, height);
  engine.createGround(width, height/2, -0.1, height);
  engine.createGround(width/2,-1,width,0.1);
  
  levels = new ArrayList<Level>();
  levels.add(new Level(1, engine));
  
  currentLevel = 0;
}

void draw(){
  levels.get(currentLevel).load(engine);
}

void mousePressed(){
  if (!levels.get(currentLevel).ended()){
    Vec2 pos = engine.physics.getBodyPixelCoord(levels.get(currentLevel).birds.get(0).getBody());
    if(dist(mouseX,mouseY,pos.x,pos.y) < 30) {
      levels.get(currentLevel).sling.startDrag();
    }
  }
}

void mouseReleased(){
  if (!levels.get(currentLevel).ended())
    levels.get(currentLevel).sling.release(engine);
}

void keyPressed(){
  if (key == 'r') setup();
  if (key == 'n' && currentLevel < levels.size()) currentLevel++;
  if (key == 'b' && currentLevel > 0) currentLevel--;
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
