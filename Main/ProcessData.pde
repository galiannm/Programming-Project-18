// This file was originally brought to you by Manon, but later edited by Joel :D
// Below are the variable for which data will be collected

int numberDelayed = 0;
int numberDiverted = 0;
int numberCancelled = 0;
int delayedFlights = 0;
int expectedTimeTaken = 0;
int totalNumOfFlights = specificAirline.size();
int[][] reliabilityBubbleChart = new int[3][10];
ArrayList<String> airlines = new ArrayList<String>();
ArrayList<Flight> flightsOfTheDay = new ArrayList<Flight>();
ArrayList<Flight> newFlightInformationData = new ArrayList<Flight>();
Table newFlightInformationTable = new Table();

ArrayList<ArrayList<Object>> distBetweenStates = new ArrayList<ArrayList<Object>>();
String[] airlinesArray = airlines.toArray(new String[0]); // Convert ArrayList to array

int[][] totalDistancePerCarrier = new int[10][10];
int[][] numFlightsPerCarrier = new int[10][10];
int[][] numFlightsPerDate = new int[32][10]; // for the slider 
int[][] totalDistancePerDate = new int[32][10]; // for the slider

Flight userFligthInfo;
String origineDestState = "";
int count = 0;

//Departures and Arrivals per state - Joel
HashMap<String, HashMap<String, Integer>> stateDeparturesArrivals = new HashMap<>();

// This loads the data from the csv into objects
void loadData() {
  flights = new ArrayList<Flight>();
  String[] rows = loadStrings("flights_full.csv");

  for (int i = 1; i < rows.length; i++) {
    String[] data = rows[i].split(",");
    flights.add(new Flight(data));
  }
}


// This is where we can collect the data to use in our graphing. (Note: I haven't got to making all neccesary variables.) It is important to program what variables you need in this loop
// to prevent lag throughout the program.
void collectData(String airline, String date, String state) {
  airlines.add(flights.get(0).provider);
  initialisationOfData();
  //Collecting an arraylist of States for heatmap: - Joel
  for (Flight flight : flights) {
    if (!states.contains(flight.originState)) {
      states.add(flight.originState);
    }
    if (!states.contains(flight.destState)) {
      states.add(flight.destState);
    }
  }

  //Initialized a hashmap in the format: "TX" : {"arrived" : 0 , "departed" : 0}
  for (String stateAbbrev : states) {
    if (!stateDeparturesArrivals.containsKey(stateAbbrev)) {
      stateDeparturesArrivals.put(stateAbbrev, new HashMap<>());
      stateDeparturesArrivals.get(stateAbbrev).put("departed", 0);
      stateDeparturesArrivals.get(stateAbbrev).put("arrived", 0);
    }
  }

  for (Flight flight : flights) {
    if (!flight.cancelled && !flight.diverted) {
      stateDeparturesArrivals.get(flight.originState).put("departed", stateDeparturesArrivals.get(flight.originState).get("departed")+1);
      stateDeparturesArrivals.get(flight.destState).put("arrived", stateDeparturesArrivals.get(flight.destState).get("arrived")+1);
    }

    if (int(flight.depTime) - flight.expectedDepTime > 0) {
      numberDelayed++;
    }

    if (flight.cancelled) {
      numberCancelled++;
    }
    if (flight.diverted) {
      numberDiverted++;
    }
    if (flight.provider.contains(airline)) {
      specificAirline.add(flight);
    }

    // processing data for the bubble chart
    if (flight.provider.equalsIgnoreCase(airlines.get(count)))
    {

      if (flight.cancelled == true)
      {
        reliabilityBubbleChart[0][airlines.indexOf(airlines.get(count))] += 1; // cancelled
      } else if (flight.diverted == true)
      {
        reliabilityBubbleChart[1][airlines.indexOf(airlines.get(count))] += 1; // diverted
      } else if (flight.expectedDepTime - Integer.parseInt(flight.depTime) > 10)
      {
        reliabilityBubbleChart[2][airlines.indexOf(airlines.get(count))] += 1; // delayed
      }
    } else
    {
      airlines.add(flight.provider);
      count = airlines.indexOf(flight.provider);
    }

    int carrierIndex = airlines.indexOf(flight.provider);
    if (carrierIndex != -1)
    {
      numFlightsPerCarrier[0][carrierIndex]++; // Increment the number of flights for the carrier
      totalDistancePerCarrier[0][carrierIndex] += flight.distance;// Add the distance of the flight to the total distance for the carrier
    }
    
    // data for slider1
    if (flight.flightDayAsInt >= 1 && flight.flightDayAsInt <= 31 && carrierIndex >= 0 && carrierIndex < 10) 
    { 
        numFlightsPerDate[flight.flightDayAsInt][carrierIndex]++;
    }
    
    // data for slider2
    if (flight.flightDayAsInt >= 1 && flight.flightDayAsInt <= 31 && carrierIndex >= 0 && carrierIndex < 10) 
    {
        totalDistancePerDate[flight.flightDayAsInt][carrierIndex] += flight.distance;
    }

    //collect data for flight path Map
    flightPathData(flight);
  }
  data = new FlightData(flights);
}

void initialisationOfData()
{
  for (int i = 0; i < 4; i++) {
    distBetweenStates.add(new ArrayList<>());
  }
  if (flights.get(0).originState.compareTo(flights.get(0).destState) < 0)
  {
    origineDestState = flights.get(0).originState + flights.get(0).destState;
  } else
  {
    origineDestState = flights.get(0).destState + flights.get(0).originState;
  }
  //println(origineDestState);
  distBetweenStates.get(0).add(origineDestState);
  distBetweenStates.get(1).add(1);
  distBetweenStates.get(2).add(flights.get(0).distance);
  distBetweenStates.get(3).add(0);
}

