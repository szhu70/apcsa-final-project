class Bird extends Entity{
  private boolean isLaunched;
  
  public Bird(){
    super();
    isLaunched = false;
  }
  
  public void launch(){
    isLaunched = true;
  }
  
  
  
}
