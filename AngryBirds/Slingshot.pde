import shiffman.box2d.*;

class Slingshot{
    private ArrayList<Bird> birds;
    private Vec2 slingshotPosition;
    private boolean dragging = false;
    private float maxStretch = 100;
    
    public Slingshot(ArrayList<Bird> birds, float x, float y){
      this.birds = birds;
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
     birds.get(0).launch(force.mul(birds.get(0).getRadius()), physics);
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
    
      birds.get(0).body.setTransform(physics.physics.coordPixelsToWorld(mouse.x, mouse.y), 0);
      birds.get(0).body.setLinearVelocity(new Vec2(0,0));
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
