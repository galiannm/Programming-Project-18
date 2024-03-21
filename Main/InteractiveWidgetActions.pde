// For organizational purposes I (manon) made a new tab where we will declare all the widget actions 
void interactiveWidgetActions()
{

  mainBtn1.addListn((e, w) -> {
    if (mainBtn1.mouseIntercept(mouseX, mouseY))
    {
      slidingBtn1.countMouseClick += 1;
      slidingBtn1.toggleDrag();

      bubbleChartReliabilityBtn.countMouseClick += 1;
      bubbleChartReliabilityBtn.toggleDrag();
      
      pieChartReliabilityBtn.countMouseClick += 1;
      pieChartReliabilityBtn.toggleDrag();
      
      lineGrapheReliabilityBtn.countMouseClick += 1;
      lineGrapheReliabilityBtn.toggleDrag();
    }
  }
  );

  bubbleChartReliabilityBtn.addListn((e, w) -> {
    if (bubbleChartReliabilityBtn.mouseIntercept(mouseX, mouseY))
    {
      currentScreenNumber = 2;
    }
  }
  );
  
  pieChartReliabilityBtn.addListn((e, w) -> {
    if (pieChartReliabilityBtn.mouseIntercept(mouseX, mouseY))
    {
      println("pie chart screen");
      currentScreenNumber = 3;
    }
  }
  );
  
  lineGrapheReliabilityBtn.addListn((e, w) -> {
    if (lineGrapheReliabilityBtn.mouseIntercept(mouseX, mouseY))
    {
      println("line graph screen");
      currentScreenNumber = 4;
    }
  }
  );
  
  disPerAirlineBtn.addListn((e, w) -> {
    if (disPerAirlineBtn.mouseIntercept(mouseX, mouseY))
    {
      println("distance per airline screen");
      currentScreenNumber = 5;
    }
  }
  );
  
  numFlightsPerAirlineBtn.addListn((e, w) -> {
    if (numFlightsPerAirlineBtn.mouseIntercept(mouseX, mouseY))
    {
      println("number of flights per airline screen");
      currentScreenNumber = 6;
    }
  }
  );
  
  yourFlightInfoBtn.addListn((e, w) -> {
    if (yourFlightInfoBtn.mouseIntercept(mouseX, mouseY))
    {
      println("your light information screen");
      currentScreenNumber = 7;
    }
  }
  );
  
  newFlightInfoBtn.addListn((e, w) -> {
    if (newFlightInfoBtn.mouseIntercept(mouseX, mouseY))
    {
      println("new flight information screen");
      currentScreenNumber = 8;
    }
  }
  );

  mainBtn2.addListn((e, w) -> {
    if (mainBtn2.mouseIntercept(mouseX, mouseY))
    {
      slidingBtn2.countMouseClick += 1;
      slidingBtn2.toggleDrag();
      
      disPerAirlineBtn.countMouseClick += 1;
      disPerAirlineBtn.toggleDrag();
      
      numFlightsPerAirlineBtn.countMouseClick += 1;
      numFlightsPerAirlineBtn.toggleDrag();
    }
  }
  );

  mainBtn3.addListn((e, w) -> {
    if (mainBtn3.mouseIntercept(mouseX, mouseY))
    {
      currentScreenNumber = 1;
    }
  }
  );

  mainBtn4.addListn((e, w) -> {
    if (mainBtn4.mouseIntercept(mouseX, mouseY))
    {
      slidingBtn4.countMouseClick += 1;
      slidingBtn4.toggleDrag();
      
      yourFlightInfoBtn.countMouseClick += 1;
      yourFlightInfoBtn.toggleDrag();
      
      newFlightInfoBtn.countMouseClick += 1;
      newFlightInfoBtn.toggleDrag();
    }
  }
  );

  homeBtn.addListn((e, w) -> {
    if (homeBtn.mouseIntercept(mouseX, mouseY))
    {
      currentScreenNumber = 0;
    }
  }
  );
}
