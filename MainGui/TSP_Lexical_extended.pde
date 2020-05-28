

  public class TSP extends PApplet{
  
  PVector[] cities ;
  int[] order ;
  float recordDistance  ;
int[] bestEver ;


int totalPermutations ;
 int count  =0; 
  
  
  
void setup(){


  cp5.addBang("closeBtn")
                .setPosition(width-50,height-50)
                  .setSize(50, 20);
  cities = new PVector[totalCities] ;
  order = new int[totalCities ];
  bestEver = new int[totalCities];
    for( int i =0; i< totalCities; i++){
      PVector v = new PVector(random( width), random( height/2) );
      cities[i] = v;
      order[i] = i;
}
  

    float d = calcDistance( cities, order);
    recordDistance =d ;
    arrayCopy(order, bestEver) ;
  
    totalPermutations = factorial(totalCities);
    println( totalPermutations );  
 
} // end of setup


  void settings(){
  
    size( 700, 750);
 // fullScreen();
  }

void draw(){

    
  background( 0 );

  fill( 255) ;
  strokeWeight(2);
  for ( int i  =0;  i< cities.length; i++){
    ellipse(cities[i].x, cities[i].y, 9, 9); 
  } // end of for loop
  
  
    stroke( i, j, k) ;
    strokeWeight(4) ;
    noFill();
    beginShape();
    for ( int i =0; i< order.length; i++){
      int  n = bestEver[i];
      vertex(cities[n].x, cities[n].y);
    }
    endShape();
 
  
  
  translate( 0, height/2);  
  stroke(255);
  strokeWeight(2);
  noFill();
  beginShape();
  for (int i =0; i< order.length; i++){
    int n = order[i];
    vertex(cities[n].x, cities[n].y);
  }
  endShape();
   for ( int i  =0;  i< cities.length; i++){
    ellipse(cities[i].x, cities[i].y, 9, 9); 
  } // end of for loop
  
  
  //int i = floor( random (cities.length) );
  //int j  =floor ( random (cities.length) );
  
 // swap( cities, i , j );
  
  
  
  float d = calcDistance( cities, order);

  
    if ( d<recordDistance ){
        
      recordDistance =d;
    arrayCopy(order, bestEver) ;
  }
  
  nextOrder();
  textSize( 32);
  fill( 255);
  float percent = 100 *((float) count /(float)totalPermutations);
  text(nf( percent,0, 2)+" %completed", 20, height/2-50 );
  text(nf(recordDistance), 20, 30);
}   // end of draw() function 

 void swap(int[] a , int i , int j ){
   int temp = a[i];
   a[i]  = a[j] ;
   a[j] =temp;
    
 
   
 }


float calcDistance(PVector[] points){

  float sum =0; 
  for ( int i=0; i<points.length-1; i++){
  
    float d = dist(points[i].x, points[i].y,points[i+1].x,points[i+1].y);
  sum += d; 
}

return sum ;
}



 int factorial ( int n ){
 
   if( n ==1){
   return 1;
 }
 else{
   return n * factorial( n-1) ;
     }
 }  // end of factorial() function 
 
 
 float calcDistance(PVector[] points, int[]  order) {
 
   float sum =0;
    for (int i =0; i< order.length-1; i++){
    
        int cityAIndex =order[i];
        PVector cityA = points[cityAIndex] ;
        int cityBIndex = order[i+1];
        PVector cityB = points[cityBIndex] ;
        float d = dist(cityA.x, cityA.y, cityB.x, cityB.y);
    sum +=d; 
  }
  return sum  ;
   
 }
 
 
 
 void nextOrder(){
   
   
    count++;

  // STEP 1 of the algorithm
  // https://www.quora.com/How-would-you-explain-an-algorithm-that-generates-permutations-using-lexicographic-ordering
  int largestI = -1;
  for (int i = 0; i < order.length - 1; i++) {
    if (order[i] < order[i + 1]) {
      largestI = i;
    }
  }
  if (largestI == -1) {
    noLoop();
    println("finished");
  }
  if (largestI != -1){
  // STEP 2
  int largestJ = -1;
  for (int j = 0; j < order.length; j++) {
    if (order[largestI] < order[j]) {
      largestJ = j;
    }
  }
  // STEP 3
  swap(order, largestI, largestJ);

  // STEP 4: reverse from largestI + 1 to the end
  int size = order.length - largestI - 1;
  int[] endArray = new int[size];
  arrayCopy(order, largestI + 1, endArray, 0, size);
  endArray = reverse(endArray);
  arrayCopy(endArray, 0, order, largestI+1, size);
}}
   
  void exit(){

      dispose();
      tsp= null;
  
    }

  
  }
