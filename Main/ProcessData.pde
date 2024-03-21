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
int count = 0;

// This loads the data from the csv into objects
void loadData() {
  flights = new ArrayList<Flight>();
  String[] rows = loadStrings("flights_full.csv");
  
  for (int i = 1; i < rows.length; i++){
    String[] data = rows[i].split(",");
    flights.add(new Flight(data));
    println(i);
  }
}


// This is where we can collect the data to use in our graphing. (Note: I haven't got to making all neccesary variables.) It is important to program what variables you need in this loop
// to prevent lag throughout the program.
void collectData(String airline, String date, String state){
  airlines.add(flights.get(0).provider);
  for(int i = 0; i < flights.size(); i++){
    Flight flight = flights.get(i);
    
    if(int(flight.depTime) - flight.expectedDepTime > 0) {
      numberDelayed++;
    }
    
    if (flight.cancelled){ numberCancelled++; }
    if (flight.diverted){numberDiverted++;}
    if (flight.provider.contains(airline)) { specificAirline.add(flight);}
    
    // processing data for chyron
    if (flight.flightDate.equalsIgnoreCase(date) && flight.originState.equalsIgnoreCase(state))
    {
      flightsOfTheDay.add(flight);
    }
    
    // processing data for the bubble chart
    if (flight.provider.equalsIgnoreCase(airlines.get(count)))
    {

      if (flight.cancelled == true)
      {
        reliabilityBubbleChart[0][airlines.indexOf(airlines.get(count))] += 1; // cancelled
      } 
      else if (flight.diverted == true)
      {
        reliabilityBubbleChart[1][airlines.indexOf(airlines.get(count))] += 1; // diverted 
      } 
      else if (flight.expectedDepTime - Integer.parseInt(flight.depTime) > 10)
      {
        reliabilityBubbleChart[2][airlines.indexOf(airlines.get(count))] += 1; // delayed
      }
    } 
    else
    {
      airlines.add(flight.provider);
      count = airlines.indexOf(flight.provider);
    }
  }
}  

void flightStatus() //This function checks the amount of flights that are cancelled, diverted or on time
{
  int cancelled = 0;
  int diverted = 0;
  int flightsOnTime = 0;
  int delayedFlights = 0;
  int expectedTimeTaken = 0;
  //int totalNumOfFlights = specificAirline.size();
  for (int i =0; i < specificAirline.size(); i++)
  {
    Flight flight = specificAirline.get(i);
    if (flight.cancelled == true)
    {
      cancelled +=1;
    }
    else if (flight.diverted == true)
    {
      diverted += 1;
    }  
    if(flight.depTime == "") flight.depTime = "0";
    if (flight.arrTime =="") flight.arrTime = "0";
    expectedTimeTaken = flight.expectedArrTime - flight.expectedDepTime;
    int arrivalTime = Integer.parseInt(flight.arrTime);
    int depTime = Integer.parseInt(flight.depTime);
    int actualTimeTaken = arrivalTime - depTime;
    if ((actualTimeTaken - expectedTimeTaken) > 10)
    {
      delayedFlights +=1;
    }
    else 
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
