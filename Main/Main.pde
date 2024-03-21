import java.util.ArrayList;
import java.lang.Thread;
import gifAnimation.*;
ArrayList<Flight> flights;
PFont titleFont, textFont;
ArrayList<Screen> screens = new ArrayList<>();
int currentScreenNumber;
ArrayList<Flight> specificAirline = new ArrayList<Flight>();
ArrayList <Integer> reliabilityData = new ArrayList <Integer>(); // The data used by the pie chart
String airline = "AA";
Screen mainScreen, screenFlightsOTD, screenReliabilityBubbleChart, screenPieChartReliability, screenLineGrapheReliability, screenDisPerAirline, screenNumFlightsPerAirline, screenYourFlightInfo, screenNewFlightInfo;
MiniScreen chyronMiniScreen, mainScreenMiniScreen;
Chyron chyronFOTD;
pieChart firstPieChart;
BubbleChart bubbleChart;
InteractiveWidget mainBtn1, mainBtn2, mainBtn3, mainBtn4;
ImageWidget homeBtn;
Widget signHolder;
AnimatedWidget slidingBtn1, slidingBtn2, slidingBtn4, bubbleChartReliabilityBtn, pieChartReliabilityBtn, lineGrapheReliabilityBtn,
  disPerAirlineBtn, numFlightsPerAirlineBtn, yourFlightInfoBtn, newFlightInfoBtn;
Gif loadingGif;
boolean isLoading = true;

void settings()
{
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup()
{
  loadingGif = new Gif(this, "loading.gif");
  loadingGif.loop();

  Thread dataLoadingThread = new Thread(new Runnable() {
    public void run() {
      loadData(); // Load CSV data
      collectData(airline, "1/1/2022", "NY"); // Process data
      flightStatus();
      currentScreenNumber = 0;

      addWidgetsToSetup();
      interactiveWidgetActions();
      isLoading = false; // Set loading flag to false once data loading is complete
    }
  }
  );
  dataLoadingThread.start();

  homeBtnPic = loadImage("HomeButtonImg.png");

  titleFont = loadFont("AvenirNext-Bold-45.vlw");
  textFont = loadFont("AlTarikh-45.vlw");
}

void draw()
{
  textAlign(LEFT);
  rectMode(CORNER);
  
  if(isLoading){
    image(loadingGif, 0, 0, width, height);
  }
  else{
  screens.get(currentScreenNumber).draw();
  }
}

void mousePressed(MouseEvent event)
{
  for (Widget widget : screens.get(currentScreenNumber).widgets)
  {
    if (widget instanceof InteractiveWidget)
    {
      ((InteractiveWidget) widget).actions(event);
    }
  }
}

void mouseDragged(MouseEvent event)
{
  for (Widget widget : screens.get(currentScreenNumber).widgets)
  {
    if (widget instanceof Slider)
    {
      ((Slider) widget).actions(event);
    }
  }
}
