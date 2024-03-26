//This class is brought to you by Theresa James :))
class pieChart
{
  String [] labels = {"Flights On Time", "Delayed Flights", " Diverted", " Cancelled"};
  ArrayList <Integer> data;
  pieChart(ArrayList<Integer> data)
  {
    this.data = data;
  }
  void setup()
  {
    noStroke();
    noLoop();
  }

  void pie_chart()
  {

    float total = 0;
    float startAngle = 0;
    for (int i =0; i < data.size(); i++)
    {
      total += data.get(i);
    }
    color [] sectorColors = {#CBB9FE, #F8DECB, #FDC2EB, #B0E3EA, #FDC2EB, #F8DECB };
    for (int i = 0; i < data.size(); i++)
    {
      //float purple = map(i, 0, data.size(), 50, 255);
      //fill (purple * 0.8, 0, purple);
      fill(sectorColors [i % sectorColors.length]);
      float angle = map(data.get(i), 0, total, 0, TWO_PI);
      arc (width/2, height/2, PIECHART_DIAMETER, PIECHART_DIAMETER, startAngle, startAngle + angle);
      startAngle += angle;
    }
    //Drawing the legend
    float legendX = SCREEN_WIDTH - 850;
    float legendY = 100;
    float boxSize = 20;
    for (int i =0; i < data.size(); i++)
    {
      fill(sectorColors [i % sectorColors.length]);
      rect(legendX, legendY+i*25, boxSize, boxSize);
      fill(0);
      textAlign(LEFT, CENTER);
      try {
        text(labels[i], legendX + boxSize + 5, legendY + i * 25 + boxSize/2);
      }
      catch (NullPointerException e) {
        // Handle the NullPointerException here
        println("NullPointerException occurred: " + e.getMessage());
        // You can also log the values of variables involved to debug further
        println("Value of labels: " + labels);
        println("Value of i: " + i);
        println("Value of legendX: " + legendX);
        println("Value of boxSize: " + boxSize);
        println("Value of legendY: " + legendY);
      }
    }
  }
  void draw()
  {
    //background(100);
    pie_chart(); //<>//
  }
}

class pieChartWidget extends Widget
{
  pieChart chart;
  pieChartWidget(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont titleFont, int gap, pieChart chart)
  {
    super(x, y, 0, 0, label, 0, titleFont, 0, 0, false);
    this.x = x;
    this.y = y;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.label = label;
    this.widgetColor  = widgetColor;
    this.widgetFont = titleFont;
    this.gap = gap;
    this.chart = chart;
  }
  void draw()
  {
    super.draw();
    chart.draw();
  }
}
