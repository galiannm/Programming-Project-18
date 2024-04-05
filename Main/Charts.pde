// charts and bubble chart brought to you by Manon 
class Chart extends Widget
{
  int x, y, widgetWidth, widgetHeight, gap;
  String label, title, xLabel, yLabel;
  color widgetColor;
  Chart(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int gap, String title, String xLabel, String yLabel)
  {
    super(x, y, widgetWidth, widgetHeight, label, widgetColor, widgetFont, gap, 0, true);
    this.x = x;
    this.y = y;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.gap = gap;
    this.label = label;
    this.title = title;
    this.xLabel = xLabel;
    this.yLabel = yLabel;
    this.widgetColor = widgetColor;
  }

  void drawMiniBackground()
  {
    fill(44);
    noStroke();
    rect(x, y, widgetWidth+100, widgetHeight+100, curve);
  }

  void drawFrame()
  {
    noStroke();
    strokeWeight(2);
    fill(widgetColor); //<>// //<>//
    rect(x, y, widgetWidth, widgetHeight); //<>// //<>//
  }

  void drawTitle()
  {
    textAlign(CENTER);
    textSize(45);
    text(title, SCREEN_WIDTH/2, 60);
  }

  void drawLabels()
  {
    textSize(16);
    textAlign(CENTER);
    fill(255);

    pushMatrix();
    translate(x-widgetWidth/2-35, y);
    rotate((3*PI)/2);
    text(yLabel, 0, 0);
    popMatrix();

    text(xLabel, x, y+widgetHeight/2+35);
  }

  void drawAxes()
  {
    stroke(150);
    line(x-widgetWidth/2, y-widgetHeight/2, x-widgetWidth/2, y+widgetHeight/2);
    line(x-widgetWidth/2, y+widgetHeight/2, x+widgetWidth/2, y+widgetHeight/2);
  }

  void draw()
  {
    rectMode(CENTER);
    drawMiniBackground();
    drawTitle();
    drawFrame();
    drawLabels();
    drawAxes();
  }
}


class BubbleChart extends Chart
{
  int[] dataX, dataY, dataSize;
  ArrayList<String> dataLabel;
  color[] dataColor;
  int minDataX, minDataY, minDataSize, maxDataX, maxDataY, maxDataSize;
  int minX, maxX, minY, maxY, intervalX, intervalY;
  float scale;
  String xLabel, yLabel, legendLabel;
  BubbleChart(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor,
    PFont widgetFont, int gap, String title, int[] dataX, int[] dataY, int[] dataSize, ArrayList<String> dataLabel,
    color[] dataColor, float scale, String xLabel, String yLabel, String legendLabel)
  {
    super(x, y, widgetWidth, widgetHeight, label, widgetColor, widgetFont, gap, title, xLabel, yLabel);
    this.dataX = dataX;
    this.dataY = dataY;
    this.dataSize = dataSize;
    this.dataLabel = dataLabel;
    this.dataColor = dataColor;
    this.scale = scale;
    this.xLabel = xLabel;
    this.yLabel = yLabel;
    this.legendLabel = legendLabel;
    findMinMax();
    getIntervals();
  }

  void drawLegend()
  {
    stroke(44);
    line(x+widgetWidth/2, (y-widgetHeight/2)+50, (x+widgetWidth/2)-110, (y-widgetHeight/2)+50);
    line((x+widgetWidth/2)-110, y-widgetHeight/2, (x+widgetWidth/2)-110, (y-widgetHeight/2)+50);

    fill(44);
    textSize(12);
    textAlign(LEFT);
    text("Legend :", (x+widgetWidth/2)-100, y-widgetHeight/2 + 12);
    text(legendLabel, (x+widgetWidth/2)-85, y-widgetHeight/2 + 35);
    fill(44, 44, 44, 95);
    noStroke();
    circle((x+widgetWidth/2)-95, y-widgetHeight/2 + 30, 12);
  }

  void findMinMax()
  {
    minDataX = min(dataX);
    minDataY = min(dataY);
    minDataSize = min(dataSize);

    maxDataX = max(dataX);
    maxDataY = max(dataY);
    maxDataSize = max(dataSize);
  }

  void getIntervals()
  {
    float intervalTemp = (maxDataY / dataY.length)*2;
    int n = (int) Math.log10(intervalTemp) + 1;
    float baseMultiplier = (float) Math.pow(10, n - 1);
    intervalTemp = Math.round(intervalTemp / baseMultiplier) * baseMultiplier;
    intervalY = (int) intervalTemp;
    intervalTemp = (maxDataX / dataX.length)*2;
    n = (int) Math.log10(intervalTemp) + 1;
    baseMultiplier = (float) Math.pow(10, n - 1);
    intervalTemp = Math.round(intervalTemp / baseMultiplier) * baseMultiplier;
    intervalX = (int) intervalTemp;
    minY = 0;
    maxY = max(dataY)+intervalY;
    minX = 0;
    maxX = max(dataX)+intervalX;
  }

  void drawPoints()
  {
    for (int i = 0; i < dataX.length; i++)
    {
      float mappedX = map(dataX[i], minX, maxX, x - widgetWidth / 2, x + widgetWidth / 2);
      float mappedY = map(dataY[i], minY, maxY, y + widgetHeight / 2, y - widgetHeight / 2);

      noStroke();
      fill(44);
      text(dataLabel.get(i), mappedX, mappedY);
      fill(dataColor[i], 95);
      circle(mappedX, mappedY, dataSize[i]*scale);
    }
  }

  void drawNumberOnAxes()
  {
    fill(255);
    textSize(12);
    textAlign(CENTER, CENTER);

    // Draw y-axis numbers
    for (int i = minY; i <= maxY; i += intervalY) {
      float yPos = map(i, minY, maxY, y + widgetHeight / 2, y - widgetHeight / 2 - 75);
      text(i, x - widgetWidth / 2 - 13, yPos);
    }

    // Draw x-axis numbers
    for (int i = minX; i <= maxX; i += intervalX) {
      float xPos = map(i, minX, maxX, x - widgetWidth / 2 + 75, x + widgetWidth / 2);
      text(i, xPos, y + widgetHeight / 2+10);
    }
  }

  void draw()
  {
    super.draw();
    drawLegend();
    drawNumberOnAxes();
    drawPoints();
  }
}
