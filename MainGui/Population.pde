import java.util.Arrays;
import java.util.Comparator ;
import java.util.*;

public  class Population {
      
        private Individual population[] ;
        private double populationFitness =-1;
        
        
        // 1-st constructor 
        public Population( int populationSize){
          this.population = new Individual[populationSize ];
        }
    
    
      // 2nd constructor
          public Population( int populationSize, 
                      int chromosomeLength){
                      
                        this.population = new Individual[populationSize];
                        for(int individualCount =0; individualCount<populationSize;
                              individualCount++){
                              
                              Individual individual = new 
                                Individual(chromosomeLength);
                              this.population[individualCount] = individual;
                            } // end of for loop
                      }// end of 2-nd construnctor 
        
        
        
        
         
        
        // 2nd method of pop: class
          // setPopulation
          
            public void setPopulationFitness(double fitness){
                this.populationFitness =fitness;
              } // end of populationFitness
              
              public int size(){
              
                return this.population.length;
              }

            public Individual[] getIndividual(){
            
            return this.population;
          } // end of getIndividual method
          
          
          public Individual setIndividual(int offset, Individual individual){
              
                return population[offset] = individual;
          } // end of setIndividual() method
          
            public Individual getIndividual(int offset){
            
                return population[offset];
            } // end of getIndividual() method
            
            public void shuffle(){
                Random rnd = new Random();
                for( int i =population.length-1; i>0;i--){
                
                    int index = rnd.nextInt (i+1);
                    Individual a  = population[index];
                    population[index] =population[i];
                    population[i]=a;
                }
            
            }
        
        public Individual getFittest( int offset ){
          Arrays.sort( this.population, new Comparator<Individual>(){
            
            public int compare( Individual o1, Individual o2){
              if(o1.getFitness()> o2.getFitness() ){
                return -1 ;
              }
                else if (o1.getFitness() < o2.getFitness()) {
                return 1;
                  }
                  return 0;
            }
          } );
          return this.population[offset] ;
        }
        
        
        
      
          // 1-st method of population class 
          // getIndividual()
          
            public Individual[] getIndividuals(){
            return this.population;}
          }// end of individual method
          
          
              
              
