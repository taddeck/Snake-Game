  import java.util.List;
  
  
  class Map{
 
    
    
    
  private Player player;
  private Food food;
  
  
  
  public Map(){
    
    player = new Player();
    food = new Food();
    
  }
  
  
  
  public void update(){
    
    background(0);
    
  }
  
  
  public void drawPlayer(){
    
   
    
    
    
    player.keyPressed();
    
    player.move();
    
    player.drawPlayer();
    food.drawFood();
    
    
    if(ckeckFoodEaten()){
      
      food = new Food();
      player.addSize();
      
    }
    
    if(player.gameOver()){
      
      player = new Player();
      food = new Food();
      
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
