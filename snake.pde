  public int gridSize = 40;
  
  
  private Map map; 
  PFont font;
  
  void setup(){
    
    
    map = new Map(); 
    
   
    size(900, 900);
    background(0);
       
    smooth(); 
    
    font = loadFont("ArialMT-48.vlw"); 
    textFont(font, 32); 
   
    
    
    
  }




  void draw(){
    
    
    map.update();
    map.drawPlayer();
    println(frameRate);
    
   
   
     
    
    
  }
