// code - Manon edited by Joel
// The `Chyron` class allows the user to automatically have information scroll up the screen.

class Chyron extends Widget
{
  int chyronWidth, chyronHeight;
  String userInput, state, date;
  color textColor;
  MiniScreen miniScreen;
  int speed;
  color cancelledColor, divertedColor, delayedColor;

  Chyron(int x, int y, int chyronWidth, int chyronHeight,
    color textColor, PFont widgetFont, int gap, MiniScreen miniScreen, String userInput)
  {
    super(x, y, chyronWidth, chyronHeight, "", textColor, widgetFont, gap, 0, false);
    this.miniScreen = miniScreen;
    this.userInput = userInput;
    this.chyronHeight = miniScreen.y;
    this.chyronWidth = miniScreen.x;
    this.textColor = textColor;
    this.cancelledColor = color(red);
    this.delayedColor = color(orange);
    this.divertedColor = color(blue);
    date = "";
    state = "";
    speed = 0;
  }


  void drawHeaderFooterBox()
  {
    noStroke();
    fill(darkGray);
    rect(chyronWidth, chyronHeight, miniScreen.miniScreenWidth, 40);
    fill(darkBlueGray);
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
    text("Destination", x + gap * 21.5, y+38); // dest airport
    text("Departure / Arrival Time", x + gap * 32.5, y+38); // dest airport
  }

  void draw()
  {
    miniScreen.draw();
    //fill(255, 0, 0);
    for (int i = max(speed/gap - 1, 0); i<min(flightsOfTheDay.size(), speed); i++) //removing /gap+36 makes a cool animation
    {
      Flight flight = flightsOfTheDay.get(i);
      if ((y+i*gap - speed) > chyronHeight+30)
      {
        //textFont(widgetFont);
        //textSize(20);
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
        text(flight.originAirport +", "+flight.originCity+" "+flight.originState, x + gap * 9, y+i*gap - speed); // origin aiport
        text(flight.destAirport +", "+flight.destCity+" "+flight.destState, x + gap * 21.5, y+i*gap - speed); // dest airport
        text(standardDepTime + " / " + standardArrTime, x + gap * 38.5, y+i*gap - speed); // departure and arrival time
        // 32.5
      }
    }
    speed+=2;
    drawHeaderFooterBox();
    drawHeaders();
  }
}
