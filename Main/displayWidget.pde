class Chyron extends Widget
{
  int chyronWidth, chyronHeight;
  ArrayList<String> dataToUse = new ArrayList<>();
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
    for (int i = max(speed/gap - 1, 0); i<min(nbRows, speed/gap+36); i++)
      // x/GAP : nb of rows I have move up
      // - 1 : load one more row
      // max0, min(nbRows): doean't load rows that don't existe
    {
      if ((y+i*gap - speed) > chyronHeight+30)
      {
        textFont(widgetFont);
        textSize(16);
        if (table.getInt(i, 15) == 1) // if cancelled
        {
          fill(cancelledColor);
        } else if (table.getInt(i, 16) == 1) // if diverted
        {
          fill(divertedColor);
        } else if (table.getInt(i, 11) - table.getInt(i, 12) > 10) // delayed more than 10min
        {
          fill(delayedColor);
        } else // normal
        {
          fill(textColor);
        }

        text(table.getString(i, 1), x, y+i*gap - speed); // carrier
        text(table.getString(i, 2), x + gap * 4, y+i*gap - speed); // flight number
        text(table.getString(i, 3), x + gap * 9, y+i*gap - speed); // origine aiport
        text(table.getString(i, 4), x + gap * 11.5, y+i*gap - speed); // origine state
        text(table.getString(i, 7), x + gap * 20.5, y+i*gap - speed); // dest airport
        text(table.getString(i, 8), x + gap * 23.3, y+i*gap - speed); // dest state
        text(table.getString(i, 11), x + gap * 32.5, y+i*gap - speed); // departure Time
        text(table.getString(i, 12), x + gap * 35.5, y+i*gap - speed); // Arrival Time
      }
    }
    speed+=1;
    drawHeaderFooterBox();
    drawHeaders();
  }
}
