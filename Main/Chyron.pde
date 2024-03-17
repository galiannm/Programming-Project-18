
class Chyron extends Widget
{
  int chyronWidth, chyronHeight;
  String airport, date;
  color textColor;
  MiniScreen miniScreen;
  int speed;
  color cancelledColor, divertedColor, delayedColor;

  Chyron(int x, int y, int chyronWidth, int chyronHeight, String airport,
    color textColor, PFont widgetFont, int gap, MiniScreen miniScreen, String date)
  {
    super(x, y, chyronWidth, chyronHeight, "", textColor, widgetFont, gap);
    this.miniScreen = miniScreen;
    this.airport = airport;
    this.date = date;
    this.chyronHeight = miniScreen.y;
    this.chyronWidth = miniScreen.x;
    this.textColor = textColor;
    this.cancelledColor = color(247, 187, 107);
    this.delayedColor = color(245, 101, 101);
    this.divertedColor = color(255, 253, 278);
    speed = 0;
  }


  void drawHeaderFooterBox()
  {
    noStroke();
    fill(darkGray);
    rect(chyronWidth, chyronHeight, miniScreen.miniScreenWidth, 40);
    fill(beige);
    rect(chyronWidth, miniScreen.miniScreenHeight+chyronHeight, miniScreen.miniScreenWidth, 60);
  }

  void drawHeaders()
  {
    textFont(widgetFont);
    textSize(20);
    fill(229, 226, 220);
    text("Carrier", x, y+38); // carrier
    text("Flight No.", x + gap * 4, y+38); // flight number
    text("Origin", x + gap * 9, y+38); // origine aiport
    text("Destination", x + gap * 20.5, y+38); // dest airport
    text("Departure / Arrival Time", x + gap * 32.5, y+38); // dest airport
  }

  void draw()
  {
    miniScreen.draw();
    fill(255, 0, 0);
    for (int i = max(speed/gap - 1, 0); i<min(flights.size(), speed); i++) //removing /gap+36 makes a cool animation
    {
      Flight flight = flights.get(i);
      if ((y+i*gap - speed) > chyronHeight+30)
      {
        textFont(widgetFont);
        textSize(20);
        textFont(widgetFont);
        textSize(16);
        if (flight.cancelled) // if cancelled
        {
          fill(cancelledColor);
        } else if (flight.diverted) // if diverted
        {
          fill(divertedColor);
        } else if (int(flight.depTime) - flight.expectedDepTime > 10) // delayed more than 10min
        {
          fill(delayedColor);
        } else // normal
        {
          fill(textColor);
        }
        //Converting the weird military time into regular HH:MM
        int crsDepHour = flight.expectedDepTime/100;
        int crsDepMin = flight.expectedDepTime%100;
        int crsArrHour = flight.expectedArrTime/100;
        int crsArrMin = flight.expectedArrTime%100;
        String standardDepTime =  String.format("%d:%02d", crsDepHour, crsDepMin);
        String standardArrTime =  String.format("%d:%02d", crsArrHour, crsArrMin);
        
        //Printing out each flight onto the chyron
        text(flight.provider, x, y+i*gap - speed); // carrier
        text(flight.flightNumber, x + gap * 4, y+i*gap - speed); // flight number
        text(flight.originAirport+", "+flight.originCity+" "+flight.originState, x + gap * 9, y+i*gap - speed); // origin aiport
        text(flight.destAirport+", "+flight.destCity+" "+flight.destState, x + gap * 20.5, y+i*gap - speed); // dest airport
        text(standardDepTime + " / " + standardArrTime, x + gap * 32.5, y+i*gap - speed); // departure and arrival time
      }
    }
    speed+=1;
    drawHeaderFooterBox();
    drawHeaders();
  }
}