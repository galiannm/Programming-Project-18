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
  screenMapFligthPath = new Screen(backgroundColors);
  screenHeatMap = new Screen(backgroundColors);

  screens.add(mainScreen); // index 0
  screens.add(screenFlightsOTD);
  screens.add(screenReliabilityBubbleChart);
  screens.add(screenPieChartReliability);
  screens.add(screenLineGrapheReliability);
  screens.add(screenDisPerAirline);
  screens.add(screenNumFlightsPerAirline);
  screens.add(screenYourFlightInfo);
  screens.add(screenNewFlightInfo);
  screens.add(screenMapFligthPath);
  screens.add(screenHeatMap); // index 10

  // input boxes
  //inputBox = new InputBox(width/2 - 150, height/2 - 25, 300, 65, 95);
  yourFlightInfoInputBox = new InputBox(50, 130, 250, 50, 95);
  chyronInputBox = new InputBox(50, 130, 250, 50, 95);
  flightPathInputBox = new InputBox(50, 130, 250, 50, 95);
  newFlightInfoInputBox = new InputBox(50, 130, 250, 50, 95);

  //Maria Ceanuri's line graph
  myLineGraph = new lineGraph(SCREEN_WIDTH/2, 500, 850, 500, "Graph", "Lateness by airline", "days", "lateness", titleFont, data, color(240));

  chyronMiniScreen = new MiniScreen(50, 200, 900, 600, "Flights Of The Day", 25, 50, darkGray, titleFont);
  chyronFOTD = new Chyron(chyronMiniScreen.x+20, chyronMiniScreen.y-10, 900, 600,
    beige, textFont, 20, chyronMiniScreen, chyronInputBox.allUserInputs); //"1/3/2022 12:00:00 AM"
  chyronClear = new InteractiveWidget(330, 150, 100, 30, "CLEAR", airportYellow, textFont, 6, 50/2, true);

  bubbleChart = new BubbleChart(SCREEN_WIDTH/2, 500, 850, 500, "Bubble Chart",
    color(240), textFont, 0, "Bubble Chart : Overall Reliability Of Carriers", reliabilityBubbleChart[0],
    reliabilityBubbleChart[2], reliabilityBubbleChart[1], airlines, colorOfCarriers, 1, "Number of Cancelled Flights",
    "Number Of Delayed Flights", "diverted flights");

  mapOfFlightPath = new MapOfFlightPath(SCREEN_WIDTH/2, 520, 900, 600, mapOfUSA, flightPathInputBox.allUserInputs);

  userFlightInformation = new infoSheetInformation(100, 250, 900, 650, darkGray, textFont);
  yourFlightInfoMiniScreen = new MiniScreen(50, 200, 900, 600, "Your Flight Information", 25, 50, darkGray, titleFont);
  flightInfoCard = new ImageWidget(50, 50, 900, 650, infoSheet, false);
  radioBtnUserFlight1 = new RadioButton(105, 595, 30, "Yes", silverBlue, textFont, 35, 560/2, false);
  radioBtnUserFlight2 = new RadioButton(180, 595, 30, "No (back to home screen)", silverBlue, textFont, 35, 560/2, false);
  radioBtnUserFlight3 = new RadioButton(105, 705, 30, "Yes", silverBlue, textFont, 35, 560/2, false);
  radioBtnUserFlight4 = new RadioButton(180, 705, 30, "No (back to home screen)", silverBlue, textFont, 35, 560/2, false);

  newflightInfoMiniScreen = new MiniScreen(50, 200, 900, 600, "Search For Flights", 25, 50, darkGray, titleFont);

  radioButtonsUserFlightInfo.add(radioBtnUserFlight1);
  radioButtonsUserFlightInfo.add(radioBtnUserFlight2);
  radioButtonsUserFlightInfo2.add(radioBtnUserFlight3);
  radioButtonsUserFlightInfo2.add(radioBtnUserFlight4);

  // Theresa's pie chart
  PieChartWidget = new pieChartWidget(500, 25, 0, 0, "Reliability of " + airline, 0, titleFont, 10, reliabilityData);
 
  airlineRadioButtons = new ArrayList<RadioButton>();
  int radioButtonX = SCREEN_WIDTH - 100;
  int radioButtonY = SCREEN_HEIGHT - 650;
  int radioButtonGap = 38;

  for (int i = 0; i < airlineNames.length; i ++)
  {
    RadioButton radioButton = new RadioButton(radioButtonX, radioButtonY + i * radioButtonGap, 30, airlines.get(i), silverBlue, textFont, 35, 560/2, true);
    airlineRadioButtons.add(radioButton);
    screenPieChartReliability.addWidget(radioButton);
    PieChartWidget.mousePressed();
  }

  // Nandana's bar charts
  firstBarChart = new BarChart(SCREEN_WIDTH/2, 500, 850, 500, "Bar Chart",
    color(240), textFont, 0, "Bar Chart : Number Of Flights Per Carrier", "Carriers",
    "Number of Flights", numFlightsPerCarrier[0], airlines);

  secondBarChart = new BarChart(SCREEN_WIDTH/2, 500, 850, 500, "Bar Chart",
    color(240), textFont, 0, "Bar Chart : Total Distance Travelled Per Carrier", "Carriers",
    "Distance (in kilometers)", totalDistancePerCarrier[0], airlines);

  firstHeatMapWidget = new HeatMapWidget(0, 0, width, height, USA, stateDeparturesArrivals, states, true);

  mainScreenMiniScreen = new MiniScreen(50, 100, 900, 700, "Main Screen", 25, 50, silverBlue, titleFont);
  signHolder = new Widget(SCREEN_WIDTH/2, mainScreenMiniScreen.y + 20, 15, mainScreenMiniScreen.widgetHeight - 12, "", darkBlueGray, textFont, 8, (mainScreenMiniScreen.widgetHeight -20)/2, false);
  mainBtn1 = new InteractiveWidget(SCREEN_WIDTH/2, 150, 220, 140, "Reliability Of Airlines", lightBlue, textFont, 8, 220/12, true);
  mainBtn2 = new InteractiveWidget(SCREEN_WIDTH/2-208, 300, 220, 140, "Data Per Airlines", lightBlue2, textFont, 8, 220/12, true);
  mainBtn3 = new InteractiveWidget(SCREEN_WIDTH/2, 450, 220, 140, "Flights Of The Day", blueGray2, textFont, 8, 220/12, true);
  mainBtn4 = new InteractiveWidget(SCREEN_WIDTH/2-208, 600, 220, 140, "Flight Information", blueGray, textFont, 8, 220/12, true);

  homeBtn = new ImageWidget(940, 790, 70, 70, homeBtnPic, true);
  slidingBtn1 = new AnimatedWidget(mainBtn1.x, mainBtn1.y, 190, mainBtn1.widgetWidth, mainBtn1.widgetHeight, "", mainBtn4.widgetColor, mainBtn1.curve, 2, false);
  slidingBtn2 = new AnimatedWidget(mainBtn2.x, mainBtn2.y, 190, mainBtn2.widgetWidth, mainBtn2.widgetHeight, "", mainBtn3.widgetColor, mainBtn2.curve, -2, false);
  slidingBtn4 = new AnimatedWidget(mainBtn4.x, mainBtn4.y, 190, mainBtn4.widgetWidth, mainBtn4.widgetHeight, "", mainBtn1.widgetColor, mainBtn4.curve, -2, false);

  bubbleChartReliabilityBtn = new AnimatedWidget(mainBtn1.x, mainBtn1.y+5, slidingBtn1.amountOfPxToTravel*2, 20, 20, "Bubble Chart", airportYellow, 10, slidingBtn1.speed, true);
  pieChartReliabilityBtn = new AnimatedWidget(mainBtn1.x, mainBtn1.y+45, slidingBtn1.amountOfPxToTravel*2, 20, 20, "Pie Chart", airportYellow, 10, 2, true);
  lineGrapheReliabilityBtn = new AnimatedWidget(mainBtn1.x, mainBtn1.y+85, slidingBtn1.amountOfPxToTravel*2, 20, 20, "Line Graph", airportYellow, 10, slidingBtn1.speed, true);
  disPerAirlineBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn2.y+5, slidingBtn2.amountOfPxToTravel*2, 20, 20, "Distance", airportYellow, 10, slidingBtn2.speed, true);
  numFlightsPerAirlineBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn2.y+45, slidingBtn2.amountOfPxToTravel*2, 20, 20, "Number of flights", airportYellow, 10, slidingBtn2.speed, true);
  yourFlightInfoBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn4.y+5, slidingBtn4.amountOfPxToTravel*2, 20, 20, "Your Flight", airportYellow, 10, slidingBtn4.speed, true);
  newFlightInfoBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn4.y+40, slidingBtn4.amountOfPxToTravel*2, 20, 20, "New Flight", airportYellow, 10, slidingBtn4.speed, true);
  flightPathBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn4.y+75, slidingBtn4.amountOfPxToTravel*2, 20, 20, "Flight Path Map", airportYellow, 10, slidingBtn4.speed, true);
  heatMapBtn = new AnimatedWidget(SCREEN_WIDTH/2-10, mainBtn4.y+110, slidingBtn4.amountOfPxToTravel*2, 20, 20, "Flights Heat Map", airportYellow, 10, slidingBtn4.speed, true);

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
  mainScreen.addWidget(flightPathBtn);
  mainScreen.addWidget(heatMapBtn);
  // main buttons
  mainScreen.addWidget(mainBtn1);
  mainScreen.addWidget(mainBtn2);
  mainScreen.addWidget(mainBtn3);
  mainScreen.addWidget(mainBtn4);
  mainScreen.addWidget(signHolder);

  screenFlightsOTD.addWidget(chyronInputBox);
  screenFlightsOTD.addWidget(chyronFOTD);
  screenFlightsOTD.addWidget(chyronClear);
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
    check = new CheckboxExtended(60 + i * 90, 120, 25, provider.provider, provider.providerColor, textFont, 25, provider.visible, provider);
    screenLineGrapheReliability.addWidget(check);
    i++;
  }
  screenYourFlightInfo.addWidget(yourFlightInfoInputBox);
  screenYourFlightInfo.addWidget(yourFlightInfoMiniScreen);
  screenYourFlightInfo.addWidget(flightInfoCard);
  screenYourFlightInfo.addWidget(userFlightInformation);
  screenYourFlightInfo.addWidget(radioBtnUserFlight1);
  screenYourFlightInfo.addWidget(radioBtnUserFlight2);
  screenYourFlightInfo.addWidget(radioBtnUserFlight3);
  screenYourFlightInfo.addWidget(radioBtnUserFlight4);
  screenYourFlightInfo.addWidget(homeBtn);

  screenNewFlightInfo.addWidget(newFlightInfoInputBox);
  screenNewFlightInfo.addWidget(newflightInfoMiniScreen);
  screenNewFlightInfo.addWidget(homeBtn);

  screenMapFligthPath.addWidget(flightPathInputBox);
  screenMapFligthPath.addWidget(mapOfFlightPath);
  screenMapFligthPath.addWidget(homeBtn);

  screenHeatMap.addWidget(firstHeatMapWidget);
  screenHeatMap.addWidget(homeBtn);

  currentScreenNumber = 0;
}
