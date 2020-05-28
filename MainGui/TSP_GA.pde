



    class Tsp_Random extends PApplet{
               
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
//TSP_GA_021 objectRandom;
  void setup(){
    cp4 = new ControlP5(this);      
    cp = new ControlP5(this);
    cp2 = new ControlP5(this);
    cp3 = new ControlP5(this);
    
              cp.addTextlabel("randomLabel")
       .setText("TSP Random Cities Sketch")
         .setPosition(20,20).
             setColor(0xfafaf3f0)
               .setFont(f);
 
          
        cp.addBang("Generate").
             setPosition(width-170, 430).
               setSize( 50, 20);
    cp.addTextlabel("label")
            .setText("Generate Citites")
              .setPosition(70, 100-10)
              .setColorValue(0xffffff00)
                .setFont(createFont("Georgia",15 ));
               
      cp.addTextfield("numCitiesField")
              .setPosition(250-30, 100-20)
                .setColorValue(0xffafff00)
                  .setFont(createFont("Georgia",15));
      
       
          
  cp2.addTextlabel("label2")  
        .setText("max generations")
          .setPosition(70, 200-20)
            .setColorValue(0xffffff00)
              .setFont(createFont("Georgia",15) );
          
          cp2.addTextfield("max")
            .setPosition(250-30, 200-20)
              .setColorValue(0xffffff00)
                .setFont(createFont("Gerogia",15) );

                
              cp3.addTextlabel("population")
                    .setText("population size ")
                      .setPosition(70, 300-20)
                        .setFont(createFont("Georgia", 12));

                        cp3.addTextfield("population_field")  
                         .setPosition(250-30, 300-20)
                          .setFont(createFont("Georgia",12))
                            
                               ;


              cp.addSlider("elitismCount")
                      .setPosition(450, 100)
                        .setRange(0, 10)
                          .setSize(20,200)
                          .setNumberOfTickMarks(10)
                          .setSliderMode(Slider.FLEXIBLE);

  
  
                
        cp2.addSlider("crossoverRate")
            .setPosition(70,350)
              .setRange(0,0.9)
                .setSize(200, 20)
                  ;
                  
                
        cp3.addSlider("tournamentSize")
            .setPosition(70,450)
              .setRange(0,9)
              .setValue(6)
                .setSize(200, 20)
                  ;
                  
                  
                           
        cp4.addSlider("mutationRate")
            .setPosition(70,400)
              .setRange(0,0.9)
              .setValue(0.001)
                .setSize(200, 20)
                 ;
}




          void settings(){
          
            size( 600, 550);
          }
  
    public void Generate(){
          String[] args={"TSP_GA_02"};
          numCities = cp.get(Textfield.class,"numCitiesField").getText();
            int numCitiesInt =Integer.parseInt(numCities);
              maxGenerationsString =cp2.get(Textfield.class,"max").getText();
              int maxGenerationInt =Integer.parseInt(maxGenerationsString);
         
         populationStr =cp3.get(Textfield.class,"population_field").getText();
         int populationInt = Integer.parseInt(populationStr);
          crossoverRateDouble = crossoverRate ;
          mutationRateDouble = mutationRate ;
        objectRandom =new TSP_GA_021(numCitiesInt, maxGenerationInt,populationInt,elitismCount,crossoverRateDouble
                    ,tournamentSize, mutationRateDouble);


        //object = new TSP_GA_021();
        PApplet.runSketch(args,objectRandom);
    }
  
  
  
  
  
  void draw(){
    background(0);
  }
  
          void exit(){
          dispose();
          objectRandom = null;
            }
    } // end of classs
