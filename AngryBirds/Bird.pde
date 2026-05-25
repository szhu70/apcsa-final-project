class Bird extends Entity{
  private boolean isLaunched;
  private float radius;
  public Bird(float x, float y, float radius, Engine physics){
    body = physics.createCircle(x,y,radius,0.5);
    this.radius = radius;
    isLaunched = false;
  }
  
  public void launch(Vec2 force, Engine physics){
    physics.applyForce(body,force);
    isLaunched = true;
  }
  @Override
  void display(Engine physics){
    physics.displayCircle(body,radius);
  }
  
}
