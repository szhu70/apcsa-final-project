class Bird extends Entity{
  private boolean isLaunched;
  private float radius;
  public Bird(float x, float y, Engine physics){
    body = physics.createCircle(x,y,radius,0.5);
    isLaunched = false;
  }
  
  public void launch(){
    isLaunched = true;
  }
  
  
}