void getAverageDistance()
{
  for (int i = 0; i < distBetweenStates.get(2).size(); i++)
  {
    distBetweenStates.get(3).add(i, (int)(distBetweenStates.get(2).get(i))/(int)(distBetweenStates.get(1).get(i)));
  }
}
//flightStautus function was created by Theresa James.
void flightStatus() //This function checks the amount of flights that are cancelled, diverted or on time
{
  reliabilityData.clear();
  int cancelled = 0;
  int diverted = 0;
  int flightsOnTime = 0;
  int delayedFlights = 0;
  int expectedTimeTaken = 0;
  int totalNumOfFlights = specificAirline.size();


  for (int i =0; i < specificAirline.size(); i++)
  {
    Flight flight = specificAirline.get(i);
    if (flight.cancelled == true)
    {
      cancelled +=1;
    } else if (flight.diverted == true)
    {
      diverted += 1;
    }
    if (flight.depTime == "") flight.depTime = "0";
    if (flight.arrTime =="") flight.arrTime = "0";
    expectedTimeTaken = flight.expectedArrTime - flight.expectedDepTime;
    int arrivalTime = Integer.parseInt(flight.arrTime);
    int depTime = Integer.parseInt(flight.depTime);
    int actualTimeTaken = arrivalTime - depTime;
    if ((actualTimeTaken - expectedTimeTaken) > 10)
    {
      delayedFlights +=1;
    } else
    {
      flightsOnTime +=1;
    }
  }

  println("Total number of flights " + totalNumOfFlights);
  println("Flights on time " + flightsOnTime);
  println("Delayed " + delayedFlights);
  println("Diverted " + diverted);
  println("Cancelled " + cancelled);
  reliabilityData.add(flightsOnTime);
  reliabilityData.add(delayedFlights);
  reliabilityData.add(diverted);
  reliabilityData.add(cancelled);
}

// processing data for the flight path map
void flightPathData(Flight flight)
{
  origineDestState = "";
  if (flight.originState.compareTo(flight.destState) < 0)
  {
    origineDestState = flight.originState + flight.destState;
  } else
  {
    origineDestState = flight.destState + flight.originState;
  }
  if (!distBetweenStates.get(0).contains(origineDestState))
  {
    distBetweenStates.get(0).add(origineDestState);
    distBetweenStates.get(1).add(1); // Initialize flight count
    distBetweenStates.get(2).add(flight.distance);
    distBetweenStates.get(3).add(0);
  } else
  {
    distBetweenStates.get(1).set(distBetweenStates.get(0).indexOf(origineDestState),
      (int)(distBetweenStates.get(1).get(distBetweenStates.get(0).indexOf(origineDestState)))+1);
    distBetweenStates.get(2).set(distBetweenStates.get(0).indexOf(origineDestState),
      (int)(distBetweenStates.get(2).get(distBetweenStates.get(0).indexOf(origineDestState)))+flight.distance);
  }
}

// processing data for the user's flight informational sheet
void getFlightInfoSheetInformation(String userInput) //fligthNum, date, airport, carrier, state, deststate
{
  String[] information = userInput.split(", ");
    int flightNum = Integer.parseInt(information[0]);
  String date = information[1];
  String airport = information[2];
  String carrier = information[3];
  String origineState = information[4];
  String destState = information[5];
  for (int i = 0; i < flights.size(); i++) {
    Flight flight = flights.get(i);
    if (flight.flightNumber == flightNum && flight.flightDate.equalsIgnoreCase(date) &&
      flight.originAirport.equalsIgnoreCase(airport) && flight.provider.equalsIgnoreCase(carrier) &&
      flight.originState.equalsIgnoreCase(origineState) && flight.destState.equalsIgnoreCase(destState))
    {
      userFligthInfo = flight;
    }
  }
}

// processing information for the chyron
void getFlightOTDInformation(String userInput) // date, airport
{
  String[] information = userInput.split(", ");
  String date = information[0];
  String state = information[1];
  for (int i = 0; i < flights.size(); i++) {
    Flight flight = flights.get(i);
    // processing data for chyron
    if (flight.flightDate.equalsIgnoreCase(date) && flight.originState.equalsIgnoreCase(state))
    {
      flightsOfTheDay.add(flight);
    }
  }
}

// prcessing data for the scroll page
void getScrollPageInformation(String userInput) // startDate, endDate, origineState, destinationState
{
  String[] information = userInput.split(", ");
  String startDate = information[0];
  String[] decomposedUserDate = startDate.split("/");
  int userStartDay = Integer.parseInt(decomposedUserDate[1]);

  String endDate = information[1];
  decomposedUserDate = endDate.split("/");
  int userEndDay = Integer.parseInt(decomposedUserDate[1]);

  String origineState = information[2];
  String destinationState = information[3];
  for (int i = 0; i < flights.size(); i++) {
    Flight flight = flights.get(i);
    String[] decomposedDate = flight.flightDate.split("/");
    int day = Integer.parseInt(decomposedDate[1]);
    if ((userStartDay <= day && day <= userEndDay)
      && flight.originState.equalsIgnoreCase(origineState) && flight.destState.equalsIgnoreCase(destinationState))
    {

      newFlightInformationData.add(flight);
    }
  }
  println(newFlightInformationData.size());
}
