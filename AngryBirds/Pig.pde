class Pig extends Entity{
  private float health;
  
  public Pig(){
    health = 10;
  }
  
  public void takeDamage(float damage){ // damage should be calculated dynamically, the physics should be responsible for calculating these values. Looking back, health should also apply to obstacle.
    health -= damage;
  }
  
  
}
