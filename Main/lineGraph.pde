// Class lineGraph was brought to you by Maria Ceanuri :)
class lineGraph  extends Chart {
 
  int numValues = 31; // Number of values to display on the x-axis
  int numValuesY = 21; // Number of values to display on the y-axis
  int gapBetween;
  int gapBetweenY;
  int scaleY;
  String xCoordinates, yCoordinates;
  FlightData data;

  lineGraph(int x, int y, int widgetWidth, int widgetHeight, String title, String xCoordinates, String yCoordinates, PFont widgetFont, FlightData data, color widgetColor ) {//ArrayList<GroupedFlight> gflights) {
    super( x, y, widgetWidth, widgetHeight, 0, widgetFont, title, "days", "lateness (minutes)");
    this.xCoordinates=xCoordinates; 
    this.yCoordinates= yCoordinates ; 
    this.data=data;
    this.widgetColor=widgetColor;
    gapBetween = widgetWidth / numValues; 
    gapBetweenY = widgetHeight/ numValuesY; 
    scaleY=20;
  }
  void setScaleY(int scale) {
      scaleY= scale;
  }
  void drawXVariables(int numValues, int gapBetween) {
    //xPositions = new int[numValues];
    textFont(textFont, 16);
    fill(255);
    for (int i = 0; i < numValues; i++) {
      int xPosition = x-(widgetWidth/2)+5 + i * gapBetween;
      text(i + 1, xPosition, 765); // Display numbers below the x-axis
    }
  }

  void drawYVariables(int numValues, int gapBetween, int scaleY) {
    //yPositions = new int[numValuesY];
    textFont(textFont, 16);
    fill(255);
    for (int i = 0; i < numValues; i++) {
      int yPosition = y+(widgetHeight/2)  - i * gapBetween; // Start from the top and decrement
      text(i * scaleY, x-(widgetWidth/2)-13, yPosition); // Display numbers to the left of the y-axi
    }
  }

  void drawDataGraph (int gapBetween, int gapBetweenY, int scaleY )
  {
    int firstLateness = 0;
    int dx=x-(widgetWidth/2)+5;
    int dy=y+(widgetHeight/2);
    int i=0;
    int xPosition = x-(widgetWidth/2)+50;
    for (FlightProvider item : data.providerList.values()) {
      if (item.visible) {
        textFont(textFont, 16);
        fill(item.providerColor);
        text(item.provider, xPosition + i * gapBetween, 270); 
        i++;
        stroke(item.providerColor);
        for (FlightDay dayItem : item.dayList) {
          int v = dayItem.valueX()-1;
          int secondLateness = dayItem.valueY();  
          int firstY = (firstLateness/scaleY) ;
          int secondY = (secondLateness/scaleY);
          int iniX = dx + (v*gapBetween); //x-(widgetWidth/2)+5+v*gapBetween;
          int iniY = dy - firstY*gapBetweenY; //y+(widgetHeight/2)-firstY*gapBetweenY;
          int endX = iniX + gapBetween; //x-(widgetWidth/2)+5+(v+1)*gapBetween;
          int endY= dy - secondY*gapBetweenY; //y+(widgetHeight/2)-secondY*gapBetweenY;
          line (iniX, iniY, endX, endY);
          firstLateness=secondLateness;
        }
      }
    }
  }


  
  void draw() {
    super.draw(); //<>// //<>//
    textAlign (CENTER);
    drawXVariables(numValues, gapBetween);
    drawYVariables(numValuesY, gapBetweenY, scaleY);
    drawDataGraph(gapBetween, gapBetweenY, scaleY);
  }
}
