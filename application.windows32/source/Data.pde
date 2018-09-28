 PFont font;
 

class Data{
  
  private int score;
  private int highScore;
  
  
  
  
  public Data(){
    
    font = loadFont("ArialMT-48.vlw"); 
    textFont(font, (width / 40)); 
    
    
    this.highScore = 0;
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
  
  public void drawScore(){
    
    fill(0);
    text("Score: " + this.score,  width / 100, width / 30);
    text("Highscore: " + this.highScore,  width / 100, width / 15);
    
  }
  
  
  public void resetScore(){
   this.score = 0;
   frameRate(5);
    
  }
  
  
  public void checkHighScore(){
    
    if(this.score > this.highScore) this.highScore = this.score;
    
  }
  
  
}
