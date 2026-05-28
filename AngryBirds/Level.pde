class Level{
    private ArrayList<Bird> birds;
    private ArrayList<Pig> pigs;
    private ArrayList<Obstacle> obstacles;
    private Slingshot sling;
    private boolean ended;
    public Level(int id, Engine engine){
        ended = false;
        switch(id){
          case 1:
            birds = new ArrayList<Bird>();
            birds.add(new Bird(200,500,20,engine));
            birds.add(new Bird(200,500,50,engine));
            sling = new Slingshot(birds.get(0),200,500);


            obstacles = new ArrayList<Obstacle>();
            obstacles.add(new Obstacle(780,700,40,120,3,100,engine));
            obstacles.add(new Obstacle(880,700,40,120,3,100,engine));

            pigs = new ArrayList<Pig>();
            pigs.add(new Pig(830,700,25,100,engine));

        }
    }

    public void load(Engine engine){
      if (birds.size() == 0){
          fill(255,0,0);
          rect(width/2 - 100, height/2, width * 4 / 5, height * 4 / 5);
          fill(0,0,0);
          textSize(40);
          text("restart cuz ur not good", width/2, height/2);
          ended = true;
        } else {
        
        background(200);
        engine.update();

        fill(0,255,0);
        rectMode(CENTER);
        rect(width/2, height-50, width, 100); //floor
        
        sling.display();
        sling.dragBird(engine);
        
        birds.get(0).display(engine);
        
        for(int i = obstacles.size()-1; i >= 0; i--){
            if(obstacles.get(i).isDestroyed()){
            engine.destroyBody(obstacles.get(i).getBody());
            obstacles.remove(i);
            }
        }
        
        for(int i = pigs.size()-1; i >= 0; i--){
            if(pigs.get(i).isDestroyed()){
            engine.destroyBody(pigs.get(i).getBody());
            pigs.remove(i);
            }
        }
        
        if (birds.get(0).isDestroyed()){
          birds.remove(0);
        }
        
        for (Obstacle o : obstacles){
            o.display(engine);
        }
        
        for (Pig p : pigs) {
            p.display(engine);
        }
        
        
        if (pigs.size() == 0) {
          fill(0,255,0);
          rect(width/2 - 50, height/2, width * 4 / 5, height * 4 / 5);
          fill(0,0,0);
          textSize(40);
          text("YOU DID IT", width/2, height/2);
        }
        }
    }
    
    public boolean ended(){
      return ended;
    }

}
