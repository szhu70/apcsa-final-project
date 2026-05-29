class Bird extends Entity{
  private boolean isLaunched;
  private float radius;
  public Bird(float x, float y, float radius, Engine physics){
    body = physics.createCircle(x,y,radius,0.5);
    this.radius = radius;
    isLaunched = false;
    body.setType(BodyType.STATIC);
    body.setUserData(this);
    body.getFixtureList().setSensor(true); 
  }
  
  public void launch(Vec2 force, Engine physics){
    isLaunched = true;
    body.setType(BodyType.DYNAMIC);
    physics.applyForce(body,force);
  }
  
  public boolean isLaunched(){
     return isLaunched; 
  }
  
  public boolean isDestroyed(){
    return (isLaunched && abs(body.getLinearVelocity().x) < 0.1 && abs(body.getLinearVelocity().y) < 0.01);
  }
  
  public float getRadius(){
     return radius; 
  }
  
  @Override
  void display(Engine physics){
    
    physics.displayCircle(body,radius,color(255,0,0)); 
  }
  
}
