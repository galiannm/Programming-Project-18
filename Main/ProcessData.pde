// This file was originally brought to you by Manon, but later edited by Joel :D


// Below are the variable for which data will be collected
int numberDelayed = 0;
int numberDiverted = 0;
int numberCancelled = 0;


// This loads the data from the csv into objects
void loadData() {
  flights = new ArrayList<Flight>();
  String[] rows = loadStrings("flights_full.csv");
  
  for (int i = 1; i < rows.length; i++){
    String[] data = rows[i].split(",");
    flights.add(new Flight(data));
  }
}


// This is where we can collect the data to use in our graphing. (Note: I haven't got to making all neccesary variables.) It is important to program what variables you need in this loop
// to prevent lag throughout the program.
void collectData(){
  for(int i = 0; i < flights.size(); i++){
    Flight flight = flights.get(i);
    
    if(int(flight.depTime) - flight.expectedDepTime > 0) {
      numberDelayed++;
    }
    
    if (flight.cancelled){ numberCancelled++; }
    if (flight.diverted){numberDiverted++;}
  }
}  
