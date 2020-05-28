

//import controlP5.*;


        class Shakespere extends PApplet{
        
        
 
  ControlP5 cp;
  ControlP5 cp2;
  ControlP5 cp3;
    String  inputStr ;  
    String populationStr ;
    float mutationFloat ;
  
  void setup(){
   cp = new ControlP5(this);
    cp2 = new ControlP5(this);
      cp3 = new ControlP5(this);
        cp.addBang("Generate").
             setPosition(250, 280).
               setSize( 50, 20);
      
      
          
     cp.addTextlabel("Shakespeare")
       .setText("Monkey Theorem Metaphor")
         .setPosition(20,30).
             setColor(0xfafaf3f0)
               .setFont(f);      
      cp.addTextlabel("label")
            .setText("Phrase")
              .setPosition(70, 100)
              .setColorValue(0xffffff00)
                .setFont(createFont("Georgia",15 ));
                
                
                
                cp.addTextfield("input")
              .setPosition(250, 100)
                .setColorValue(0xffafff00)
                  .setFont(createFont("Georgia",15));
                  
                  
                  
                    
      cp2.addTextlabel("label")
            .setText("Populaton Size")
              .setPosition(70,200)
              .setColorValue(0xffffff00)
                .setFont(createFont("Georgia",15 ));
                
                
                   
                cp2.addTextfield("size")
              .setPosition(250, 200)
                .setColorValue(0xffafff00)
                  .setFont(createFont("Georgia",15));
                
                
                
        
                
      
          cp.addSlider("mutationStr")
              .setPosition(500, 100)
                .setSize(20, 200)
                  .setRange(0,0.1)
                    .setValue(0.001);
    
    }
  
  
  
  
  void settings(){
  
      size ( 600,500);
  }
  
  
  void draw(){
    background(0);
  }
  
  
    public void Generate(){
  
         String[] args={"ShakesPere monkey"};
      inputStr =cp.get(Textfield.class,"input").getText();
     populationStr =cp2.get(Textfield.class,"size").getText();
      int populationInt = Integer.parseInt(populationStr);
      
         
    ga_monkey_object = new GA_Monkey(inputStr, populationInt, mutationFloat);   
    PApplet.runSketch(args, ga_monkey_object);
      
    }
        
          void exit(){
          shakespereObject= null;
            dispose();
          }
        
        } // end of class shakespere
