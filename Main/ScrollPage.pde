//code - Manon
// The `ScrollPage` class allows the user the creation of an inforamtion page, 
// which has to added functionality of beeing able to sort through the information. 
// Additionally, it enables scrolling, allowing users to navigate up and down the page 
// as needed.

class ScrollPage extends InteractiveWidget
{

  int x, y, widgetWidth, widgetHeight, gap, numRowsDisplayed, yOffset;
  String startDate, endDate, origineState, destinationState;
  color widgetColor;
  MiniScreen miniScreen;

  MouseActionListener onScroll = (e, s) ->
  {
    ScrollPage scrollPage = (ScrollPage) s;
    if (e.getAction() == MouseEvent.WHEEL)
    {
      scrollPage.yOffset += e.getCount();
      scrollPage.yOffset = constrain(scrollPage.yOffset, 0, max(0, newFlightInformationData.size()*19));
    }
  };

  ScrollPage(int x, int y, int widgetWidth, int widgetHeight, color widgetColor, int gap, MiniScreen miniScreen)
  {
    super(x, y, widgetWidth, widgetHeight, "", widgetColor, textFont, gap, 0, true);
    this.x = x;
    this.y = y;
    this.widgetWidth = widgetWidth;
    this.widgetHeight = widgetHeight;
    this.gap = gap;
    this.widgetColor = widgetColor;
    this.miniScreen = miniScreen;
    this.addListn(onScroll);
    numRowsDisplayed = 30;
    yOffset = 0;
  }

  void drawHeaderFooterBox()
  {
    noStroke();
    fill(darkGray);
    rect(miniScreen.x, y, widgetWidth, 40);
    fill(darkBlueGray);
    rect(miniScreen.x, widgetHeight + miniScreen.y, widgetWidth, 60);
  }

  void drawHeaders()
  {
    textFont(textFont);
    textSize(20);
    fill(beige);
    text("Date", x, y+38); // carrier
    text("Carrier", x + gap * 4, y+38); // flight number
    text("Origin", x + gap * 9, y+38); // origine aiport
    text("Destination", x + gap * 22.5, y+38); // dest airport
    text("Departure / Arrival Time", x + gap * 32.5, y+38); // dest airport
    
    fill(darkGray);
    text("Sort by :", 310, 140);
  }

  void draw()
  {
    int scrollIndex = (int)(yOffset/20);
    miniScreen.draw();
    for (int i = scrollIndex; i < min(numRowsDisplayed+yOffset, newFlightInformationData.size()); i++)
    {
      Flight flight = newFlightInformationData.get(i);
      fill(beige);
      textFont(widgetFont);
      textSize(16);
      if ((y+i*gap - yOffset) > (y+35))
      {

        //Converting the weird military time into regular HH:MM
        int crsDepHour = flight.expectedDepTime/100;
        int crsDepMin = flight.expectedDepTime%100;
        int crsArrHour = flight.expectedArrTime/100;
        int crsArrMin = flight.expectedArrTime%100;
        String standardDepTime =  String.format("%d:%02d", crsDepHour, crsDepMin);
        String standardArrTime =  String.format("%d:%02d", crsArrHour, crsArrMin);

        text(flight.flightDate, x, y+(i+1)*gap - yOffset); // date
        text(flight.provider, x + gap * 4, y+(i+1)*gap - yOffset); // carrier
        text(flight.originAirport +", "+flight.originCity+" "+flight.originState, x + gap * 9, y+(i+1)*gap - yOffset); // origin aiport
        text(flight.destAirport +", "+flight.destCity+" "+flight.destState, x + gap * 22.5, y+(i+1)*gap - yOffset); // dest airport
        text(standardDepTime + " / " + standardArrTime, x + gap * 38.5, y+(i+1)*gap - yOffset); // departure and arrival time
      }
    }
    textAlign(LEFT);
    rectMode(CORNER);
    drawHeaderFooterBox();
    drawHeaders();
  }

  void convertToTable()
  {
  }

  void sortColumn(String sortBtn) {
    if (sortBtn == "date")
    {
      boolean swaped = true;
      while (swaped)
      {
        swaped = false;
        for (int i = 0; i < newFlightInformationData.size()-1; i++)
        {
          Flight flight = newFlightInformationData.get(i);
          Flight flight2 = newFlightInformationData.get(i+1);
          String elem1 = flight.flightDate;
          String elem2 = flight2.flightDate;
          String[] decomposedDate1 = elem1.split("/");
          String[] decomposedDate2 = elem2.split("/");
          int day = Integer.parseInt(decomposedDate1[1]);
          int day2 = Integer.parseInt(decomposedDate2[1]);

          //if (elem1.compareTo(elem2) > 0)
          if (day > day2)
          {
            swaped = true;
            newFlightInformationData.set(i, flight2);
            newFlightInformationData.set(i+1, flight);
          }
        }
      }
    } else if (sortBtn == "carrier")
    {

      boolean swaped = true;
      while (swaped)
      {
        swaped = false;
        for (int i = 0; i < newFlightInformationData.size()-1; i++)
        {
          Flight flight = newFlightInformationData.get(i);
          Flight flight2 = newFlightInformationData.get(i+1);
          String elem1 = flight.provider;
          String elem2 = flight2.provider;

          if (elem1.compareTo(elem2) > 0)
          {
            swaped = true;
            newFlightInformationData.set(i, flight2);
            newFlightInformationData.set(i+1, flight);
          }
        }
      }
    } 
    else if (sortBtn == "DepAirport")
    {
      boolean swaped = true;
      while (swaped)
      {
        swaped = false;
        for (int i = 0; i < newFlightInformationData.size()-1; i++)
        {
          Flight flight = newFlightInformationData.get(i);
          Flight flight2 = newFlightInformationData.get(i+1);
          String elem1 = flight.originAirport;
          String elem2 = flight2.originAirport;

          if (elem1.compareTo(elem2) > 0)
          {
            swaped = true;
            newFlightInformationData.set(i, flight2);
            newFlightInformationData.set(i+1, flight);
          }
        }
      }
    } 
    else if (sortBtn == "ArrAirport")
    {
      boolean swaped = true;
      while (swaped)
      {
        swaped = false;
        for (int i = 0; i < newFlightInformationData.size()-1; i++)
        {
          Flight flight = newFlightInformationData.get(i);
          Flight flight2 = newFlightInformationData.get(i+1);
          String elem1 = flight.destAirport;
          String elem2 = flight2.destAirport;

          if (elem1.compareTo(elem2) > 0)
          {
            swaped = true;
            newFlightInformationData.set(i, flight2);
            newFlightInformationData.set(i+1, flight);
          }
        }
      }
    }
  }
}
