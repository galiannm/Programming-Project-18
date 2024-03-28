// This class was brought to you by Joel Jojan :D
// Modified by Maria Ceanuri by modifying class flight by adding 
//function get day and propteries and adding classes: groupedfligth, 
//flightday, flightprovider and flightdata
import java.util.ArrayList;
import java.util.regex.*;
import java.text.*;
import java.util.*;
// Cambialo debajo de la definicion de Flights
public enum FlightStatus
{
  ONTIME, CANCELLED, DIVERTED, DELAYED
}
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
  FlightStatus status;
  int timeDelayed;
  public String day;
  public String sortKey;

  Flight(String[] data) {

    flightDate = data[0]; // flightDate = "01/21/20 00:00" of "1/4/2022 12:00:00 AM"
    //day = flightDate.substring(3, 5); // American data format
    day =getDay();
    provider = data[1]; // provider = "AA"
    sortKey=provider + day;
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
    String cStatus = data[17]+data[18]; // cancelled + diverted
    switch (cStatus) {
    case "10":
      status=FlightStatus.CANCELLED;
      break;
    case "01":
      status=FlightStatus.DIVERTED;
      break;
    default:
      status=FlightStatus.ONTIME;
      timeDelayed= int(depTime) - int(expectedDepTime);
      if (timeDelayed >0) {
        status=FlightStatus.DELAYED;
      }
    }

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
  // I (Maria Ceanuri) added this classes and functions to process the data for the reliability line graph
  String getDay() {
    // 01/03/2022 00:00
    // 1/3/2022 12:00:00 AM
    String temp="00";
    Pattern pattern = Pattern.compile("/(\\d{1,2})/"); // American format ==> month/day/year
    Matcher matcher = pattern.matcher(flightDate);
    if (matcher.find()) {
      temp=matcher.group(1);
      if (temp.length()==1) {
        temp="0"+temp;
      }
    }
    return temp;
  }

  void draw()
  {
    print (expectedArrTime);
  }
}
class GroupedFlight {
  public String provider;
  public String day;
  public String sortKey;
  public int count;
  public int numberDelayed;
  public int numberCancelled;
  public int numberDiverted;
  public int timeDelayed;
  public int averageDelay;
  GroupedFlight(String provider, String day)
  {
    this.provider=provider;
    this.day = day;
    sortKey= provider + day;
    count=0;
    numberDelayed=0;
    numberCancelled=0;
    numberDiverted=0;
  }
  public void average() {
    averageDelay=0;
    if (numberDelayed >0) {
      averageDelay=(timeDelayed / numberDelayed);
    }
  }
}

class FlightDay extends GroupedFlight {
  // All data about one provider one day
  FlightDay(String provider, String day) {
    super( provider, day);
  }
  int valueX() {
    return Integer.parseInt(day);
  }
  int valueY() {
    return averageDelay;
  }
}

class FlightProvider {
  // All data about one provider
  public String provider;
  public color  providerColor;
  public boolean visible;
  public ArrayList<FlightDay> dayList;
  FlightDay currentDay;

  FlightProvider(String provider) {
    currentDay = new FlightDay("??", "99"); // Imposible
    dayList= new ArrayList<FlightDay>();
    this.provider= provider;
    visible=true;
    setColor(color(255));
  }
  void setColor(color providerColor) {
    this.providerColor=providerColor;
  }
  void setVisible(boolean visible) {
    this.visible=visible;
  }
  void setValues(boolean visible, color providerColor) {
    // println ("SetValues ", provider);
    setVisible(visible);
    setColor(providerColor);
  }
  void add( Flight flight) {
    if (!currentDay.sortKey.equals(flight.sortKey)) { // equals not !=
      currentDay.average();
      currentDay = new FlightDay(flight.provider, flight.day); // If new group create and add to the list
      dayList.add(currentDay);
    }
    currentDay.count++;
    switch (flight.status)
    {
    case DELAYED:
      currentDay.numberDelayed++;
      currentDay.timeDelayed+=flight.timeDelayed;
      break;
    case DIVERTED:
      currentDay.numberDiverted ++;
      break;
    case CANCELLED:
      currentDay.numberCancelled++;
      break;
    case ONTIME:
      break;
    } // switch
  }
}


class FlightData {
  // All de date about flights
  // Ten list os providers within list each day data.
  public HashMap<String, FlightProvider> providerList;
  FlightData(ArrayList <Flight>flights) {
    providerList = new HashMap<String, FlightProvider>();
     Collections.sort(flights, new Comparator<Flight>() {
      @Override public int compare(Flight p1, Flight p2) {
        return p1.sortKey.compareTo(p2.sortKey); // Ascending
      }
    }
    );
    createproviderDayFlights( flights);
    int i=0;
  for (FlightProvider provider : providerList.values()) {
   
    provider.setValues(true, colorOfCarriers[i]);
    i++;
  }   
  }
  void createproviderDayFlights(ArrayList <Flight>flights) {
    // Create provider-day list
    Flight flight = flights.get(0);
    FlightProvider currentProvider= new FlightProvider(flight.provider);
    providerList.put(flight.provider, currentProvider);  
    String provider=flight.provider; 
    for (int i = 1; i < flights.size(); i++) {
      flight = flights.get(i);
      if (!provider.equals(flight.provider)) {
        // Add a new FlightProvider
        provider=flight.provider;
        currentProvider= new FlightProvider(flight.provider);
        providerList.put(flight.provider, currentProvider);
      }
      currentProvider.add(flight);
    } // for
  } 
  //loadData
}
