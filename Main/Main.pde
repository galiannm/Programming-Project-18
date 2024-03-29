import java.util.ArrayList;
import java.lang.Thread;
ArrayList<Flight> flights;
PFont titleFont, textFont;
ArrayList<Screen> screens = new ArrayList<>();
int currentScreenNumber;
ArrayList<Flight> specificAirline = new ArrayList<Flight>();
ArrayList<RadioButton> radioButtonsUserFlightInfo = new ArrayList<>();
ArrayList<RadioButton> radioButtonsUserFlightInfo2 = new ArrayList<>();
ArrayList<RadioButton> radioButtonsPieChart = new ArrayList<>();
ArrayList <Integer> reliabilityData = new ArrayList <Integer>(); // The data used by the pie chart
String airline = "AA";
//List of the US states: Filled in process data. - Joel
ArrayList<String> states = new ArrayList<String>();
PShape USA;
Screen mainScreen, screenFlightsOTD, screenReliabilityBubbleChart, screenPieChartReliability, screenLineGrapheReliability,
  screenDisPerAirline, screenNumFlightsPerAirline, screenYourFlightInfo, screenNewFlightInfo, screenMapFligthPath, screenHeatMap;
MiniScreen chyronMiniScreen, mainScreenMiniScreen, yourFlightInfoMiniScreen, newflightInfoMiniScreen;
Chyron chyronFOTD;
InputBox inputBox, yourFlightInfoInputBox, newFlightInfoInputBox, chyronInputBox, flightPathInputBox;
FlightData data;
MapOfFlightPath mapOfFlightPath;
RadioButton radioBtnUserFlight1, radioBtnUserFlight2, radioBtnUserFlight3, radioBtnUserFlight4;
CheckboxExtended check;
lineGraph myLineGraph;
pieChart firstPieChart;
BubbleChart bubbleChart;
HeatMapWidget firstHeatMapWidget;
InteractiveWidget mainBtn1, mainBtn2, mainBtn3, mainBtn4, chyronClear;
ImageWidget homeBtn, flightInfoCard;
infoSheetInformation userFlightInformation;
Widget signHolder;
AnimatedWidget slidingBtn1, slidingBtn2, slidingBtn4, bubbleChartReliabilityBtn, pieChartReliabilityBtn, lineGrapheReliabilityBtn,
  disPerAirlineBtn, numFlightsPerAirlineBtn, yourFlightInfoBtn, newFlightInfoBtn, flightPathBtn, heatMapBtn;

BarChart firstBarChart;   // The bar chart on number of flights per carrier
BarChart secondBarChart; // The bar chart on total distance travelled by carrier
//RadioButton []radioButtons ;
RadioButton radioBtnAirlineAA;

boolean isLoading = true;
PImage[] frames;
PImage mapOfUSA, infoSheet;
int frameIndex = 0;
int frameChangeInterval = 70; // Time between frame changes in milliseconds
long lastFrameChangeTime = 0;
int NUMBER_OF_FRAMES = 21;


void settings()
{
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup()
{
  USA = loadShape("USA.svg");
  gifSetup();
  //Threads to load data while displaying a gif - Joel
  Thread dataLoadingThread = new Thread(new Runnable() {
    public void run() {
      loadData(); // Load CSV data
      collectData(airline, "1/1/2022", "NY"); // Process data
      getAverageDistance();
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
  mapOfUSA = loadImage("USAMap.png");
  infoSheet = loadImage("infoSheet.png");
  titleFont = loadFont("AvenirNext-Bold-45.vlw");
  textFont = loadFont("AlTarikh-45.vlw");
}

void draw()
{
  textAlign(LEFT);
  rectMode(CORNER);
  imageMode(CORNER);
  synchronized(this) {
    if (isLoading) {
      gifAnim();
    } else if (!isLoading) {
      screens.get(currentScreenNumber).draw();
    }
  }
}

void mousePressed(MouseEvent event)
{
  synchronized(this) {
    if (!isLoading) {
      //Temp Line
      firstHeatMapWidget.toggleShowArrivals();
      //Change the way we change it
      for (Widget widget : screens.get(currentScreenNumber).widgets)
      {
        if (widget instanceof InteractiveWidget)
        {
          ((InteractiveWidget) widget).actions(event);
        }
      }
    }
  }
}

void keyPressed(KeyEvent event)
{
  if (!isLoading) {
    for (Widget widget : screens.get(currentScreenNumber).widgets)
    {
      if (widget instanceof InputBox)
      {
        ((InputBox) widget).keyActions(event);
      }
    }
  }
}

void mouseDragged(MouseEvent event)
{
  synchronized(this) {
    if (!isLoading) {
      for (Widget widget : screens.get(currentScreenNumber).widgets)
      {
        if (widget instanceof Slider)
        {
          ((Slider) widget).actions(event);
        }
      }
    }
  }
}


//Loading Screen Code - Joel
void gifSetup() {
  frames = new PImage[NUMBER_OF_FRAMES+1];
  for (int i = 1; i <= NUMBER_OF_FRAMES; i++) {
    frames[i-1] = loadImage("frame_" + i + ".gif");
  }
  frames[NUMBER_OF_FRAMES] = frames[0];
}

void gifAnim() {
  image(frames[frameIndex], 0, 0, width, height);
  if (millis() - lastFrameChangeTime > frameChangeInterval) {
    frameIndex = (frameIndex + 1) % frames.length;
    if (frameIndex == frames.length - 1) {
      // If it's the last frame, reset frameIndex to 0
      frameIndex = 2;
    }
    lastFrameChangeTime = millis();
  }
}
void keyPressed() {
  inputBox.keyPressed();
}
