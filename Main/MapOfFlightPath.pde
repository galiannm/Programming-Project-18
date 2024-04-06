// code - Manon
// 
class MapOfFlightPath extends ImageWidget
{
  int x, y, mapWidth, mapHeight;
  int x1Coord, y1Coord, x2Coord, y2Coord, xDirection, yDirection;
  float xAnim, yAnim;
  PImage mapImg;
  MiniScreen mapFrame;
  String[] usStates;
  String userInput, stateOr, stateDest;
  Table tableCoords;
  PImage airplaneAnim;
  int distance;
  boolean printDistance;
  MapOfFlightPath(int x, int y, int mapWidth, int mapHeight, PImage mapImg, String userInput)
  {
    super(x, y, mapWidth, mapHeight, mapImg, true);
    this.x = x;
    this.y = y;
    this.mapWidth = mapWidth;
    this.mapHeight = mapHeight;
    this.mapImg = mapImg;
    this.userInput = userInput;
    stateOr = "";
    stateDest = "";
    tableCoords = loadTable("mapCoords.csv");
    mapFrame = new MiniScreen(x-mapWidth/2, y-mapHeight/2, mapWidth+25, mapHeight, "Flight Path", 25, 50, darkGray, titleFont);
    x1Coord = 0;
    y1Coord = 0;
    x2Coord = 0;
    y2Coord = 0;
    xAnim = 0;
    yAnim = 0;
    xDirection = 1;
    yDirection = 1;
    airplaneAnim = loadImage("airplaneForMap.png");
    distance = 0;
    printDistance = false;
  }

  void getCoords()
  {
    if (!stateOr.equals("") || !stateDest.equals(""))
    {
      for (int i = 0; i < tableCoords.getRowCount(); i++)
      {
        if (stateOr.equalsIgnoreCase(tableCoords.getString(i, 1)))
        {
          x1Coord = tableCoords.getInt(i, 2);
          xAnim = x1Coord;
          y1Coord = tableCoords.getInt(i, 3);
          yAnim = y1Coord;
        } else if (stateDest.equalsIgnoreCase(tableCoords.getString(i, 1)))
        {
          x2Coord = tableCoords.getInt(i, 2);
          y2Coord = tableCoords.getInt(i, 3);
        }
      }
    }
  }

  void draw()
  {
    mapFrame.draw();
    rectMode(CENTER);
    imageMode(CENTER);
    image(mapImg, x, y, mapWidth, mapHeight);
    if (!stateOr.equals("") && !stateDest.equals(""))
    {
      setFlightPathAnime();
    }
  }

  void setFlightPathAnime()
  {
    stroke(blueGray);
    line(x1Coord, y1Coord, xAnim, yAnim);
    animateCircle();
  }

  void animateCircle() {
    // y = mx + c
    float speed = 2.5;
    float m = float(y2Coord - y1Coord) / float(x2Coord - x1Coord);
    float c = float(y1Coord) - m*float(x1Coord);
    float angleAirplane = atan2(float(y2Coord - y1Coord), float(x2Coord - x1Coord));
    if (x2Coord < x1Coord)
    {
      speed = -speed;
    }
    if (xAnim != x2Coord && yAnim != y2Coord)
    {
      xAnim += speed;
      yAnim = (int)((m * xAnim + c));
    } else
    {
      printDistance = true;
    }
    pushMatrix();
    translate(xAnim, yAnim);
    rotate(angleAirplane);
    image(airplaneAnim, 0, 0, 50, 45);
    popMatrix();

    showDistance();
  }

  void showDistance()
  {
    String origineAndDestState = "";
    stateOr = stateOr.toUpperCase();
    stateDest = stateDest.toUpperCase();
    if (stateOr.compareTo(stateDest) < 0)
    {
      origineAndDestState = stateOr + stateDest;
    } else
    {
      origineAndDestState = stateDest + stateOr;
    }
    for (int i = 0; i < distBetweenStates.get(0).size(); i++)
    {
      if (origineAndDestState.equalsIgnoreCase((String)distBetweenStates.get(0).get(i)))
      {
        distance = (int)(distBetweenStates.get(3).get(i));
      }
    }
    fill(lightBlue);
    textSize(22);
    text("distance travelled: ", (x+mapWidth/8), (y-mapHeight/2 + 40));
    if (printDistance)
    {
      text(distance + " miles", (x+mapWidth/3 +20), (y-mapHeight/2 + 40));
      flightPathInputBox.allUserInputs = "";
      if (flightPathInputBox.userInput == "")
      {
        flightPathInputBox.typing = false;
      }
    }
  }
}
