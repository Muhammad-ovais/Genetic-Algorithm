class Individual{

    private int[] chromosome;
    private double fitness =-1;
    
    
    // constructor 

    public Individual(int chromosomeLength){
    
      int [] individual;
      individual = new int[chromosomeLength];
      
      for( int gene =0; gene< chromosomeLength; gene++){
        individual[gene] =gene;

      } // end of for loop
      
      this.chromosome = individual;
    }
    public Individual(int[] chromosome){
    
      this.chromosome =chromosome ;
    } // end of constructor 


        // getter method-1
  public int[] getChromosome(){
    
      return this.chromosome;
    }
    
    
   
    public int getChromosomeLength(){
      return this.chromosome.length;
    }
    
    public void setGene( int offset, int gene){
      this.chromosome[offset] =gene;
      }
       
         public boolean containsGene( int gene){
           
             for(int i=0; i< this.chromosome.length; i++){
               if(this.chromosome[i]==gene){
               return true;
             }  // return of if 
             
               } // return of for loop
               
               return false ;
         } // end of containsGene()
      
      
      public int getGene( int offset){
      
        return this.chromosome[offset];
        
      }
      
      public void setFitnees(double fitness){
        this.fitness = fitness ;
        
      }

  public double getFitness(){
    return this.fitness;
    
  }
  
  public String toString(){
  
      String output ="";
      for (int gene =0; gene< this.chromosome.length ; gene++){
      
        output += this.chromosome[gene];
      }
      return output ;
  }
}
