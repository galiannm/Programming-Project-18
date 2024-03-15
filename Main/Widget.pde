class Widget {
  int x, y, widgetWidth, widgetHeight;
  String label;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  boolean isMouseOver; // Track if the mouse is over this widget
  int gap;

  Widget(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int gap) {
    this.x = x;
    this.y = y;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.label = label;
    this.widgetColor = widgetColor;
    this.widgetFont = widgetFont;
    this.labelColor = color(0);
    this.gap = gap;
    isMouseOver = false;
  }

  void draw() {
    fill(widgetColor);
    rect(x, y, widgetWidth, widgetHeight);
    fill(labelColor);
    drawText();
  }

  void drawText()
  {
    textFont(widgetFont);
    textSize(16);
    text(label, x + gap, y + widgetHeight - gap);
  }
}

class MiniScreen extends Widget
{
  int textSize;
  int labelHeight;
  int miniScreenWidth, miniScreenHeight;
  MiniScreen(int x, int y, int miniScreenWidth, int miniScreenHeight, String label, 
    int textSize, int labelHeight, color widgetColor, PFont widgetFont)
  {
    super(x, y, miniScreenWidth, miniScreenHeight, label, widgetColor, widgetFont, 0);
    this.textSize = textSize;
    this.labelHeight = labelHeight;
    this.miniScreenWidth = miniScreenWidth;
    this.miniScreenHeight = miniScreenHeight;
  }
  
  void drawText()
  {
    textFont(widgetFont);
    textSize(textSize);
    text(label, SCREEN_WIDTH/2-(label.length()*textSize)/4, labelHeight);
  }
}

class InteractiveWidget extends Widget
{
  ArrayList<MouseActionListener> eventListn;
  InteractiveWidget(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int gap)
  {
    super(x, y, widgetWidth, widgetHeight, label, widgetColor, widgetFont, gap);
    eventListn = new ArrayList<>();
  }

  boolean mouseIntercept(int mX, int mY)
  {
    return (mX > x && mX < x + widgetWidth && mY > y && mY < y + widgetHeight);
  }
  
  void draw()
  {
    if (mouseIntercept(mouseX, mouseY)) {
      stroke(255); // White border if the mouse is over
    } else {
      stroke(0); // Black border otherwise
    }
    super.draw();
  }

  public void addListn(MouseActionListener listn)
  {
    eventListn.add(listn);
  }

  public void actions(MouseEvent e)
  {
    for (MouseActionListener listn : eventListn)
    {
      listn.performAction(e, this);
    }
  }
}


class Slider extends InteractiveWidget
{
  int lowerInterval, upperInterval;
  int barWidth, barHeight, thumbWidth, thumbHeight;
  int barX, barY;
  int currentValue;
  boolean isDragging;

  MouseActionListener onDrag = (e, s) ->
  {
    Slider slider = (Slider)s;

    if (slider.mouseIntercept(mouseX, mouseY))
    {
      isDragging = true;
    }
    if (isDragging)
    {
      slider.x = constrain(mouseX-slider.thumbWidth/2, slider.barX, slider.barX + slider.barWidth - slider.thumbWidth);
      slider.currentValue = (int) map(slider.x, slider.barX, slider.barX + slider.barWidth - slider.thumbWidth, 0, 100);
    }
    if (e.getAction() == MouseEvent.RELEASE)
    {
      isDragging = false;
    }
  };

  Slider(int barX, int barY, int thumbWidth, int thumbHeight, int barWidth, int barHeight, String label,
    color sliderColor, PFont widgetFont, int gap)
  {
    super(barX, barY - thumbHeight / 2, thumbWidth, thumbHeight, label, sliderColor, widgetFont, gap);
    this.barX = barX;
    this.barY = barY;
    this.thumbWidth = thumbWidth;
    this.thumbHeight = thumbHeight;
    this.barWidth = barWidth;
    this.barHeight = barHeight;
    currentValue = 0;
    isDragging = false;
    this.addListn(onDrag);
  }

  void draw()
  {
    noStroke();
    fill(100);
    rect(barX, barY, barWidth, barHeight, barHeight*0.4);
    fill(150);
    rect(x, y+thumbHeight/4, thumbWidth, thumbHeight, thumbHeight*0.5);
    drawText();
  }

  void drawText()
  {
    textFont(widgetFont);
    textSize(20);
    text(label, barX, barY - 20);
    text(currentValue, barX + 80, barY - 20);
  }
}
