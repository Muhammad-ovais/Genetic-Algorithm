  import controlP5.*;
  
  import org.gicentre.utils.spatial.*;
  import org.gicentre.utils.network.*;
  import org.gicentre.utils.network.traer.physics.*;
  import org.gicentre.utils.geom.*;
  import org.gicentre.utils.move.*;
  import org.gicentre.utils.stat.*;
  import org.gicentre.utils.gui.*;
  import org.gicentre.utils.colour.*;
  import org.gicentre.utils.text.*;
  import org.gicentre.utils.*;
  import org.gicentre.utils.network.traer.animation.*;
  import org.gicentre.utils.io.*;
  import java.util.*;
   import java.text.DecimalFormat;
  
  public class TSP_GA_021 extends PApplet{
 DecimalFormat df = new DecimalFormat("0.00");
    double fitness;
    String output="";
  PVector[] vector ;
  BestDistance bestDistance ;    
  XYChart lineChart;
    
    float[] xfloat ;
    float[] yfloat ;
      PFont f;  
      List<Float> data = new ArrayList<Float>();  
    public  int numCities ;
  ControlP5 cp1;
      public  int maxGenerations ;
      int generation;
     City[] cities ;
  Population population ;  
     GeneticAlgorithm ga ;
   Route route ;  
   Individual individual ;
         int populationSize;
         double mutationRate ;
        // =0.001 ;
         double crossoverRate ;
         int elitismCount  ;
         int tournamentSize ;
    
      public TSP_GA_021(int numCities, int maxGenerations, int populationSize, int elitismCount, double crossoverRate,
                int tournamentSize, double mutationRate){
        this.populationSize=populationSize ;
        this.numCities= numCities;
        this.maxGenerations = maxGenerations ;  
          this.elitismCount =elitismCount ;
          this.crossoverRate =crossoverRate;
          this.tournamentSize=tournamentSize;
          this.mutationRate = mutationRate;
        }
    void setup(){
  
        f= createFont("Courier", 32, true);
    
     
               
      textFont(createFont("Arial",10),10);
      lineChart = new XYChart(this);
    
    cities = new City[numCities];
      
    
    // loop to create random cities 
    
    for ( int cityIndex = 0; cityIndex < numCities ; cityIndex++){
            //generate to create random cities      
       int xPos = ( int ) (100* Math.random() );
       int yPos = (int ) ( 100 * Math.random() );
       
       // add city
       cities [cityIndex] = new City(xPos, yPos);
       
        } // end of for loop
        
        // intialize Ga
         ga  = 
        new GeneticAlgorithm ( populationSize, mutationRate, crossoverRate, elitismCount, tournamentSize) ;
        
        // initialize population 
        
         population = ga.initPopulation(cities.length);
        
        // TODO: Evaluation 
        ga.evalPopulation(population, cities);
        
        Route startRoute = 
            new Route(population.getFittest(0),cities);
            println("Start Distance: "+startRoute.getDistance() );
    fitness=(float)startRoute.getDistance();            
        //keep track of current generation 
         generation =0 ;
        
   
  
      
  } // end of setup() function
  
  
    void settings(){
    
      size(800, 600);
    }
  
        void exit(){
        
        dispose();
        objectRandom = null;
        }
    
    
    void draw(){
      //background(0);
      
    
               
                
                // print fittest individual from population
                 route = new Route ( population.getFittest(0), cities);
                  data.add((float)route.getDistance() );
             println("G"+generation+" Best distance: "+route.getDistance() );
            
          // TODO: apply crossover
          population=ga.crossoverPopulation(population);
          //TODO: Apply mutation
          population= ga.mutatePopulation(population);
          //Evaluate population
          ga.evalPopulation(population, cities);
          
          // increment the current generation 
          generation++;
       // println( "generation no: "+generation);
         displayInfo();
     
                
     
     if (generation==maxGenerations){
     //    println( "here condition false");  
  
      xfloat= new float[data.size()];
          for( int j=0; j<data.size(); j++){
              xfloat[j] =j;
       }
        yfloat = new float[data.size() ];
          for(int i=0; i< data.size();i++ ){
              
            yfloat[i]=data.get(i);
            }
              String[] args={"bestDistance"};
          bestDistance =new BestDistance(xfloat, yfloat);
         
          PApplet.runSketch(args,bestDistance);
     noLoop();
   
   }
      
      
                
                
    } // end of draw() function 
     
     void displayInfo(){
       background(255);
   //  textSize(32);
     textFont(f);
       if(fitness>route.getDistance()){
        fitness=route.getDistance();
      }
     textAlign(LEFT);
     fill(0);
     
     textSize(24);
     text("Best Distance: ", 20, 30);
     textSize(40);
     text(Float.toString((float)route.getDistance()), 20,100 );
     text("optimal Solution ", 20, 360);
      text(df.format(fitness), 20,400 );     
     
     textSize(18);
     text("Total Generations:      "+Integer.toString(generation),20, 160);
     
    
         textSize(18);
         text("Number of Cities:    "+numCities,20,180);
         text("Total Population:   "+maxGenerations, 20, 200);
         text("mutation rate:      "+df.format( (mutationRate*100) )+"%", 20, 220);
         text("population size:    "+populationSize,20,240);
         text("crossover rate:     "+df.format( (crossoverRate*100) )+"%",20, 260);
         text("elitism count:      "+elitismCount,20, 280);
         text("tournament size:    "+tournamentSize, 20, 300);
        
        
        textSize(10);
        text("All Distances:\n"+getAll(),500, 10);
     } // end of display() 
     
  
          public void BestDistance(){
          //  String[] args={"bestDistance"};
          //bestDistance =new BestDistance(xfloat, yfloat);
         
          //PApplet.runSketch(args,bestDistance);
      } // end of BestDistance() 
            public String getAll(){
              
          
                output +=Float.toString((float)route.getDistance())+"\n";
                
          return output;
            }
  
  } // end of class
