// widget, interactive widget, slider, Mini screen, image widget, infoSheetInformation and AnimatedWidget brought to you by Manon 
// the slider was then later edited by Nandana 

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
  }

  void draw() {
    textAlign(LEFT);
    rectMode(CORNER);
    imageMode(CORNER);
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
    text(label, x+widgetWidth/4 - gap, y + widgetHeight/2 + 6);
  }
}

class infoSheetInformation extends Widget
{
  int xImg, yImg, wImg, hImg;
  color textColor;
  PFont textFont;
  String to, from, date, airportOrigine, airportArr;
  int departureTime, arrivalTime, distance, flightNo;
  boolean delayedDep, delayedArr, flightExists, draw, canShowFlightInfo, lookAgain;
  infoSheetInformation(int xImg, int yImg, int wImg, int hImg, color textColor, PFont textFont)
  {
    super(xImg, yImg, wImg, hImg, "", textColor, textFont, 0, 0, false);
    this.xImg = xImg;
    this.yImg = yImg;
    this.wImg = wImg;
    this.hImg = hImg;
    this.textColor = textColor;
    this.textFont = textFont;
    draw = false;
    canShowFlightInfo = false;
    lookAgain = false;
  }

  void draw()
  {
    if (draw)
    {
      settingLabels();
      settingUserInput();
    }
  }

  void settingLabels()
  {
    fill(textColor);
    textSize(20);
    text("FROM: ", xImg + 10, yImg + 130);
    text("TO: ", xImg + 10, yImg + 180);
    text("FLIGHT No: ", xImg + 10, yImg + 230);
    text("DATE:", xImg + 570, yImg + 130);
    text("DISTANCE:", xImg + 570, yImg + 180);
    text("DEPARTURE TIME:", xImg + 260, yImg + 230);
    text("ARRIVAL TIME:", xImg + 570, yImg + 230);
  }

  void settingUserInput()
  {
    if (flightExists && !userFligthInfo.cancelled)
    {
      fill(textColor);
      textSize(20);
      text(airportOrigine, xImg + 85, yImg + 130);
      text(to, xImg + 135, yImg + 130);
      text(airportArr, xImg + 55, yImg + 180);
      text(from, xImg + 105, yImg + 180);
      text(date, xImg + 640, yImg + 130);
      text(distance, xImg + 688, yImg + 180);
      text(flightNo, xImg + 130, yImg + 230);

      if (delayedDep)
      {
        fill(orange);
        text(departureTime, xImg + 450, yImg + 230);
      } else
      {
        fill(textColor);
        text(departureTime, xImg + 450, yImg + 230);
      }
      if (delayedArr)
      {
        fill(orange);
        text(arrivalTime, xImg + 725, yImg + 230);
      } else
      {
        fill(textColor);
        text(arrivalTime, xImg + 725, yImg + 230);
      }
    } else if (flightExists && userFligthInfo.cancelled)
    {
      fill(red);
      textSize(35);
      pushMatrix();
      translate(300, 300);
      rotate(PI / 6);
      text("Flight Cancelled", 0, 0);
      popMatrix();

      textSize(30);
      fill(silverBlue);
      text("Would you like to find other flights ?", xImg, (hImg + 290) - yImg);
    } else if (!flightExists)
    {
      textSize(30);
      pushMatrix();
      translate(300, 300);
      rotate(PI / 6);
      text("This flight does not exist", 0, 0);
      popMatrix();

      textSize(30);
      fill(silverBlue);
      text("Would you like to find other flights ?", xImg, (hImg + 290) - yImg);
    }
    textSize(30);
    fill(silverBlue);
    text("Would like the information for another flight ?", xImg, (hImg + 180) - yImg);
  }

