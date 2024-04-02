// Fcode done by Manon
// create a separate tab for organizational purposes
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

  mainBtn3.addListn((e, w) -> {
    if (mainBtn3.mouseIntercept(mouseX, mouseY))
    {
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
      chyronInputBox.allUserInputs = "";
      chyronInputBox.typing = false;
      flightsOfTheDay = new ArrayList<Flight>();
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
      println("back to home");
      currentScreenNumber = 0;
    }
  }
  );

  radioBtnUserFlight3.addListn((e, w) -> {
    if (radioBtnUserFlight3.mouseIntercept(mouseX, mouseY))
    {
      println("new flight information screen");
      currentScreenNumber = 8;
    }
  }
  );

  radioBtnUserFlight4.addListn((e, w) -> {
    if (radioBtnUserFlight4.mouseIntercept(mouseX, mouseY))
    {
      println("back to home");
      currentScreenNumber = 0;
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
  
  newFlightInfoClear.addListn((e, w) -> {
    if (newFlightInfoClear.mouseIntercept(mouseX, mouseY))
    {
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
      println("sort by date");
      newFlightInfoScroll.sortColumn("date");
    }
  }
  ); 
  sortByCarrierBtn.addListn((e, w) -> {
    if (sortByCarrierBtn.mouseIntercept(mouseX, mouseY))
    {
      println("sort by carrier");
      newFlightInfoScroll.sortColumn("carrier");
    }
  }
  ); 
  sortByDepAirportBtn.addListn((e, w) -> {
    if (sortByDepAirportBtn.mouseIntercept(mouseX, mouseY))
    {
      println("sort by dep airport");
      newFlightInfoScroll.sortColumn("DepAirport");
    }
  }
  ); 
  
  sortByArrAirportBtn.addListn((e, w) -> {
    if (sortByArrAirportBtn.mouseIntercept(mouseX, mouseY))
    {
      println("sort by arr airport");
      newFlightInfoScroll.sortColumn("ArrAirport");
    }
  }
  ); 

  flightPathBtn.addListn((e, w) -> {
    if (flightPathBtn.mouseIntercept(mouseX, mouseY))
    {
      println("Flight path screen");
      currentScreenNumber = 9;
    }
  }
  );

  flightPathInputBox.addKeyListn((e, w) -> {
    flightPathInputBox.keyPressed();

    if (!flightPathInputBox.allUserInputs.equals(""))
    {
      mapOfFlightPath.stateOr = (split(flightPathInputBox.allUserInputs, ", "))[0];
      mapOfFlightPath.stateDest = (split(flightPathInputBox.allUserInputs, ", "))[1];
      mapOfFlightPath.getCoords();
      flightPathInputBox.typing = true;
    }
  }
  );

  heatMapBtn.addListn((e, w) -> {
    if (heatMapBtn.mouseIntercept(mouseX, mouseY))
    {
      currentScreenNumber = 10;
    }
  }
  );

  homeBtn.addListn((e, w) -> {
    if (homeBtn.mouseIntercept(mouseX, mouseY))
    {
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
      if (radioButton.mouseIntercept(mouseX, mouseY) && mousePressed)
      {
        radioButton.handleClick(radioButtonsUserFlightInfo2);
      }
    }
    );
  }
}
