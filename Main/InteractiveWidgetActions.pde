// Fcode done by Manon //modified by Joel (added in toggleHeatMap actions - 04/04/24 00:30)
// create a separate tab for organizational purposes
void interactiveWidgetActions()
{

  mainBtn1.addListn((e, w) -> {
    if (mainBtn1.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
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
      clickSound.rewind();
      clickSound.play();
      currentScreenNumber = 2;
    }
  }
  );

  pieChartReliabilityBtn.addListn((e, w) -> {
    if (pieChartReliabilityBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("pie chart screen");
      currentScreenNumber = 3;
    }
  }
  );

  lineGrapheReliabilityBtn.addListn((e, w) -> {
    if (lineGrapheReliabilityBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("line graph screen");
      currentScreenNumber = 4;
    }
  }
  );

  mainBtn2.addListn((e, w) -> {
    if (mainBtn2.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      slidingBtn2.countMouseClick += 1;
      slidingBtn2.toggleDrag();

      disPerAirlineBtn.countMouseClick += 1;
      disPerAirlineBtn.toggleDrag();

      numFlightsPerAirlineBtn.countMouseClick += 1;
      numFlightsPerAirlineBtn.toggleDrag();
    }
  }
  );

  disPerAirlineBtn.addListn((e, w) -> {
    if (disPerAirlineBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("distance per airline screen");
      currentScreenNumber = 5;
    }
  }
  );

  numFlightsPerAirlineBtn.addListn((e, w) -> {
    if (numFlightsPerAirlineBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("number of flights per airline screen");
      currentScreenNumber = 6;
    }
  }
  );

  mainBtn3.addListn((e, w) -> {
    if (mainBtn3.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      currentScreenNumber = 1;
    }
  }
  );

  chyronInputBox.addKeyListn((e, w) -> {
    chyronInputBox.keyPressed();

    if (!chyronInputBox.allUserInputs.equals(""))
    {
      getFlightOTDInformation(chyronInputBox.allUserInputs);
      chyronFOTD.date = (chyronInputBox.allUserInputs.split(", "))[0];
      chyronFOTD.state = (chyronInputBox.allUserInputs.split(", "))[1];
    }
  }
  );

  chyronClear.addListn((e, w) -> {
    if (chyronClear.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      chyronInputBox.allUserInputs = "";
      chyronInputBox.typing = false;
      flightsOfTheDay = new ArrayList<Flight>();
    }
  }
  );

  mainBtn4.addListn((e, w) -> {
    if (mainBtn4.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();

      slidingBtn4.countMouseClick += 1;
      slidingBtn4.toggleDrag();

      yourFlightInfoBtn.countMouseClick += 1;
      yourFlightInfoBtn.toggleDrag();

      newFlightInfoBtn.countMouseClick += 1;
      newFlightInfoBtn.toggleDrag();

      flightPathBtn.countMouseClick += 1;
      flightPathBtn.toggleDrag();

      heatMapBtn.countMouseClick += 1;
      heatMapBtn.toggleDrag();
    }
  }
  );

  yourFlightInfoBtn.addListn((e, w) -> {
    if (yourFlightInfoBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("your light information screen");
      currentScreenNumber = 7;
      for (RadioButton radioButton : radioButtonsUserFlightInfo)
      {
        radioButton.selected = false;
      }
      for (RadioButton radioButton : radioButtonsUserFlightInfo2)
      {
        radioButton.selected = false;
      }
    }
  }
  );

  yourFlightInfoInputBox.addKeyListn((e, w) -> {
    yourFlightInfoInputBox.keyPressed();

    if (!yourFlightInfoInputBox.allUserInputs.equals(""))
    {
      flightInfoCard.draw = true;
      getFlightInfoSheetInformation(yourFlightInfoInputBox.allUserInputs);
      userFlightInformation.getData();
      userFlightInformation.draw = true;
      for (RadioButton radioButton : radioButtonsUserFlightInfo)
      {
        radioButton.draw = true;
      }
      //println(!userFlightInformation.canShowFlightInfo);
      if (!userFlightInformation.canShowFlightInfo)
      {
        for (RadioButton radioButton2 : radioButtonsUserFlightInfo2)
        {
          radioButton2.draw = true;
        }
      }
      yourFlightInfoInputBox.allUserInputs = "";
    }
  }
  );

  radioBtnUserFlight1.addListn((e, w) -> {
    if (radioBtnUserFlight1.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("clear input");
      yourFlightInfoInputBox.allUserInputs = "";
      flightInfoCard.draw = false;
      userFlightInformation.draw = false;
      radioBtnUserFlight1.selected = false;
      yourFlightInfoInputBox.typing = false;
      for (RadioButton radioButton : radioButtonsUserFlightInfo)
      {
        radioButton.draw = false;
      }
      for (RadioButton radioButton : radioButtonsUserFlightInfo2)
      {
        radioButton.draw = false;
      }
      userFligthInfo = null;
    }
  }
  );

  radioBtnUserFlight2.addListn((e, w) -> {
    if (radioBtnUserFlight2.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("back to home");
      currentScreenNumber = 0;
    }
  }
  );

  radioBtnUserFlight3.addListn((e, w) -> {
    if (radioBtnUserFlight3.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("new flight information screen");
      currentScreenNumber = 8;
    }
  }
  );

  radioBtnUserFlight4.addListn((e, w) -> {
    if (radioBtnUserFlight4.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("back to home");
      currentScreenNumber = 0;
    }
  }
  );

  newFlightInfoBtn.addListn((e, w) -> {
    if (newFlightInfoBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("new flight information screen");
      currentScreenNumber = 8;
    }
  }
  );

  newFlightInfoClear.addListn((e, w) -> {
    if (newFlightInfoClear.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      newFlightInfoInputBox.allUserInputs = "";
      newFlightInfoInputBox.typing = false;
      newFlightInformationData = new ArrayList<Flight>();
    }
  }
  );

  newFlightInfoInputBox.addKeyListn((e, w) -> {
    newFlightInfoInputBox.keyPressed();

    if (!newFlightInfoInputBox.allUserInputs.equals(""))
    {

      getScrollPageInformation(newFlightInfoInputBox.allUserInputs);
    }
  }
  );

  sortDateBtn.addListn((e, w) -> {
    if (sortDateBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("sort by date");
      newFlightInfoScroll.sortColumn("date");
    }
  }
  );
  sortByCarrierBtn.addListn((e, w) -> {
    if (sortByCarrierBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("sort by carrier");
      newFlightInfoScroll.sortColumn("carrier");
    }
  }
  );
  sortByDepAirportBtn.addListn((e, w) -> {
    if (sortByDepAirportBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("sort by dep airport");
      newFlightInfoScroll.sortColumn("DepAirport");
    }
  }
  );

  sortByArrAirportBtn.addListn((e, w) -> {
    if (sortByArrAirportBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("sort by arr airport");
      newFlightInfoScroll.sortColumn("ArrAirport");
    }
  }
  );

  flightPathBtn.addListn((e, w) -> {
    if (flightPathBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      println("Flight path screen");
      currentScreenNumber = 9;
    }
  }
  );

  flightPathInputBox.addKeyListn((e, w) -> {
    flightPathInputBox.keyPressed();

    if (!flightPathInputBox.allUserInputs.equals(""))
    {

      try {
        mapOfFlightPath.stateOr = (split(flightPathInputBox.allUserInputs, ','))[0];
        mapOfFlightPath.stateDest = (split(flightPathInputBox.allUserInputs, ','))[1];
        mapOfFlightPath.getCoords();
      }
      catch (Exception inputFailed) {
        println("Invalid Input Entered in Flight Path");
      }
    }
  }
  );

  heatMapBtn.addListn((e, w) -> {
    if (heatMapBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      currentScreenNumber = 10;
    }
  }
  );

  toggleHeatMap.addListn((e, w) -> {
    if (toggleHeatMap.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      firstHeatMapWidget.toggleShowArrivals();
      if (firstHeatMapWidget.showArrivals == false) {
        toggleHeatMap.widgetColor = color(255, 0, 0);
        toggleHeatMap.label = "Showing Departures";
      } else {
        toggleHeatMap.widgetColor = color(0, 0, 255);
        toggleHeatMap.label = "Showing Arrivals";
      }
    }
  }
  );

  homeBtn.addListn((e, w) -> {
    if (homeBtn.mouseIntercept(mouseX, mouseY))
    {
      clickSound.rewind();
      clickSound.play();
      currentScreenNumber = 0;
      yourFlightInfoInputBox.allUserInputs = "";
      chyronInputBox.allUserInputs = "";
      flightPathInputBox.allUserInputs = "";
      yourFlightInfoInputBox.allUserInputs = "";
      chyronInputBox.typing = false;
      flightPathInputBox.typing = false;
      yourFlightInfoInputBox.typing = false;
      newFlightInfoInputBox.typing = false;
    }
  }
  );

  for (RadioButton radioButton : radioButtonsUserFlightInfo)
  {
    radioButton.addListn((e, w) -> {
      clickSound.rewind();
      clickSound.play();
      if (radioButton.mouseIntercept(mouseX, mouseY) && mousePressed)
      {
        radioButton.handleClick(radioButtonsUserFlightInfo);
      }
    }
    );
  }

  for (RadioButton radioButton : radioButtonsUserFlightInfo2)
  {
    radioButton.addListn((e, w) -> {
      clickSound.rewind();
      clickSound.play();
      if (radioButton.mouseIntercept(mouseX, mouseY) && mousePressed)
      {
        radioButton.handleClick(radioButtonsUserFlightInfo2);
      }
    }
    );
  }
  for (RadioButton radioButton : airlineRadioButtons) //Created by Theresa James, for the airline radio buttons for the piechart screen
  {
    radioButton.addListn((e, w) -> {
      if (radioButton.mouseIntercept(mouseX, mouseY) && mousePressed)
      {
        radioButton.handleClick(airlineRadioButtons);
        selectedLabel = radioButton.getLabel();
        airline = selectedLabel;
        PieChartWidget.collectDataForPieChart(airline);
        PieChartWidget.draw();
      }
    }
    );
  }
}
