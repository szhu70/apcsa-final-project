import shiffman.box2d.*;

class Slingshot{
    Bird currentBird;
    Vec2 slingshotPosition;
    public Slingshot(Bird bird, float x, float y){
      currentBird = bird;
      slingshotPosition = new Vec2(x,y);
    }
    
    public Vec2 calculateForce(float mag){
      Vec2 mouse = new Vec2(mouseX, mouseY);
      Vec2 force = slingshotPosition.sub(mouse);
      return force.mul(mag);
    }
    
    void mouseDragged(){
       
    }
}
