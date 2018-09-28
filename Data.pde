class Data{
  
  private int score;
  
  
  
  
  public Data(){
    
    this.score = 0;
    frameRate(5);
    
  }
  
  
  
  
  
  
  
  public int getScore(){
    
    return this.score;
  }
  
  
  public void addScore(int x){
    
    this.score += x * 3;
    gameSpeed();
  }
  
  
  private void gameSpeed(){
   
    frameRate(frameRate + 0.3);
    
    
  }
  
  
}
