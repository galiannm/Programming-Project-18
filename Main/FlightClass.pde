// This class was brought to you by Joel Jojan :D

import java.util.ArrayList;

class Flight {

  // All valuable variables from the CSV File. Please note the TYPE as they might not be what you expect.
  String flightDate;
  String provider;
  int flightNumber;
  String originAirport;
  String originCity;
  String originState;
  String originWAC;
  String destAirport;
  String destCity;
  String destState;
  String destWAC;
  int expectedDepTime;
  String depTime; //Cannot Int Parse this as if it is blank then you return a fail
  int expectedArrTime;
  String arrTime; //Cannot Int Parse this as if it is blank then you return a fail
  boolean cancelled;
  boolean diverted;
  int distance;

  Flight(String[] data) {
    flightDate = data[0]; // flightDate = "01/01/20 00:00"
    provider = data[1]; // provider = "AA"
    flightNumber = Integer.parseInt(data[2]); // flightNumber = int("1")
    originAirport = data[3]; // originAirport = "JFK"
    originCity = data[4]; // originCity = "Dallas"
    originState = data[5]; // originState = "TX"
    originWAC = data[7]; // originWAC = "12"
    destAirport = data[8]; // destAirport = "JFK"
    destCity = data[9];  // destCity = "New York"
    destState = data[11]; // destState = "NY"
    destWAC = data[12];  // destWAC = "2"
    expectedDepTime = Integer.parseInt(data[13]); //expectedDepTime = 545
    depTime = data[14]; // depTime = "545";
    expectedArrTime = Integer.parseInt(data[15]); //expectedArrTime = 645
    arrTime = data[16]; // arrTime = "700"
    cancelled = int(data[17]) == 1; // cancelled = 1 == 1 = True; / 0 == 1 = False;
    diverted = int(data[18]) == 1;  // diverted = 1 == 1 = True; / 0 == 1 = False;
    distance = int(data[19]);  // distance = int("123")

    //Cleaning up any CSV mishaps:
    originCity = originCity.replace("\"", "");
    destCity = destCity.replace("\"", "");
    originState = originState.replace("\"", "");
    destState = destState.replace("\"", "");
    originState = originState.trim();
    destState = destState.trim();
    //Getting rid of 00:00 at the end of date.
    int indexOfSpace = flightDate.indexOf(" ");
    flightDate = flightDate.substring(0, indexOfSpace);
  }
}
