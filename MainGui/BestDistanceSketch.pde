

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
 

class BestDistance extends PApplet{

  XYChart lineChart;
  
  float[] xfloat ;
  float[] yfloat ;
    int sizeX ;
    int sizeY;

      // constructor 
      public BestDistance( float[] xfloat, float[] yfloat){
        this.xfloat = xfloat;
        this.yfloat = yfloat ;
      
      }
      
      void setup(){
      
       textFont(createFont("Arial",10),10);
    lineChart = new XYChart(this);
  lineChart.showXAxis(true);
  lineChart.showYAxis(true);
 
  lineChart.setMinX(1); 
  
   lineChart.setPointColour(color(180,50,50,10));
  lineChart.setPointSize(5);
  lineChart.setLineWidth(2);
    lineChart.setXAxisLabel("Generations");
    lineChart.setYAxisLabel("Best Fitness");
    
    
             //   lineChart.setMinY(Collections.min(data));
             //lineChart.setMaxY(Collections.max(data));
  lineChart.setMaxY(6000);
  lineChart.setData(xfloat,yfloat);
      
      }
      
      
      
      void draw(){
      
        background(255);
        lineChart.draw(15,15,width-30,height-30);
      
      }
      void settings(){
        size( 800, 600);
      
      }
      void exit(){
      
      dispose()
    ;
      //bestDistance = null;
    }

}
