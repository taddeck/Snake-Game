class Food {

  private PVector food;


  public Food() {

    food = new PVector(scl() * floor(random(gridSize)), scl() * floor(random(gridSize)));
  }

  public void drawFood() {

    fill(255, 0, 0);
    rect(food.x, food.y, scl(), scl());
    
  }
  
  
  

  
  
  
  public int getX(){
    
   return floor(food.x); 
  }
  
  
  public int getY(){
    
   return floor(food.y); 
  }
  
  
  
  
  
  
  
}





  
  
  
  
  
  
  
  
