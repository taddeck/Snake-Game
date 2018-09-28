class Player {

  private List<PVector> snake;
  private int direc;
  private PVector acc;

    public Player() {

    this.snake = new ArrayList();
    this.snake.add(new PVector((gridSize / 2) * scl(), (gridSize / 2) * scl()));
    this.acc = new PVector(0, scl());
    this.direc = 1;
  }



  public void drawPlayer() {

    for(int i = 0; i < snake.size(); i++){
    
      fill(102, 51, 51);
      rect(snake.get(i).x, snake.get(i).y, scl(), scl());
    
    }
    
  }



  public void keyPressed(){

    
    switch(keyCode){
      
      
      case UP:  
      
      
      if(this.direc != 3){
        
          this.acc.x = 0;
          this.acc.y = -scl();
          
          this.direc = 1;
          
          
      }
          
          break;
          
      
      case RIGHT:
      
      
      if(this.direc != 4){
      
          this.acc.x = scl();
          this.acc.y = 0;
          
          this.direc = 2;
          
          
      }
      
          break;
      
      
      case DOWN:
      
      
      if(this.direc != 1){
      
          this.acc.x = 0;
          this.acc.y = scl();
          
          this.direc = 3;
          
          
      }
          
          break;
      
      
      case LEFT:
      
      
      if(this.direc != 2){
      
          this.acc.x = -scl();
          this.acc.y = 0;
          
          this.direc = 4;
          
          

      }
          
          break;
      
    }
    

  }
  
  
  
  public void move() {
    
   
    
      for(int i = this.snake.size() -1; i > 0; i--){
      
        this.snake.set(i , new PVector(this.snake.get(i - 1).x, this.snake.get(i - 1).y));
        
      }
      
     this.snake.set(0, (this.snake.get(0).add(this.acc)));
     
     
    
  }



  public void addSize() {
    
    this.snake.add(new PVector());
    
    
  }
  
  
  
  
  
  
  public boolean gameOver(){
   
    for(int i = 1; i < this.snake.size(); i++){
    
      if(this.snake.get(0).x == this.snake.get(i).x && this.snake.get(0).y == this.snake.get(i).y) return true;
    
    }
    
    if(0 > this.snake.get(0).x || this.snake.get(0).x > width || 0 > this.snake.get(0).y || this.snake.get(0).y > height) return true;
    
    
    return false;
    
  }
  




  public int getYPos() {

    return floor(this.snake.get(0).y);
  }

  public int getXPos() {

    return floor(this.snake.get(0).x);
  }
  
  
  public int getSize(){
    
   return this.snake.size();
  }
  
  
  
  
  
  
}
