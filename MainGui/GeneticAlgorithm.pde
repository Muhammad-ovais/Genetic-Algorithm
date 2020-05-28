    class GeneticAlgorithm{
    
      private int populationSize ;
      private double mutationRate ;
      private double crossoverRate ;
      private int elitismCount ;
      protected int tournamentSize;
      // constructor 
      public GeneticAlgorithm( int populationSize, 
            double mutationRate, double crossoverRate,
              int elitismCount ,int tournamentSize){
        
                // lets initialize parametar
                
                this.populationSize =populationSize ;
                this.mutationRate = mutationRate ;
                this.crossoverRate = crossoverRate ;
                this.elitismCount = elitismCount;
                this.tournamentSize = tournamentSize ;
              
              } //end of constructor 
              
              
              // firts method of Geneticalogrithm class
              // initialize population          
              public Population initPopulation (int chromosomeLength){
              
                  Population population = new Population(this.populationSize,
                      chromosomeLength );

                      return population ;
              
              } //end of initPopulation method
       
         // 2nd method calcFitness
         public double calcFitness(Individual individual, City cities[]){
         
           // get fitness
           Route route = new Route (individual, cities);
           double fitness =1/(route.getDistance() );
           
           return fitness ;
         } // end of calcFitness() method
         
         // 3rd method evalPopulation 
         public void evalPopulation( Population population, City cities[]){
           double populationFitness  =0;
           
           for(Individual individual :population.getIndividuals() ){
             
             populationFitness += this.calcFitness( individual, cities);
           }// end of for loop
           
           double avgFitness = populationFitness/population.size();
           population.setPopulationFitness (avgFitness);
         } // end of evalPopulation
         
         public boolean isTerminationConditionMet(int generation, int maxgenerations){
           
             if(generation==maxgenerations) {
               
             return true ;
             }
           return false ;
         }
         
           
           
           
           
             public Population crossoverPopulation(Population population){
                 
                 // create new population 
                 Population  newPopulation = new Population(population.size() );
                 
                 // loop over current population by fitness
                 
                 for ( int populationIndex =0; populationIndex< population.size();
                             populationIndex++){
                             
                             
                             //get parent1
                             Individual parent1 =
                                 population.getFittest(populationIndex);
                            //apply crossover to this individual?
                            if(this.crossoverRate >Math.random() &&
                                  populationIndex>=this.elitismCount){
                                  Individual parent2 = this.selectParent(population);
                                  
                                  //create blank offspring chromosome
                                  int offspringChromosome[] = new 
                                    int[parent1.getChromosomeLength() ];
                                    Arrays.fill(offspringChromosome,-1);
                                    Individual offspring = new Individual(offspringChromosome);
                                    
                                    // get subset of parent chromosomes 
                                    int  substrPos1= (int)(Math.random()*
                                          parent1.getChromosomeLength() );
                                      int substrPos2 = (int)(Math.random()*
                                            parent1.getChromosomeLength() );
                                            
                               // make the smaller the start and the larger the end
                               final int startSubstr=Math.min(substrPos1,substrPos2);
                               final int endSubstr =Math.max(substrPos1, substrPos2);
                               
                      // loop and add the sub tour from parent1 to our child
                      for(int i=startSubstr;i<endSubstr; i++){
                        offspring.setGene(i, parent1.getGene(i) );
                      }
                      
                      // loop throough parent2's city tour
                      for(int i=0; i<parent2.getChromosomeLength(); i++){
                          int parent2Gene =i+endSubstr;
                          if(parent2Gene >=parent2.getChromosomeLength() ){
                            
                            parent2Gene -=parent2.getChromosomeLength() ;
                          }
                          
                          // if offspring doesn't have the city add it 
                          if(offspring.containsGene(parent2.getGene(parent2Gene))==false){
                            
                          // loop to find a sparse position in the child's tour
                          for( int ii=0; ii<offspring.getChromosomeLength(); ii++){
                              // spare position found, add city
                                if(offspring.getGene(ii) ==-1){
                                  offspring.setGene(ii,parent2.getGene(parent2Gene));
                                  break;
                                } // end of if
                                
                                }
                            }
                        }

           // Add child 
           newPopulation.setIndividual(populationIndex, offspring);
                                            
                     }
                     else{
                     // Add individual to new population without applying crossover
                     newPopulation.setIndividual(populationIndex, parent1);
                     }
              
                   }              
                   
                   
                   return newPopulation;
             
             }    // end of crossover method 
             
             public Individual selectParent(Population population){
             
               // create tournament 
               Population tournament = new Population(this.tournamentSize);

             //Add random individual to the tournamant
             population.shuffle();
             for(int i=0; i<this.tournamentSize; i++){
                 
               Individual tournamentIndividual = population.getIndividual(i);
               tournament.setIndividual(i, tournamentIndividual);
               
             }
             // return the best 
             return tournament.getFittest(0);
         }

           
             // mutation method
             public Population mutatePopulation(Population population){
               //Initialize new population 
               
               Population newPopulation =
                   new Population(this.populationSize);
                   
                   //loop over current population by fitness
                   for( int populationIndex =0; populationIndex < population.size();
                           populationIndex++){
                           
                           Individual individual =
                               population.getFittest(populationIndex);
                             
                           
                         //skip mutation if this is an elite individual
                       if(populationIndex >=this.elitismCount){
                         //System.out.println("Mutating  population member "+populationIndex);
                         //loop over individual;s genes 
                         for( int geneIndex=0; geneIndex< individual.getChromosomeLength(); geneIndex++){
                           //Does thsi gene need mutation ?
                               if( this.mutationRate > Math.random()){
                                 int newGenePos= (int)(Math.random() *individual.getChromosomeLength() );
                                 
                                 //get genes to swap
                                 int gene1 = individual.getGene(newGenePos);
                                 
                                 int gene2 = individual.getGene(geneIndex);
                                 //swap genes
                                 individual.setGene(geneIndex, gene1);
                                 individual.setGene(newGenePos, gene2);
                               
                             }
                           }
                         }
                         
                         //add individual to population 
                         newPopulation.setIndividual(populationIndex, individual);
                     }
                     
                     //return mutated population
                     return newPopulation;
             } // end of mutatin method
           
                 
           
           
        }// end of geneticAlgorithm class
