
      import controlP5.*;

  // Table table =  loadTable("data.csv","header");
  
 
      
  
  
  
  
  
     class GA_Benchmark extends PApplet{
     
  
  
   ControlP5 cp;
  ControlP5 cp2;
  ControlP5 cp3;
  ControlP5 cp4;
  String numCities ;
  String populationStr ;
  String maxGenerationsString ;
  int elitismCount;
  float crossoverRate;
  double crossoverRateDouble ;
  int tournamentSize ;
    double mutationRateDouble ;  
  float mutationRate ;
  
  
   
             void setup(){
               //table =  loadTable("data.csv","header");
    cp4 = new ControlP5(this);      
    cp = new ControlP5(this);
    cp2 = new ControlP5(this);
    cp3 = new ControlP5(this);
  
        
              cp.addTextlabel("benchmark")
       .setText("TSP Benchmark Sketch")
         .setPosition(20,30).
             setColor(0xfafaf3f0)
               .setFont(f);
 
        
        
        cp.addBang("Generate").
             setPosition(300, 450).
               setSize( 50, 20);
   
    
       
          
  cp2.addTextlabel("label2")  
        .setText("max generations")
          .setPosition(100-20, 100)
            .setColorValue(0xffffff00)
              .setFont(createFont("Georgia",15) );
          
          cp2.addTextfield("max")
            .setPosition(250-20, 100)
              .setColorValue(0xffffff00)
                .setFont(createFont("Gerogia",15) );

                
              cp3.addTextlabel("population")
                    .setText("population size ")
                      .setPosition(100-20, 200)
                        .setFont(createFont("Georgia", 12));

                        cp3.addTextfield("population_field")  
                         .setPosition(250-20, 200)
                          .setFont(createFont("Georgia",12))
                            
                               ;


              cp.addSlider("elitismCount")
                      .setPosition(500, 100)
                        .setRange(0, 10)
                          .setSize(20,200)
                          .setNumberOfTickMarks(10)
                          .setSliderMode(Slider.FLEXIBLE);

  
  
                
        cp2.addSlider("crossoverRate")
            .setPosition(80,300)
              .setRange(0,0.9)
                .setSize(200, 20)
                  ;
                  
                
        cp3.addSlider("tournamentSize")
            .setPosition(80,350)
              .setRange(0,9)
              .setValue(6)
                .setSize(200, 20)
                  ;
                  
                  
                           
        cp4.addSlider("mutationRate")
            .setPosition(80,400)
              .setRange(0,0.9)
              .setValue(0.001)
                .setSize(200, 20)
                 ;
}

         void settings(){
          
            size( 600, 550);
          }
                         
            void draw(){
              background(0);
            }
              
               public void Generate(){
          String[] args={"TSP_GA_02"};
         // numCities = cp.get(Textfield.class,"numCitiesField").getText();
           // int numCitiesInt =Integer.parseInt(numCities);
              maxGenerationsString =cp2.get(Textfield.class,"max").getText();
              int maxGenerationInt =Integer.parseInt(maxGenerationsString);
         
         populationStr =cp3.get(Textfield.class,"population_field").getText();
         int populationInt = Integer.parseInt(populationStr);
          crossoverRateDouble = crossoverRate ;
          mutationRateDouble = mutationRate ;
        object =new TSP_GA_022Class( maxGenerationInt,populationInt,elitismCount,crossoverRateDouble
                    ,tournamentSize, mutationRateDouble);


        //object = new TSP_GA_021();
        PApplet.runSketch(args,object);
    }
     
    void exit(){
      dispose();
      ga_Benchmark=null;
    
    }     
     
     } // end of class GA_Benchmark