  void getData()
  {
    if (userFligthInfo != null)
    {
      flightExists = true;
      canShowFlightInfo = true;
      to = userFligthInfo.originCity;
      from = userFligthInfo.destCity;
      date = userFligthInfo.flightDate;
      airportOrigine = userFligthInfo.originAirport;
      airportArr = userFligthInfo.destAirport;
      distance = userFligthInfo.distance;
      flightNo = userFligthInfo.flightNumber;
      departureTime = userFligthInfo.expectedDepTime;
      arrivalTime = userFligthInfo.expectedArrTime;

      if (userFligthInfo.cancelled)
      {
        canShowFlightInfo = false;
      }

      if (!userFligthInfo.cancelled)
      {
        if (userFligthInfo.expectedDepTime - Integer.parseInt(userFligthInfo.depTime) > 15)
        {
          delayedDep = true;
        } else
        {
          delayedDep = false;
        }

        if (userFligthInfo.expectedArrTime - Integer.parseInt(userFligthInfo.arrTime) > 15)
        {
          delayedArr = true;
        } else
        {
          delayedArr = false;
        }
      }
    } else
    {
      flightExists = false;
      canShowFlightInfo = false;
    }
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
    textAlign(LEFT);
    rectMode(CORNER);
    imageMode(CORNER);
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
  boolean draw;
  ImageWidget(int x, int y, int widgetWidth, int widgetHeight, PImage widgetImg, boolean draw)
  {
    super(x, y, widgetWidth, widgetHeight, "", color(0), textFont, 0, 0, false);
    this.x = x;
    this.y = y;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.widgetImg = widgetImg;
    this.draw = draw;
  }

  void draw()
  {
    if (draw)
    {
      imageMode(CORNER);
      image(widgetImg, x, y, widgetWidth, widgetHeight);
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
  int minValue, maxValue; //Store minimum and maximum values
  int sliderColor;        

  MouseActionListener onDrag = (e, s) ->
  {
    Slider slider = (Slider)s;

    if (slider.mouseIntercept(mouseX, mouseY))
    {
      slider.isDragging = true;
    }
    if (isDragging)
    {
      slider.x = constrain(mouseX-slider.thumbWidth/2, slider.barX, slider.barX + slider.barWidth - slider.thumbWidth);
      slider.currentValue = (int) map(slider.x, slider.barX, slider.barX + slider.barWidth - slider.thumbWidth, slider.minValue, slider.maxValue);
    }
    if (e.getAction() == MouseEvent.RELEASE)
    {
      slider.isDragging = false;
    }
  };

  Slider(int barX, int barY, int thumbWidth, int thumbHeight, int barWidth, int barHeight, String label, int minValue, int maxValue,
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
    this.minValue = minValue;
    this.maxValue = maxValue;
    this.sliderColor = sliderColor;
  }

  void draw()
  {
    rectMode(CORNER);
    noStroke();
    fill(100);
    rect(barX, barY, barWidth, barHeight, barHeight*0.4);
    fill(sliderColor);
    rect(x, y+thumbHeight/4, thumbWidth, thumbHeight, thumbHeight*0.5);
    drawText();
    drawMinMaxValues(); //Displays the minimum and maximum values of the slider 
  }

  void drawText()
  {
    textFont(widgetFont);
    textSize(20);
    text(label, barX +barWidth/2, barY - 20);
    text(currentValue, barX + 80, barY - 20);
  }
  
  void drawMinMaxValues()
  {
    textAlign(LEFT, CENTER);
    fill(labelColor);
    textSize(16);
    text(minValue, barX, barY + barHeight + gap*3);  // Displays the minimum value below the left most point in the slider bar
    textAlign(RIGHT, CENTER);
    text(maxValue, barX + barWidth, barY + barHeight + gap*3);  // Displays the maximum value below the right most point in the slider bar
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
      rect(x , y , widgetWidth - 10, widgetHeight - 10);
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
// Added by Maria Ceanuri to control chekcboxes in reliability line graph
class CheckboxExtended extends Checkbox{
  FlightProvider provider;
  CheckboxExtended(int x, int y, int checkboxSize, String label, color widgetColor, PFont widgetFont, int gap, boolean initialState, FlightProvider provider)
{super ( x,  y,  checkboxSize, label,  widgetColor,  widgetFont,  gap, initialState);
this.provider = provider;
}
void draw ()
{
  super.draw();
  provider.visible = isChecked;

}
}
// Class RadioButton added by Maria Ceanuri then modified my manon 
class RadioButton extends InteractiveWidget {
  boolean selected, draw;
  RadioButton(int x, int y, int widgetWidth, String label, color widgetColor, PFont widgetFont, int gap, int curve, boolean draw) {
    super(x, y, widgetWidth, widgetWidth, label, widgetColor, widgetFont, gap, curve, draw);
    selected = false;
    this.draw = draw;
  }

  void draw() {
    // Draw the radio button
    if (draw)
    {
      super.draw();
      noStroke();
      fill(255);
      rect(x, y, widgetWidth, widgetWidth, curve);

      // If selected, draw a dot in the center
      if (selected) {
        fill(0);
        rect(x + widgetWidth/4 + 1, y + widgetWidth/4 + 1, widgetWidth/2, widgetWidth/2, curve);
      }

      // Display the label
      fill(widgetColor);
      textAlign(LEFT, CENTER);
      text(label, x + gap, y + gap/2);
    }
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

  void mouseIntercept()
  {
    super.mouseIntercept(mouseX, mouseY);
    if (mouseIntercept(mouseX, mouseY))
    {
      selected = !selected;
    }
    if (mouseIntercept(mouseX, mouseY)) {
      stroke(255); // White border if the mouse is over
    } else {
      stroke(widgetColor); // Black border otherwise
    }
  }

  void handleClick(ArrayList<RadioButton> radioButtons) {
    mouseIntercept();
    for (RadioButton radioButton : radioButtons) {
      if (radioButton != this) {
        radioButton.selected = false;
      }
    }
  }
}
