import shiffman.box2d.*;

class Slingshot{
    private Bird currentBird;
    private Vec2 slingshotPosition;
    private boolean dragging = false;
    private float maxStretch = 100;
    
    public Slingshot(Bird bird, float x, float y){
      currentBird = bird;
      slingshotPosition = new Vec2(x,y);
    }
    
    public void startDrag(){
      //if (currentBird.isLaunched()) return;
      dragging = true;
    }
    
    public void release(Engine physics){
     if (!dragging) return;
     //if (currentBird.isLaunched()) return; // one  time
     Vec2 mouse = new Vec2(mouseX, mouseY);
     Vec2 force = slingshotPosition.sub(mouse);
     force.y = force.y * -1;
     currentBird.launch(force.mul(5), physics);
     dragging = false;
    }
    
    public void dragBird(Engine physics){
      if(!dragging) return;
      Vec2 mouse = new Vec2(mouseX,mouseY);
      Vec2 dir = mouse.sub(slingshotPosition);
      if(dir.length() > maxStretch){
        dir.normalize();
        dir = dir.mul(maxStretch);
        mouse = slingshotPosition.add(dir);
      }
    
      currentBird.body.setTransform(physics.physics.coordPixelsToWorld(mouse.x, mouse.y), 0);
      currentBird.body.setLinearVelocity(new Vec2(0,0));
    }
    
    void display(){
      stroke(80);
      strokeWeight(5);
      line(slingshotPosition.x - 10, slingshotPosition.y, slingshotPosition.x + 10, slingshotPosition.y);
      if (dragging) {
        Vec2 mouse = new Vec2(mouseX, mouseY);
        Vec2 dir = mouse.sub(slingshotPosition);
        if(dir.length()>maxStretch){
          dir.normalize();
          dir = dir.mul(maxStretch);
          mouse = slingshotPosition.add(dir);
        }
        line(slingshotPosition.x, slingshotPosition.y, mouse.x, mouse.y);
      }
    }
    
}
