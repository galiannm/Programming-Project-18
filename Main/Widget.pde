// widget, interactive widget, slider, Mini screen, image widget and AnimatedWidget brought to you by Manon 
class Widget {
  int x, y, widgetWidth, widgetHeight, gap;
  String label;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  boolean isMouseOver, drawStroke; // Track if the mouse is over this widget
  int curve;

  Widget(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int gap, int curve, boolean drawStroke) {
    this.x = x;
    this.y = y;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.label = label;
    this.gap = gap;
    this.widgetColor = widgetColor;
    this.widgetFont = widgetFont;
    this.labelColor = color(darkGray);
    this.curve = curve;
    this.drawStroke = drawStroke;
    //isMouseOver = false;
  }

  void draw() {
    if (!drawStroke)
    {
      noStroke();
    }
    fill(widgetColor);
    rect(x, y, widgetWidth, widgetHeight, curve);
    fill(labelColor);
    drawText();
  }

  void drawText()
  {
    textFont(widgetFont);
    textSize(16);
    text(label, x+widgetWidth/4, y+widgetHeight/2+gap);
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
    super(x, y, miniScreenWidth, miniScreenHeight, label, widgetColor, widgetFont, 0, 0, false);
    this.textSize = textSize;
    this.labelHeight = labelHeight;
    this.miniScreenWidth = miniScreenWidth;
    this.miniScreenHeight = miniScreenHeight;
  }

  void draw() {
    noStroke();
    super.draw();
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
  InteractiveWidget(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int gap, int curve, boolean drawStroke)
  {
    super(x, y, widgetWidth, widgetHeight, label, widgetColor, widgetFont, gap, curve, drawStroke);
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
      stroke(widgetColor); // Black border otherwise
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

class AnimatedWidget extends InteractiveWidget
{
  int x, startx, y, amountOfPxToTravel, widgetWidth, widgetHeight, curve, pxTraveled, countMouseClick;
  float speed, speedCopy;
  boolean drag, movingOut;
  color widgetColor;
  String label;
  AnimatedWidget(int x, int y, int amountOfPxToTravel, int widgetWidth, int widgetHeight, String label, color widgetColor, int curve, float speed, boolean drawStroke)
  {
    super(x, y, widgetWidth, widgetHeight, "", widgetColor, textFont, 0, curve, drawStroke);
    this.x = x;
    this.y = y;
    this.amountOfPxToTravel = amountOfPxToTravel;
    this.speed = speed;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.curve = curve;
    this.drag = false;
    this.widgetColor = widgetColor;
    this.pxTraveled = 0;
    this.movingOut = false;
    this.speedCopy = speed;
    this.label = label;
    startx = x;
  }

  void drawLabel()
  {
    if (speedCopy < 0)
    {
      fill(darkBlueGray);
      textSize(15);
      text(label, x, y+widgetWidth);
    } else if (speedCopy > 0)
    {
      fill(darkBlueGray);
      textSize(15);
      text(label, x-amountOfPxToTravel/2+50, y+widgetWidth);
    }
  }

  void draw()
  {
    textAlign(LEFT);
    dragAnim();
    if (drawStroke)
    {
      if (mouseIntercept(mouseX, mouseY)) {
        stroke(44); // White border if the mouse is over
      } else {
        stroke(widgetColor); 
      }
    } else if (!drawStroke)
    {
      noStroke();
    }

    fill(widgetColor);
    rect(x, y, widgetWidth, widgetHeight, curve);
    if (speedCopy > 0)
    {
      if (x-30 > startx+120)
      {
        textAlign(RIGHT);
        fill(airportYellow);
        textSize(15);
        text(label, x-10, y+widgetWidth);
      }
    } else if (speedCopy < 0)
    {
      if (x+30 < startx-120)
      {
        textAlign(LEFT);
        //fill(darkBlueGray);
        fill(airportYellow);
        textSize(15);
        text(label, x+30, y+widgetWidth);
      }
    }
  }

  boolean mouseIntercept(int mX, int mY)
  {
    return (mX > x && mX < x + widgetWidth && mY > y && mY < y + widgetHeight);
  }

  void toggleDrag()
  {
    speed = speedCopy;
    if (countMouseClick == 0)
    {
      drag = false;
    } else if (countMouseClick % 2 == 0)
    {
      drag = true;
      speed = -speed;
    } else
    {
      drag = true;
    }
    pxTraveled = 0;
  }

  void dragAnim() {
    if (drag && pxTraveled < amountOfPxToTravel) {
      x += speed;
      pxTraveled += abs(speed);
    }
  }
}

class ImageWidget extends InteractiveWidget
{
  int x, y, widgetWidth, widgetHeight;
  PImage widgetImg;
  ImageWidget(int x, int y, int widgetWidth, int widgetHeight, PImage widgetImg)
  {
    super(x, y, widgetWidth, widgetHeight, "", color(0), textFont, 0, 0, false);
    this.x = x;
    this.y = y;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.widgetImg = widgetImg;
  }

  void draw()
  {
    image(widgetImg, x, y, widgetWidth, widgetHeight);
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
    super(barX, barY - thumbHeight / 2, thumbWidth, thumbHeight, label, sliderColor, widgetFont, gap, 0, false);
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

//Built checkboxes - Joel
class Checkbox extends InteractiveWidget {
  boolean isChecked;
  boolean clickHandled; // Flag to track if a click has been handled

  Checkbox(int x, int y, int checkboxSize, String label, color widgetColor, PFont widgetFont, int gap, boolean initialState) {
    super(x, y, checkboxSize, checkboxSize, label, widgetColor, widgetFont, gap, 0, true);
    isChecked = initialState;
    clickHandled = false; // Initialize the flag
  }

  void draw() {
    super.draw();
    if (isChecked) {
      fill(0); // Fill with black if checked
      rect(x + 5, y + 5, widgetWidth - 10, widgetHeight - 10);
    }
    if (mouseIntercept(mouseX, mouseY) && mousePressed && mouseButton == LEFT && !clickHandled) {
      isChecked = !isChecked;
      clickHandled = true; // Set the flag to indicate the click has been handled
    }
    if (!mousePressed) {
      clickHandled = false;
    }
    drawText();
  }

  void drawText() {
    textFont(widgetFont);
    textSize(16);
    fill(labelColor);
    text(label, x + widgetWidth + gap, y + widgetHeight - gap);
  }

  boolean mouseIntercept(int mX, int mY) {
    return ((mX > x && mX < x + widgetWidth && mY > y && mY < y + widgetHeight));
  }
}
