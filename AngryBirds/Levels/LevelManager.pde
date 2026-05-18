public class LevelManager{
    private ArrayList<Level> levels;
    private int currentLevel;

    public LevelManager(){
        levels = new ArrayList<Level>;
        currentLevel = 0;
    }

    public void loadNextLevel(){
        currentLevel++;
        levels.get(currentLevel).load();
    }

    public void loadPreviousLevel(){
        currentLevel--;
        levels.get(currentLevel).load();
    }

    public void checkWin(){
        if (levels.get(currentLevel).pigsCount == 0;)
            loadNextLevel();
    }

}