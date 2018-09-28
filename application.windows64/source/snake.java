import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.List; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class snake extends PApplet {

  
  //Change to scale the game, the number are the blocks per row
  public int gridSize = 40;
  
  
  private Map map; 
 
  
  public void setup(){
    
    
    map = new Map(); 
    
    //Width and height has to be the same
    
    background(0);
       
     
    
    
  }




  public void draw(){
    
    
    map.update();
    map.drawPlayer();

    
 
    
    
  }
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
   
    frameRate(frameRate + 0.3f);
    
    
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
  public void settings() {  size(1000, 1000);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "snake" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
