public class Level{
    private int id;
    private int birdsAvailable;
    private int pigsCount;
    private ArrayList<Obstacle> obstacles;

    public Level(int level){
        switch(level){
            case 0:
//  This should be the last step of level design, so in hindsight this set of classes should be done last
            case 1:
//  This should be the last step of level design, so in hindsight this set of classes should be done last
        }
    }

    public load(){
        for (Obstacle : obstacles){
            update();
            display();
        }
    }

    public reset(){
        // rerun the constructor
    }

}