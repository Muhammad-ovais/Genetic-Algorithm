
import controlP5.*;

    
Dong[][] d;
int nx = 10;
int ny = 10;




 int totalCities  ;
 int i=255;
 int j=0;
 int k=255;
 PFont f;
ControlP5 cp5;

int myColor = color(255);

int c1,c2;
Table   table  ;
      TSP_GA_022Class object ; 
  

float n,n1;

    // for shakespere problem object 
Shakespere shakespereObject  ;
GA_Monkey ga_monkey_object ;

// for TSP benchmark object
GA_Benchmark ga_Benchmark ;


    // TSP  for lexical /bruthforce aaproach
  
          TSP tsp;
  Tsp_bruthforce tsp_Bruthforce ;  



    // for TSP random object ;
    TSP_GA_021 objectRandom;
    Tsp_Random  ga_random;
void setup() {
    cp5 = new ControlP5(this); 
   cp5.printPublicMethodsFor(Matrix.class);

  cp5.addMatrix("myMatrix")
     .setPosition(70, 400)
     .setSize(200, 200)
     .setGrid(nx, ny)
     .setGap(10, 1)
     .setInterval(200)
     .setMode(ControlP5.MULTIPLES)
     .setColorBackground(color(20))
     .setBackground(color(40))
     ;
  cp5.getController("myMatrix").getCaptionLabel().alignX(CENTER);
     d = new Dong[nx][ny];
  for (int x = 0;x<nx;x++) {
    for (int y = 0;y<ny;y++) {
      d[x][y] = new Dong();
    }
  }
   noStroke();
  smooth();
  
  
  f = createFont("Courier", 32, true);
  table  =  loadTable("data.csv","header");
  noStroke();
 
  
  // create a new button with name 'buttonA'
  cp5.addButton("Shakespeare_Sketch")
     .setValue(0)
     .setPosition(70,150)
     .setSize(215,22)
     ;
  
  // and add another 2 buttons
  cp5.addButton("TSP_Benchmark_Sketch")
     .setValue(100)
     .setPosition(70,190)
     .setSize(215,22)
     ;
     
  cp5.addButton("TSP_Random_cities")
     .setPosition(70,230)
     .setSize(215,22)
     .setValue(0)
     ;

  
  cp5.addButton("TSP_Bruthforce")
     .setValue(128)
     .setPosition(70,270)
     
     .setSize(215,22)
     ;
     textSize(25);
     textAlign(CENTER);
     
     cp5.addTextlabel("label")
       .setText("Genetic Alogrithm Sketch")
         .setPosition(20,30).
             setColor(0xfafaf3f0)
               .setFont(f);
 
}

void draw() {

  
     background(0);
  fill(255, 100);
  pushMatrix();
  translate( width/2+150, height/2);
  rotate(frameCount*0.001);
  for (int x = 0;x<nx;x++) {
    for (int y = 0;y<ny;y++) {
      d[x][y].display();
    }
  }
  popMatrix();
  
  
  textFont(f);
  fill(0, 102, 153, 51);
  textSize(36);
 text("Genetic Algorithm Sketch", 20, 30);
  background(myColor);
  myColor = lerpColor(c1,c2,n);
  n += (1-n)* 0.1; 
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  n = 0;
}

// function colorA will receive changes from 
// controller with name colorA
public void Shakespeare_Sketch(int theValue) {
  println("a button event from colorA: "+theValue);
  c1 = c2;
  c2 = color(0,160,100);
  String[] args={"mainShakespere"};
shakespereObject = new Shakespere();
PApplet.runSketch(args,shakespereObject);

}

// function colorB will receive changes from 
// controller with name colorB
public void TSP_Benchmark_Sketch(int theValue) {
  println("a button event from colorB: "+theValue);
  c1 = c2;
  c2 = color(150,0,0);
    String[] args2 ={"GA_Benchmark_"};
     ga_Benchmark = new GA_Benchmark();
    PApplet.runSketch(args2,ga_Benchmark);
}

// function colorC will receive changes from 
// controller with name colorC
public void TSP_Random_cities(int theValue) {
  println("a button event from colorC: "+theValue);
  c1 = c2;
  c2 = color(255,255,0);
    String[] args3 ={"GA_random_"};
     //ga_Benchmark = new GA_Benchmark();
       ga_random= new Tsp_Random();
    PApplet.runSketch(args3,ga_random);
}

public void  TSP_Bruthforce(int theValue) {
  println("a button event from buttonB: "+theValue);
  c1 = c2;
  c2 = color(0,0,0);
  String[] args4 ={"bruthforce"};
      tsp_Bruthforce = new Tsp_bruthforce();
    PApplet.runSketch(args4,tsp_Bruthforce);
}




void settings(){

  size(600,600);
}

    void myMatrix(int theX, int theY) {
  println("got it: "+theX+", "+theY);
  d[theX][theY].update();
}
        void keyPressed() {
  if (key=='1') {
    cp5.get(Matrix.class, "myMatrix").set(0, 0, true);
  } 
  else if (key=='2') {
    cp5.get(Matrix.class, "myMatrix").set(0, 1, true);
  }  
  else if (key=='3') {
    cp5.get(Matrix.class, "myMatrix").trigger(0);
  }
  else if (key=='p') {
    if (cp5.get(Matrix.class, "myMatrix").isPlaying()) {
      cp5.get(Matrix.class, "myMatrix").pause();
    } 
    else {
      cp5.get(Matrix.class, "myMatrix").play();
    }
  }  
  else if (key=='0') {
    cp5.get(Matrix.class, "myMatrix").clear();
  }
}

//void controlEvent(ControlEvent theEvent) {
//}

    
    
    
  
class Dong {
  float x, y;
  float s0, s1;

  Dong() {
    float f= random(-PI, PI);
    x = cos(f)*random(100, 150);
    y = sin(f)*random(100, 150);
    s0 = random(2, 10);
  }

  void display() {
    s1 += (s0-s1)*0.1;
    ellipse(x, y, s1, s1);
  }

  void update() {
    s1 = 50;
  }
}
