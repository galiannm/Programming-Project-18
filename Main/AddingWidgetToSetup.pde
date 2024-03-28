// For organizational purposes I (manon) made a new tab where we will declare all the screens and widgets
void addWidgetsToSetup()
{
  mainScreen = new Screen(backgroundColors);
  screenFlightsOTD = new Screen(backgroundColors);
  screenReliabilityBubbleChart = new Screen(backgroundColors);
  screenPieChartReliability = new Screen(backgroundColors);
  screenLineGrapheReliability = new Screen(backgroundColors);
  screenDisPerAirline = new Screen(backgroundColors);
  screenNumFlightsPerAirline = new Screen(backgroundColors);
  screenYourFlightInfo = new Screen(backgroundColors);
  screenNewFlightInfo = new Screen(backgroundColors);

  screens.add(mainScreen);
  screens.add(screenFlightsOTD);
  screens.add(screenReliabilityBubbleChart);
  screens.add(screenPieChartReliability);
  screens.add(screenLineGrapheReliability);
  screens.add(screenDisPerAirline);
  screens.add(screenNumFlightsPerAirline);
  screens.add(screenYourFlightInfo);
  screens.add(screenNewFlightInfo);
 //Maria Ceanuri's line graph
 myLineGraph = new lineGraph(SCREEN_WIDTH/2, 500, 850, 500, "Graph", "Lateness by airline", "days", "lateness", titleFont, data, color(240));
  chyronMiniScreen = new MiniScreen(50, 200, 900, 600, "Flights Of The Day", 25, 50, darkGray, titleFont);
  chyronFOTD = new Chyron(chyronMiniScreen.x+20, chyronMiniScreen.y-10, 900, 600, "NY",
    beige, textFont, 20, chyronMiniScreen, "1/3/2022 12:00:00 AM");

inputBox = new InputBox(width/2 - 150, height/2 - 25, 300, 65);

  bubbleChart = new BubbleChart(SCREEN_WIDTH/2, 500, 850, 500, "Bubble Chart",
    color(240), textFont, 0, "Bubble Chart : Overall Reliability Of Carriers", reliabilityBubbleChart[0],
    reliabilityBubbleChart[2], reliabilityBubbleChart[1], airlines, colorOfCarriers, 1, "Number of Cancelled Flights",
    "Number Of Delayed Flights", "diverted flights");
  
  // Theresa's pie chart
  firstPieChart = new pieChart(reliabilityData);
  //firstPieChart.pie_chart();
  pieChartWidget PieChartWidget = new pieChartWidget(500, 25,0, 0, "Reliability of " + airline, 0, titleFont, 0, firstPieChart);

  // Nandana's bar charts
  firstBarChart = new BarChart(SCREEN_WIDTH/2, 500, 850, 500, "Bar Chart",
    color(240), textFont, 0, "Bar Chart : Number Of Flights Per Carrier", "Carriers",
    "Number of Flights", numFlightsPerCarrier[0], airlines);
                         
  secondBarChart = new BarChart(SCREEN_WIDTH/2, 500, 850, 500, "Bar Chart",
    color(240), textFont, 0, "Bar Chart : Total Distance Travelled Per Carrier", "Carriers",
    "Distance (in kilometers)", totalDistancePerCarrier[0], airlines);
  
  mainScreenMiniScreen = new MiniScreen(50, 100, 900, 700, "Main Screen", 25, 50, silverBlue, titleFont);
  signHolder = new Widget(SCREEN_WIDTH/2, mainScreenMiniScreen.y + 20, 15, mainScreenMiniScreen.widgetHeight - 12, "", darkBlueGray, textFont, 8, (mainScreenMiniScreen.widgetHeight -20)/2, false);
  mainBtn1 = new InteractiveWidget(SCREEN_WIDTH/2, 150, 220, 140, "Reliability Of Airlines", lightBlue, textFont, 8, 220/12, true);
  mainBtn2 = new InteractiveWidget(SCREEN_WIDTH/2-208, 300, 220, 140, "... Per Airlines", lightBlue2, textFont, 8, 220/12, true);
  mainBtn3 = new InteractiveWidget(SCREEN_WIDTH/2, 450, 220, 140, "Flights Of The Day", blueGray2, textFont, 8, 220/12, true);
  mainBtn4 = new InteractiveWidget(SCREEN_WIDTH/2-208, 600, 220, 140, "Flight Information", blueGray, textFont, 8, 220/12, true);

  homeBtn = new ImageWidget(940, 790, 70, 70, homeBtnPic);
  slidingBtn1 = new AnimatedWidget(mainBtn1.x, mainBtn1.y, 190, mainBtn1.widgetWidth, mainBtn1.widgetHeight, "", mainBtn4.widgetColor, mainBtn1.curve, 2, false);
  slidingBtn2 = new AnimatedWidget(mainBtn2.x, mainBtn2.y, 190, mainBtn2.widgetWidth, mainBtn2.widgetHeight, "", mainBtn3.widgetColor, mainBtn2.curve, -2, false);
  slidingBtn4 = new AnimatedWidget(mainBtn4.x, mainBtn4.y, 190, mainBtn4.widgetWidth, mainBtn4.widgetHeight, "", mainBtn1.widgetColor, mainBtn4.curve, -2, false);

  bubbleChartReliabilityBtn = new AnimatedWidget(mainBtn1.x, mainBtn1.y+5, slidingBtn1.amountOfPxToTravel*2, 20, 20, "Bubble Chart", airportYellow, 10, slidingBtn1.speed, true);
  pieChartReliabilityBtn = new AnimatedWidget(mainBtn1.x, mainBtn1.y+45, slidingBtn1.amountOfPxToTravel*2, 20, 20, "Pie Chart", airportYellow, 10, 2, true);
  lineGrapheReliabilityBtn = new AnimatedWidget(mainBtn1.x, mainBtn1.y+85, slidingBtn1.amountOfPxToTravel*2, 20, 20, "Line Graph", airportYellow, 10, slidingBtn1.speed, true);
  disPerAirlineBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn2.y+5, slidingBtn2.amountOfPxToTravel*2, 20, 20, "Distance", airportYellow, 10, slidingBtn2.speed, true);
  numFlightsPerAirlineBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn2.y+45, slidingBtn2.amountOfPxToTravel*2, 20, 20, "Number of flights", airportYellow, 10, slidingBtn2.speed, true);
  yourFlightInfoBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn4.y+5, slidingBtn4.amountOfPxToTravel*2, 20, 20, "Your Flight", airportYellow, 10, slidingBtn4.speed, true);
  newFlightInfoBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn4.y+45, slidingBtn4.amountOfPxToTravel*2, 20, 20, "New Flight", airportYellow, 10, slidingBtn4.speed, true);

  mainScreen.addWidget(mainScreenMiniScreen);
  mainScreen.addWidget(slidingBtn1);
  mainScreen.addWidget(slidingBtn2);
  mainScreen.addWidget(slidingBtn4);
  // buttons on sliding widgets
  mainScreen.addWidget(bubbleChartReliabilityBtn);
  mainScreen.addWidget(pieChartReliabilityBtn);
  mainScreen.addWidget(lineGrapheReliabilityBtn);
  mainScreen.addWidget(disPerAirlineBtn);
  mainScreen.addWidget(numFlightsPerAirlineBtn);
  mainScreen.addWidget(yourFlightInfoBtn);
  mainScreen.addWidget(newFlightInfoBtn);
  // main buttons
  mainScreen.addWidget(mainBtn1);
  //mainScreen.addWidget(inputBox);
  mainScreen.addWidget(mainBtn2);
  mainScreen.addWidget(mainBtn3);
  mainScreen.addWidget(mainBtn4);
  mainScreen.addWidget(signHolder);

  screenFlightsOTD.addWidget(chyronFOTD);
  screenFlightsOTD.addWidget(homeBtn);
  
  
  screenReliabilityBubbleChart.addWidget(bubbleChart);
  screenReliabilityBubbleChart.addWidget(homeBtn);
  
  screenPieChartReliability.addWidget(homeBtn);
  screenPieChartReliability.addWidget(PieChartWidget);
  
  screenNumFlightsPerAirline.addWidget(firstBarChart);
  screenNumFlightsPerAirline.addWidget(new Slider(SCREEN_WIDTH/3, 150, 20, 20, 310, 10, "Days", 1, 31, color(0), textFont, 5));
  screenNumFlightsPerAirline.addWidget(homeBtn);
  
  screenDisPerAirline.addWidget(secondBarChart);
  screenDisPerAirline.addWidget(homeBtn);
  screenDisPerAirline.addWidget(new Slider(SCREEN_WIDTH/3, 150, 20, 20, 310, 10, "Days", 1, 31, color(0), textFont, 5));
  
  screenLineGrapheReliability.addWidget(homeBtn);
  screenLineGrapheReliability.addWidget(myLineGraph);
  int i=0;
  // checkboxes for the reliability line graph
  for (FlightProvider provider : data.providerList.values()) 
  {
    check = new CheckboxExtended(60 + i * 90, 120, 25, provider.provider, provider.providerColor, textFont, 25, provider.visible,provider);
    screenLineGrapheReliability.addWidget(check);
    i++;
  }
  screenDisPerAirline.addWidget(homeBtn);
  screenNumFlightsPerAirline.addWidget(homeBtn);
  screenYourFlightInfo.addWidget(homeBtn);
  screenNewFlightInfo.addWidget(homeBtn);
  
  currentScreenNumber = 0;
}
