public class LevelManager{
    private ArrayList<Level> levels;
    private int currentLevel;

    public LevelManager(){
        levels = new ArrayList<Level>;
        currentLevel = 0;
    }

    public void loadNextLevel(){
        currentLevel++;
    }

    public void loadPreviousLevel(){
        currentLevel--;
    }

    public void checkWin(){

//        loadNextLevel();
    }

}