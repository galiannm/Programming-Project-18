// This extension of the Chart class (BarChart) was brought to you by Nandana :)
import java.util.ArrayList;

class BarChart extends Chart {
  float data [];
  float[] targetData;       // data to update to when the slider value changes
  float[] currentData;      // data displayed by the bar chart currently
  ArrayList<String> labels; // Change String[] to ArrayList<String>
  int maxData;
  int minData;
  float animationSpeed = 0.5;

  BarChart(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor,
    PFont widgetFont, int gap, String title, String xLabel, String yLabel, int[] data, ArrayList<String> labels) {
    super(x, y, widgetWidth, widgetHeight, label, widgetColor, widgetFont, gap, title, xLabel, yLabel);
    this.data = float(data);
    this.labels = labels;
    this.maxData = findMax(data);
    this.minData = findMin(data);
    this.targetData = new float[data.length];
    this.currentData = new float[data.length];
    arrayCopy(this.data, targetData);
    arrayCopy(this.data, currentData);
  }

   int findMax(int[] arr) 
   {
      int max = Integer.MIN_VALUE;
      for (int value : arr) 
      {
          if (value > max) 
          {
              max = value;
          }
      }
      return max;
   }
   
   int findMin(int[] arr) 
   {
    int min = Integer.MAX_VALUE;
    for (int value : arr) 
    {
        if (value < min) 
        {
            min = value;
        }
    }
    return min; 
   }

  void drawBars() {
  float barWidth = (float)(widgetWidth - (data.length + 1) * gap) / data.length;
  float startX = x - widgetWidth / 2 + gap + barWidth / 2;
  float barHeight, yPos;
  
    for (int i = 0; i < data.length; i++) {
      barHeight = map(data[i], 0, maxData, 0, widgetHeight);
      yPos = map(data[i], 0, maxData, y + widgetHeight / 2, y); 
      float xPos = startX + i * (barWidth + gap);
  
      fill(colorOfCarriers[i % colorOfCarriers.length]); // Use modulo to cycle through colors
      noStroke();
      rect(xPos, yPos, barWidth, barHeight);
      
      // Display label
   
      fill(255);
      textAlign(CENTER, BOTTOM);
      text(labels.get(i), xPos, y + widgetHeight / 2 + 20); 

    }
  }   
   
  
  int roundUp(int num, int nearest) {
    return nearest * ceil((float)num / nearest);
  }
  
 


 void updateData(float[] newData){
   arrayCopy(currentData, data);
   arrayCopy(newData, targetData);
   updateAnimation();
 }
 
 void updateAnimation(){
  for (int i = 0; i < currentData.length; i++) {
      currentData[i] += (targetData[i] - currentData[i]) * animationSpeed;
    }
 }
      
 void displayYScale() {
    fill(255);
    textSize(15);
    textAlign(CENTER, CENTER);
    
    int maxRounded = roundUp(maxData, 1000);

    // Calculate the increment value for y-axis scale
    int increment = maxRounded / 7; // Divide the max rounded value by 7 (only enough space for 7 values)

    // Draw y-axis numbers
    for (int i = 0; i <=7; i++) { // Iterate 7 times for 7 numbers
        int value = roundUp(i * increment,  1000);
        float yPos = map(value, 0, maxRounded, y + (widgetHeight) / 2 , y - widgetHeight / 2);
        text(value, x - widgetWidth / 2 - 13, yPos);
    }
 }

  void draw() 
  {
    super.draw();
    drawBars();
    displayYScale();
  }
  

  void updateData(int[] newData, ArrayList<String> newLabels) 
  {
    data = float(newData);
    labels = newLabels;
    maxData = findMax(int(data));
    minData = findMin(int(data));
  }
  
}

void updateBarChart(BarChart chartToUpdate) 
{
  Slider sliderToUpdate = (chartToUpdate == firstBarChart) ? slider1 : slider2;
  int currentValueInt = int(sliderToUpdate.getValue());
  float[] accumulatedData = new float[chartToUpdate.currentData.length];
  int[][] dataToUpdate = (chartToUpdate == firstBarChart) ? numFlightsPerDate : totalDistancePerDate;
  
  // Accumulate data from day one to the current day
  for (int i = 1; i <= currentValueInt; i++) 
  {
    int[] dataForDay = dataToUpdate[i];
    for (int j = 0; j < dataForDay.length; j++) 
    {
      accumulatedData[j] += dataForDay[j];
    }
  }
  
  // Update the bar chart with accumulated data
  chartToUpdate.updateData(accumulatedData);
}
