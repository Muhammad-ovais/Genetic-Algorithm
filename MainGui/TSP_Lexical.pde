  import controlP5.*;
  
  
 
 
     class Tsp_bruthforce extends PApplet{
     
            //This is simple 
  //TSP problem representation 
  // TSP with lexical order algorithm 
  // in which we go through with 
  // or visit point in dictionary or lexical order
  // this is bruthforce apprach ...
  // 
  
  //PVector[] cities ;
 // int totalCities  ;
 //int i=255;
 //int j=0;
 //int k=255;
 
    String getCities ;
  
   int count  =0; 
  
   
  //   import controlP5.*;
     color c =  color(218, 165, 32);
    ControlP5 cp5 ; 
   Textlabel generateCity ;
   
        void setup(){
       
          
          
         cp5 = new ControlP5(this);
  
  
        cp5.addTextlabel("bruth")
       .setText("TSP Brute force Sketch")
         .setPosition(10,20).
             setColor(0xfafaf3f0)
               .setFont(f);
 
    
          cp5.addBang("generate")
            .setPosition(250,150)
            .setSize( 50, 20);
            
            cp5.addSlider("i")
                .setPosition(250,300)
                .setRange(0,255);
                cp5.addSlider("j")
                    .setPosition(250,350)
                      .setRange(0,255);
                      
                      cp5.addSlider("k")
                          .setPosition(250,400)
                            .setRange(0,250);
            
            
                  
            cp5.addTextlabel("label")
                .setText("Generate Cities")
                  .setPosition(50, 70)
                  .setColorValue(0Xffffff00)
                  .setFont(createFont("Georgia",20) )
                  ;
          //cp5.addButton("Generate").setPosition(250, 150)
          //            .setSize( 50,20);
        
          cp5.addTextfield("input")
                .setPosition(250, 70).setSize(150, 20).setFocus(true).setColor(color(218,165,32));
        tsp = new TSP();
        
        }
        
          void settings(){
          
            size( 500, 450);
          }
        
        
        
        public void draw(){
        
          background(0);
        }
        
        
        public void generate(){
        
          getCities  = cp5.get(Textfield.class,"input").getText();
          totalCities = Integer.parseInt(getCities);
          String[] args ={"Tsp"};
          tsp = new TSP();
          PApplet.runSketch(args, tsp);
          
          }
          
          void exit(){
            dispose();
            tsp_Bruthforce=null;
          }
     
     
     }
