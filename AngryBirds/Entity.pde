import shiffman.box2d.*;
abstract class Entity{
    protected Body body;

    Body getBody(){
      return body;
    }
    
    abstract void display(Engine physics);
}
