// This file was originally brought to you by Manon, but later edited by Joel :D

void loadData() {
  flights = new ArrayList<Flight>();
  String[] rows = loadStrings("flights_full.csv");
  
  for (int i = 1; i < rows.length; i++){
    String[] data = rows[i].split(",");
    flights.add(new Flight(data));
  }
}
