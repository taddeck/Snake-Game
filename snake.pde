  public int gridSize = 40;
  
  
  private Map map; 
  PFont font;
  private Data data;
  
  void setup(){
    
    
    map = new Map(); 
    data = new Data();
    
   
    size(900, 900);
    background(0);
   
    frameRate(5); 
    smooth(); 
    
    font = loadFont("ArialMT-48.vlw"); 
    textFont(font, 32); 
   
    println(scl());
    
    
  }




  void draw(){
    
    
    map.update();
    map.drawPlayer();
    
   
   
     
    
    
  }
