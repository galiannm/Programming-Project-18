class pieChart
{
  pieChart()
  {
  }
  void header()
  {
    textFont(titleFont);
    textSize(50);
    fill(purple);
    text("Reliability Data", 500, 800);
  }
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

  void pie_chart( ArrayList<Integer> data)
  {
    
    float lastAngle = 0;
    for (int i = 0; i < data.size(); i++)
    {
      float purple = map(i, 0, data.size(), 50, 255);
      fill (purple * 0.8, 0, purple);
      arc (width/2, height/2, PIECHART_DIAMETER, PIECHART_DIAMETER, lastAngle, lastAngle + radians(data.get(i)));
      lastAngle += radians(data.get(i));
    }
  }
  void draw()
  {
    //background(100); 
    pie_chart(data);
  }
}

class pieChartWidget extends Widget
{
  pieChart chart;
  pieChartWidget(int x, int y,int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int gap, pieChart chart)
  {
    super(x, y, widgetWidth, widgetHeight, label, widgetColor, widgetFont,  gap);
    this.x = x; this.y = y; this.widgetWidth = widgetWidth; this.widgetHeight = widgetHeight; this.label = label; this.widgetColor  = widgetColor;
    this.widgetFont = widgetFont; this.gap = gap;
    this.chart = chart;
  }
  void draw()
  {
    super.draw();
    chart.draw();
  }
}
