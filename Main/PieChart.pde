//This class was written by Theresa James. //<>//
//pieChart class is an extension of Widget class. It displays information like flights on time, delayed flights, diverted and cancelled flights in pieChart for each airline.
class pieChartWidget extends Widget
{
  ArrayList <Integer> data;
  pieChartWidget(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int gap, ArrayList<Integer> data)
  {
    super(x, y, 0, 0, label, 0, titleFont, 0, 0, false);
    this.x = x;
    this.y = y;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.label = label;
    this.widgetColor  = widgetColor;
    this.widgetFont = widgetFont;
    this.gap = gap;
    this.data = data;
  }
  String [] labels = {"Flights On Time", "Delayed Flights", " Diverted", " Cancelled"};

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
      fill(sectorColors [i % sectorColors.length]);
      float angle = map(data.get(i), 0, total, 0, TWO_PI);
      arc (width/2, height/2, PIECHART_DIAMETER, PIECHART_DIAMETER, startAngle, startAngle + angle);
      startAngle += angle;
    }
    //Drawing the legend
    float legendX = SCREEN_WIDTH - 850;
    float legendY = 100;
    float boxSize = 20;
    for (int i =0; i < 4; i++)
    {
      fill(sectorColors [i % sectorColors.length]);
      rect(legendX, legendY+i*25, boxSize, boxSize);
      fill(0);
      textAlign(LEFT, CENTER);
      try {
        textSize(16);
        text(labels[i], legendX + boxSize + 5, legendY + i * 25 + boxSize/2);
        textSize(30);
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
    fill(255);
    textAlign(CENTER, TOP);
    textSize(24);
    text("Reliability of " + airline, width / 2, 20);
  }

  void drawtext()
  {
    textFont(widgetFont);
    textSize(30);
    text(label, x+widgetWidth/4, y+widgetHeight/2+gap);
  }

  void collectDataForPieChart(String airline)
  {
    specificAirline.clear();

    for (int i = 0; i < flights.size(); i++) {
      Flight flight = flights.get(i);
      if (flight.provider.contains(airline)) {
        specificAirline.add(flight);
      }
    }
    flightStatus();
  }

  void mousePressed() {
    for (RadioButton radioButton : airlineRadioButtons) {
      if (radioButton.mouseIntercept(mouseX, mouseY)) {
        radioButton.handleClick(airlineRadioButtons);
      }
    }
  }

  void draw()
  {
    drawtext();
    pie_chart();
  }
}
