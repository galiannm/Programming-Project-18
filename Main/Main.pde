
ArrayList<Flight> flights;
PFont titleFont, textFont;
ArrayList<Screen> screens = new ArrayList<>();
int currentScreenNumber;
Screen mainScreen, screenFlightsOTD;
MiniScreen chyronMiniScreen;
Chyron chyronFOTD;

void settings()
{
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup()
{
  loadData();    // loads the CSV data into the objects
  collectData(); // loads a bunch of variables for you to use for graphs
   
  titleFont = loadFont("AvenirNext-Bold-45.vlw");
  textFont = loadFont("AlTarikh-45.vlw");

  screenFlightsOTD = new Screen(backgroundColors);
  screens.add(screenFlightsOTD);
  
  chyronMiniScreen = new MiniScreen(50, 200, 900, 600, "Flights Of The Day", 25, 50, darkGray, titleFont);
  chyronFOTD = new Chyron(chyronMiniScreen.x+20, chyronMiniScreen.y-10, 900, 600, "JFK",
    beige, textFont, 20, chyronMiniScreen, "1/3/2022 12:00:00 AM");

  screenFlightsOTD.addWidget(chyronFOTD);
  currentScreenNumber = 0;
}

void draw()
{
  screens.get(currentScreenNumber).draw();
}
