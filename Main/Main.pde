import java.util.ArrayList;
ArrayList<Flight> flights; //<>//
PFont titleFont, textFont;
ArrayList<Screen> screens = new ArrayList<>();
int currentScreenNumber;
Screen mainScreen, screenFlightsOTD, reliabilityScreen;
MiniScreen chyronMiniScreen;
Chyron chyronFOTD;
ArrayList<Flight> specificAirline = new ArrayList<Flight>(); //<>//
ArrayList <Integer> reliabilityData = new ArrayList <Integer>(); // The data used by the pie chart
pieChart firstPieChart;
String airline = "HA";
void settings()
{
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup()
{ //<>//
  loadData();    // loads the CSV data into the objects
  collectData(airline); // loads a bunch of variables for you to use for graphs

  titleFont = loadFont("AvenirNext-Bold-45.vlw");
  textFont = loadFont("AlTarikh-45.vlw");

  screenFlightsOTD = new Screen(backgroundColors);
  screens.add(screenFlightsOTD);

  chyronMiniScreen = new MiniScreen(50, 200, 900, 600, "Flights Of The Day", 25, 50, darkGray, titleFont);
  chyronFOTD = new Chyron(chyronMiniScreen.x+20, chyronMiniScreen.y-10, 900, 600, "JFK",
  beige, textFont, 20, chyronMiniScreen, "1/3/2022 12:00:00 AM");

  screenFlightsOTD.addWidget(chyronFOTD);
  currentScreenNumber = 0;

  //Pie Chart Screen / Reliability Screen - Theresa James
  flightStatus();
  firstPieChart = new pieChart(reliabilityData);
  firstPieChart.pie_chart();
  reliabilityScreen = new Screen(backgroundColors);
  screens.add(reliabilityScreen);
  pieChartWidget PieChartWidget = new pieChartWidget(500, 10,0, 0, "Reliability of " + airline, 0, titleFont, 0, firstPieChart);
  reliabilityScreen.addWidget(PieChartWidget);
  currentScreenNumber = 1;
}

void draw()
{
  screens.get(currentScreenNumber).draw();
}
