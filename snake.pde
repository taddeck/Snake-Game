  
  //Change to scale the game, the number are the blocks per row
  public int gridSize = 40;
  
  
  private Map map; 
 
  
  void setup(){
    
    
    map = new Map(); 
    
    //Width and height has to be the same
    size(1000, 1000);
    background(0);
       
    smooth(); 
    
    
  }




  void draw(){
    
    
    map.update();
    map.drawPlayer();

    
 
    
    
  }
