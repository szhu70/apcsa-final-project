class Obstacle extends Entity{
  private float health;
  private float w,h,density;
  //private String material;
  public Obstacle(float x, float y, float w, float h, float density, float health, Engine physics){
    box = physics.createBox(x,y,w,h,density);
    this.health = health;
  }
  
  public void takeDamage(float damage){ // damage should be calculated dynamically, the physics should be responsible for calculating these values. Looking back, health should also apply to obstacle.
    health -= damage;
  }
}
