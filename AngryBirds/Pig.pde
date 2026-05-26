class Pig extends Entity{
  private float health;
  private float radius;
  public Pig(float x, float y, float radius, float health, Engine physics){
    body = physics.createCircle(x,y,radius,0.5);
    this.radius = radius;
    this.health = health;
    body.setUserData(this);
  }
  
  public void takeDamage(float damage, Engine physics){ // damage should be calculated dynamically, the physics should be responsible for calculating these values. Looking back, health should also apply to obstacle.
    health -= damage;
    if (health <= 0){
      physics.destroyBody(body);
    }
  }
  
  @Override
  void display(Engine physics){
    if (health > 0) physics.displayCircle(body, radius);
  }
}
