class Level{
    private ArrayList<Bird> birds;
    private ArrayList<Pig> pigs;
    private ArrayList<Obstacle> obstacles;
    private Slingshot sling;
    private boolean ended;
    public Level(int id, Engine engine){
        ended = false;
        switch(id){
          case 0:
            birds = new ArrayList<Bird>();
            birds.add(new Bird(200,500,20,engine));
            birds.add(new Bird(200,500,100,engine));
            sling = new Slingshot(birds,200,500);


            obstacles = new ArrayList<Obstacle>();
            obstacles.add(new Obstacle(780,700,40,120,3,100,engine));
            obstacles.add(new Obstacle(880,700,40,120,3,100,engine));

            pigs = new ArrayList<Pig>();
            pigs.add(new Pig(830,700,25,100,engine));
            break;
          case 1:
            birds = new ArrayList<Bird>();
            birds.add(new Bird(200,500,20,engine));
            birds.add(new Bird(200,500,100,engine));
            sling = new Slingshot(birds,200,500);


            obstacles = new ArrayList<Obstacle>();
            obstacles.add(new Obstacle(1000,700,40,120,3,100,engine));
            obstacles.add(new Obstacle(1100,700,40,120,3,100,engine));

            pigs = new ArrayList<Pig>();
            pigs.add(new Pig(1150,700,25,100,engine));
            break;
        }
    }

    public void load(Engine engine){
          if (birds.size() != 0){
             birds.get(0).getBody().getFixtureList().setSensor(false); 
          }
          
      if (birds.size() == 0) { // lose
          background(30, 0, 0);
      
          fill(180, 0, 0);
          rectMode(CORNER);
          rect(0, 0, 1600, 800);
      
          fill(255);
          textAlign(CENTER, CENTER);
      
          textSize(90);
          text("YOU LOST", 800, 300);
      
          textSize(40);
          text("Press R to Restart", 800, 430);
      
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
          if (birds.size() != 0){
             birds.get(0).getBody().getFixtureList().setSensor(false); 
          }
        }
        
        for (Obstacle o : obstacles){
            o.display(engine);
        }
        
        for (Pig p : pigs) {
            p.display(engine);
        }
        
        
        if (pigs.size() == 0) { // win
            background(0, 40, 0);
        
            fill(0, 180, 80);
            rectMode(CORNER);
            rect(0, 0, 1600, 800);
        
            fill(255);
            textAlign(CENTER, CENTER);
        
            textSize(90);
            text("LEVEL COMPLETE!", 800, 300);
        
            textSize(40);
            text("Press N for Next Level", 800, 430);
        
            ended = true;
        }
        }
    }
    
    public boolean ended(){
      return ended;
    }

}
