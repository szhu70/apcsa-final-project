class Obstacle extends Entity{
  private float health;
  private float w,h,density;
  private boolean destroyed;
  //private String material;
  public Obstacle(float x, float y, float w, float h, float density, float health, Engine physics){
    body = physics.createBox(x,y,w,h,density);
    this.health = health;
    this.w = w;
    this.h = h;
    body.setUserData(this);
    destroyed = false;
  }
  
  public void takeDamage(float damage, Engine physics){ // damage should be calculated dynamically, the physics should be responsible for calculating these values. Looking back, health should also apply to obstacle.
    health -= damage;
    if (health <= 0){
      destroyed = true;
    }
  }
  
  public boolean isDestroyed() {
    return destroyed;
  }
  
  @Override
  void display(Engine physics){
    physics.displayBox(body,w,h);
  }
}
