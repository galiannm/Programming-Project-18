final int SCREEN_WIDTH = 1000;
final int SCREENY_HEIGTH = 850;
Table table;
PFont titleFont, textFont;
int nbRows, nbColumns;
ArrayList<Screen> screens = new ArrayList<>();
 ArrayList<ArrayList<Object>> fullFlightsData;
color beige = color(247, 234, 215);
color darkGray = color(44, 44, 44);
color purple = color(92, 90, 165);
color teal = color(141, 219, 222);
int currentScreenNumber;
Screen mainScreen, screenFlightsOTD;
MiniScreen chyronMiniScreen;
Chyron chyronFOTD;

void settings()
{
  size(SCREEN_WIDTH, SCREENY_HEIGTH);
}

void setup()
{
  titleFont = loadFont("AvenirNext-Bold-45.vlw");
  textFont = loadFont("AlTarikh-45.vlw");
  //table = loadTable("flights2k.csv"); // "header" : remvoes the first row (header row)
  //table = loadTable("flights10k.csv");
  //table = loadTable("flights100k.csv");
  table = loadTable("flights_full.csv");
  nbRows = table.getRowCount();
  nbColumns = table.getColumnCount();

  screenFlightsOTD = new Screen(beige);
  screens.add(screenFlightsOTD);
  //fullFlightsData = copyTable();
  chyronMiniScreen = new MiniScreen(50, 200, 900, 600, "Flights Of The Day", 25, 50, darkGray, titleFont);
  chyronFOTD = new Chyron(chyronMiniScreen.x+20, chyronMiniScreen.y-10, 900, 600, "JFK",
    beige, textFont, 20, chyronMiniScreen, "1/3/2022 12:00:00 AM");

  screenFlightsOTD.addWidget(chyronFOTD);
  currentScreenNumber = 0;
}

// ArrayList<ArrayList<Object> > copyTable() 
//{
//  ArrayList<ArrayList<Object> > data = new  ArrayList<ArrayList<Object>>();
//  for (int i = 0; i < nbRows; i++) 
//  { 
//    DataPoints row = new DataPoints(i);
//    data.get(i).add(row.getRow()); 
//  }
//  return data;
//}

void draw()
{
  screens.get(currentScreenNumber).draw();
}
