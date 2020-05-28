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

import controlP5.*;

//// The Nature of Code
//// Daniel Shiffman
//// http://natureofcode.com

//// Genetic Algorithm, Evolving Shakespeare

//// Demonstration of using a genetic algorithm to perform a search

//// setup()
////  # Step 1: The populationation 
////    # Create an empty populationation (an array or ArrayList)
////    # Fill it with DNA encoded objects (pick random values to start)

//// draw()
////  # Step 1: Selection 
////    # Create an empty mating pool (an empty ArrayList)
////    # For every member of the populationation, evaluate its fitness based on some criteria / function, 
////      and add it to the mating pool in a manner consistant with its fitness, i.e. the more fit it 
////      is the more times it appears in the mating pool, in order to be more likely picked for reproduction.

////  # Step 2: Reproduction Create a new empty populationation
////    # Fill the new populationation by executing the following steps:
////       1. Pick two "parent" objects from the mating pool.
////       2. Crossover -- create a "child" object by mating these two parents.
////       3. Mutation -- mutate the child's DNA based on a given probability.
////       4. Add the child object to the new populationation.
////    # Replace the old populationation with the new populationation
////  
////   # Rinse and repeat
import java.text.DecimalFormat ;
 class GA_Monkey  extends PApplet{
 
 
 
 
PFont f;
String target
;
String targetPhrase ;
int popmax;
float mutationRate;
Population_01 population;
DecimalFormat df = new DecimalFormat("0.00");

   public GA_Monkey(String inputStr, int populationInt, float mutationRate ){
   
       this.mutationRate =mutationRate ;
       this.popmax = populationInt;
       this.target = inputStr;
   }  

  void settings(){
  
     size(800, 300);
  }
void setup() {
 targetPhrase =target ;
  f = createFont("Courier", 32, true);
  //target = "To be or not to be.";
 // popmax = 150;
  mutationRate = 0.01;

  // Create a populationation with a target phrase, mutation rate, and populationation max
  population = new Population_01(target, mutationRate, popmax);
}

void draw() {
  // Generate mating pool
  population.naturalSelection();
  //Create next generation
  population.generate();
  // Calculate fitness
  population.calcFitness();
  displayInfo();

  // If we found the target phrase, stop
  if (population.finished()) {
    println(millis()/1000.0);
    noLoop();
  }
}

void displayInfo() {
  background(255);
  // Display current status of populationation
  String answer = population.getBest();
  textFont(f);
  textAlign(LEFT);
  fill(0);
  
  
    
  textSize(16);
  text("Best phrase:",20,30);
  textSize(32);
  text(answer, 20, 75);

  textSize(12);
  text("total generations: " + population.getGenerations(), 20, 140);
  text("average fitness: " + nf(population.getAverageFitness(), 0, 2), 20, 155);
  text("total populationation: " + popmax, 20, 170);
  text("mutation rate: " +df.format((mutationRate * 100)) + "%", 20, 185);
    textSize(32);
  text("Target Phrase:  ",20, 210);
    textSize(16);
    text(targetPhrase,20, 230);
  textSize(10);
  text("All phrases:\n" + population.allPhrases(), 450, 10);
} // end of display() 

void exit(){
  ga_monkey_object=null;
  dispose();
  
}
 
 } // end of class
