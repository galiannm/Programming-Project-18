class Chart extends Widget
  {
    int x, y, widgetWidth, widgetHeight, gap;
    String label, title, xLabel, yLabel;
    color widgetColor;
    Chart(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int gap, String title, String xLabel, String yLabel)
    {
      super(x, y, widgetWidth, widgetHeight, label, widgetColor, widgetFont, gap);
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
      rect(width/2, 500, 600, 500);
    }

    void drawFrame()
    {
      noStroke();
      strokeWeight(2);
      fill(widgetColor);
      rect(x, y, widgetWidth, widgetHeight);
    }

    void drawTitle()
    {
      textAlign(CENTER);
      textSize(35);
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
