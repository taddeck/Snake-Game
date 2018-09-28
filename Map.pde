  import java.util.List;
  
  
  class Map{
 
    
    
    
  private Player player;
  private Food food;
  private Data data;
  
  
  
  public Map(){
    
    player = new Player();
    food = new Food();
    data = new Data();
    
    
  }
  
  
  
  public void update(){
    
    background(130);
    
  }
  
  
  public void drawPlayer(){
    
   
    
    
    
    player.keyPressed();
    
    player.move();
    
    food.drawFood();
    player.drawPlayer();
    data.drawScore();
    
    
    
    if(ckeckFoodEaten()){
      
      food = new Food();
      player.addSize();
      data.addScore(player.getSize());
      data.checkHighScore();
      
      
    }
    
    if(player.gameOver()){
      
      player = new Player();
      food = new Food();
      data.resetScore();
      
    }
    
  }
  
  
  
  
  public boolean ckeckFoodEaten(){
    
    if(player.getYPos() == food.getY() && player.getXPos() == food.getX()){
      
      return true;
      
      
    } else { 
      
      return false;
    }
    
    
  }
  
  
  
}






public int scl(){
    
    return floor(height / gridSize);
  }
