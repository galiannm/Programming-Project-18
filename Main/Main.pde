
ArrayList<Flight> flights;
PFont titleFont, textFont;
ArrayList<Screen> screens = new ArrayList<>();
int currentScreenNumber; 
Screen mainScreen, screenFlightsOTD, reliabilityScreen;
MiniScreen chyronMiniScreen;
Chyron chyronFOTD;
ArrayList<Flight> specificAirline; // This is for the pie chart / reliability screen
pieChart firstPieChart = new pieChart();
void settings()
{
  size(SCREEN_WIDTH, SCREENY_HEIGHT);
}

void setup()
{
  loadData();    // loads the CSV data into the objects
  collectData("AA"); // loads a bunch of variables for you to use for graphs
   
  titleFont = loadFont("AvenirNext-Bold-45.vlw");
  textFont = loadFont("AlTarikh-45.vlw");

  screenFlightsOTD = new Screen(beige);
  screens.add(screenFlightsOTD);
  
  chyronMiniScreen = new MiniScreen(50, 200, 900, 600, "Flights Of The Day", 25, 50, darkGray, titleFont);
  chyronFOTD = new Chyron(chyronMiniScreen.x+20, chyronMiniScreen.y-10, 900, 600, "JFK",
    beige, textFont, 20, chyronMiniScreen, "1/3/2022 12:00:00 AM");

  screenFlightsOTD.addWidget(chyronFOTD);
  currentScreenNumber = 0;

  //Pie Chart Screen / Reliability Screen
  reliabilityScreen = new Screen(purple);
  screens.add(reliabilityScreen);
  pieChartWidget PieChartWidget = new pieChartWidget(5, 10,0, 0, "reliability", purple, titleFont, 10, firstPieChart);
  reliabilityScreen.addWidget(PieChartWidget);
}

void flightStatus() //This function checks the amount of flights that are cancelled, diverted or on time
{
  int cancelled = 0;
  int diverted = 0;
  int flightsOnTime = 0;
  
  for (int i =0; i < specificAirline.size(); i++)
  {
    Flight flight = specificAirline.get(i);
    if (flight.cancelled == true)
    {
      cancelled +=1;
    }
    else if (flight.diverted == true)
    {
      diverted += 1;
    }      
  }
  flightsOnTime = specificAirline.size() - cancelled - diverted;
  ArrayList <Integer> reliabilityData = new ArrayList <Integer>();
  reliabilityData.add(flightsOnTime);
  reliabilityData.add(diverted);
  reliabilityData.add(cancelled);
  firstPieChart.pie_chart(reliabilityData);
}

void draw()
{
  screens.get(currentScreenNumber).draw();
}
