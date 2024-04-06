import ddf.minim.*;
//Music

import java.util.ArrayList;
import java.lang.Thread;

ArrayList<Flight> flights;
PFont titleFont, textFont;
ArrayList<Screen> screens = new ArrayList<>();
int currentScreenNumber;
ArrayList<Flight> specificAirline = new ArrayList<Flight>();
ArrayList<RadioButton> radioButtonsUserFlightInfo = new ArrayList<>();
ArrayList<RadioButton> radioButtonsUserFlightInfo2 = new ArrayList<>();
ArrayList<RadioButton> airlineRadioButtons = new ArrayList<>();
ArrayList <Integer> reliabilityData = new ArrayList <Integer>(); // The data used by the pie chart
String airline = "AA";
String selectedLabel;
//List of the US states: Filled in process data. - Joel
ArrayList<String> states = new ArrayList<String>();
PShape USA;
Screen mainScreen, screenFlightsOTD, screenReliabilityBubbleChart, screenPieChartReliability, screenLineGrapheReliability,
  screenDisPerAirline, screenNumFlightsPerAirline, screenYourFlightInfo, screenNewFlightInfo, screenMapFligthPath, screenHeatMap;
MiniScreen chyronMiniScreen, mainScreenMiniScreen, yourFlightInfoMiniScreen, newflightInfoMiniScreen;
Chyron chyronFOTD;
InputBox yourFlightInfoInputBox, newFlightInfoInputBox, chyronInputBox, flightPathInputBox;
FlightData data;
MapOfFlightPath mapOfFlightPath;
RadioButton radioBtnUserFlight1, radioBtnUserFlight2, radioBtnUserFlight3, radioBtnUserFlight4;
CheckboxExtended check;
lineGraph myLineGraph;
pieChartWidget PieChartWidget;
BubbleChart bubbleChart;
HeatMapWidget firstHeatMapWidget;
InteractiveWidget mainBtn1, mainBtn2, mainBtn3, mainBtn4, chyronClear, sortByCarrierBtn, sortByDepAirportBtn, sortByArrAirportBtn, sortDateBtn, newFlightInfoClear, toggleHeatMap;
ImageWidget homeBtn, flightInfoCard;
ImageWidget HeatmapLegendArrivals, HeatmapLegendDepartures;
infoSheetInformation userFlightInformation;
Widget signHolder;
ScrollPage newFlightInfoScroll;
AnimatedWidget slidingBtn1, slidingBtn2, slidingBtn4, bubbleChartReliabilityBtn, pieChartReliabilityBtn, lineGrapheReliabilityBtn,
  disPerAirlineBtn, numFlightsPerAirlineBtn, yourFlightInfoBtn, newFlightInfoBtn, flightPathBtn, heatMapBtn;

BarChart firstBarChart;   // The bar chart on number of flights per carrier
BarChart secondBarChart; // The bar chart on total distance travelled by carrier
//RadioButton []radioButtons ;

//Audio Stuff
Minim minim;
AudioPlayer backgroundMusic, clickSound, key1, key2, key3, key4, key5, key6, backSpaceKey, enterKey;

String [] airlineNames = {"AA", "AS", "B6", "DL", "F9", "G4", "HA", "NK", "UA", "WN"};
//ArrayList<RadioButton> airlineRadioButtons;

boolean isLoading = true;
PImage[] frames;
PImage mapOfUSA, infoSheet;
int frameIndex = 0;
int frameChangeInterval = 70; // Time between frame changes in milliseconds
long lastFrameChangeTime = 0;
int NUMBER_OF_FRAMES = 21;
PImage arrivalsLegend, departuresLegend;

Slider slider1; // slider corresponding to the first bar chart
Slider slider2; // slider corresponding to the second bar chart

void settings()
{
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup()
{
  gifSetup();
  //Threads to load data while displaying a gif - Joel
  Thread dataLoadingThread = new Thread(new Runnable() {
    public void run() {
      USA = loadShape("USA.svg");
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

  minim = new Minim(this);
  backgroundMusic = minim.loadFile("backgroundMusic.mp3");
  backgroundMusic.setGain(-20);
  backgroundMusic.play();
  backgroundMusic.loop();
  clickSound = minim.loadFile("mouseClick.mp3");
  clickSound.setGain(-20);
  key1 = minim.loadFile("keyClick1.mp3");
  key2 = minim.loadFile("keyClick2.mp3");
  key3 = minim.loadFile("keyClick3.mp3");
  key4 = minim.loadFile("keyClick4.mp3");
  key5 = minim.loadFile("keyClick5.mp3");
  key6 = minim.loadFile("keyClick6.mp3");
  enterKey = minim.loadFile("enterKey.mp3");
  backSpaceKey = minim.loadFile("backSpaceKey.mp3");
  key1.setGain(-20);
  key2.setGain(-20);
  key3.setGain(-20);
  key4.setGain(-20);
  key5.setGain(-20);
  key6.setGain(-20);
  enterKey.setGain(-20);
  backSpaceKey.setGain(-20);


  homeBtnPic = loadImage("HomeButtonImg.png");
  mapOfUSA = loadImage("USAMap.png");
  infoSheet = loadImage("infoSheet.png");
  titleFont = loadFont("AvenirNext-Bold-45.vlw");
  textFont = loadFont("AlTarikh-45.vlw");
  arrivalsLegend = loadImage("arrivals.png");
  departuresLegend = loadImage("departures.png");
}

void draw()
{
  textAlign(LEFT);
  rectMode(CORNER);
  imageMode(CORNER);
  synchronized(this) {
    if (isLoading) {
      gifAnim();
    } else
    {
      screens.get(currentScreenNumber).draw();
      if (slider1.isDragging())
      {
        updateBarChart(firstBarChart);
      }
      if (slider2.isDragging())
      {
        updateBarChart(secondBarChart);
      }
    }
  }
}

void mousePressed(MouseEvent event)
{
  synchronized(this) {
    if (!isLoading) {
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

void mouseWheel(MouseEvent event) {
  synchronized(this) {
    if (!isLoading) {
      for (Widget widget : screens.get(currentScreenNumber).widgets)
      {
        if (widget instanceof ScrollPage)
        {
          ((ScrollPage) widget).actions(event);
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

//More music stuff
//Terminates music when screen closed
void stop() {
  backgroundMusic.close();
  minim.stop();
  super.stop();
}
