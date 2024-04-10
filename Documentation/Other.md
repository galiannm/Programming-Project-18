# Documentation : `Screen`, `Gradient` and `FlightClass`

Authors :  
* Manon Galian
* Joel Jojan
   
---

## Table of Contents:
1. [`Screen` Class](#1-screen-class)
2. [`Gradient` Class](#2-gradient-class)
3. [`FlightClass` Class](#3-flightclass-class)
4. [`Music and Sounds`](#4-Music-and-Sounds)
5. [`Loading Threads`](#5-Loading-Threads)

## 1. `Screen` Class

### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

### Brief Description :

The `Screen` class allows user to create various screen in a program, with each screen being responsible for rendering the widgets present whithin the screen. To manage these widgets efficiently, every widget that is created is added to the ArrayList of widgets of that screen.  
The `Screen` class only has a single contructor parameter; `backgroundColors` which is an array of `color` type. This parameter is used to set the background color gradient of the screen.

### Class Summary :

```java
class Screen
extends none
```

#### Constructor Parameters :

```java
 Screen(color[] backgroundColors)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**backgroundColors**|`color[]`|background color(s) of the screen|

#### Notable Instance Variable :

|Name|Type|Quick Description|
|----|----|-----------|
|**widgets**|`ArrayList<Widget>`|an ArrayList of the widgets present in the screen|

#### Adding Widgets to a Screen :

```java
 myScreen.addWidget(aWidget);
 myScreen.addWidget(anotherWidget);
```
---

## 2. `Gradient` Class

### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

### Brief Description :

The `Gradient` class provides the funtionality of creating customisable esthetic gradients. The user may enter as many or as litle colors as needed.

### Class Summary :

```java
class Gradient
extends none
```

#### Constructor Parameters :

```java
 Gradient(int x, 
 int y, 
 float gradientWidth, 
 float gradientHeight, 
 color[] colors)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the gradient (top left corner)|
|**y**|`int`|y coordinate of the gradient (top left corner)|
|**w**|`float`|width of the gradient|
|**h**|`float`|height of the gradient|
|**backgroundColors**|`color[]`|color(s) of the gradient|

---

## 3. `FlightClass` Class

### Contributors :

> Main : Joel Jojan    
> Editor(s) : Maria Ceanuri

### Brief Description :

`Flight Class` is how we store and access our data throughout our program. It works by turning the rows in the _flights_full.csv_ and turning them into `flight objects`.

### Class Summary :

```java
class Flight{
String flightDate; 
```

#### Class Attributes :

```java
class Flight {
  String flightDate;            // flightDate = "01/21/20 00:00" of "1/4/2022 12:00:00 AM"
  String provider;              // provider = "AA"
  int flightNumber;             // flightNumber = int("1")
  String originAirport;         // originAirport = "JFK"
  String originCity;            // originCity = "Dallas"
  String originState;           // originState = "TX"
  String originWAC;             // OriginWAC = "2"
  String destAirport;           // destAirport = "jFk"
  String destCity;              // destCity = "New York"
  String destState;             // destState = "NY"
  String destWAC;               // destWAC = "2"
  int expectedDepTime;          // expectedDepTime = 545  
  String depTime;               // depTime = "545";
  int expectedArrTime;          // expectedArrTime = 645
  String arrTime;               // arrTime = "700"
  boolean cancelled;            // cancelled == 1 = true; cancelled == 0 = false;
  boolean diverted;             // diverted == 1 = true; diverted == 0 = false;
  int distance;                 // distance = int("123")         
}

 Flight(String[] data) {
   //Code
 }
```

#### Class Variables Explanation:

|Name|Type|Quick Description|Format|
|----|----|-----------|-----|
|**data**|`String[]`|A ``` List ``` of data which should be in the format above.|.CSV|
|**flightDate**|`String`| A string of the date of the flight | "01/01/2022" |
|**provider**|`String`| A string of the provider of the flight | "AA" |
|**flightNumber**|`int`| A int of the flight number of the flight | 1 |
|**originAirport**|`String`| A string of the origin airport of the flight | "JFK" |
|**originCity**|`String`| A string of the origin city of the flight | "New York" |
|**originState**|`String`| A string of the origin state of the flight | "CA" |
|**originWAC**|`String`| A string of the origin WAC of the flight | "12" |
|**destAirport**|`String`| A string of the destination airport of the flight | "JFK" |
|**destCity**|`String`| A string of the destination city of the flight | "Dallas" |
|**destState**|`String`| A string of the destination state of the flight | "TX" |
|**destWAC**|`String`| A string of the destiniation WAC of the flight | "12" |
|**expectedDepTime**|`int`| An int of the expected departure time of the flight | 510 |
|**depTime**|`String`| A string of the actual departure time of the flight | "520" |
|**expectedArrTime**|`int`| An int of the expected arrival time of the flight | 630 |
|**arrTime**|`String`| A string of the actual arrival time of the flight | "630" |
|**cancelled**|`boolean`| A booelean value indicating if the flight is cancelled | true/false |
|**diverted**|`boolean`| A booelean value indicating if the flight is diverted | true/false |
|**distance**|`int`| An int of the distance travelled by the flight | 123 |


## 4. `Music and Sounds`

### Contributors :

> Main : Joel Jojan
> Editor(s) : N/A

### Brief Description :

Using the pre-built `Minim` library, background music as well as sound effects were implemented. Click noises for the typing, mousePress, and interactions as well as a soothing melody in the background. Sourced most of the effects from [Pixabay](pixabay.com). The music was sourced from Spotify and is from [Undertale](undertale.com).

#### Code:

```java
import ddf.minim.*;
Minim minim;
AudioPlayer backgroundMusic, clickSound, key1, key2, key3, key4, key5, key6, backSpaceKey, enterKey;

minim = new Minim(this);
backgroundMusic = minim.loadFile("backgroundMusic.mp3");
backgroundMusic.setGain(-20);
backgroundMusic.play();
backgroundMusic.loop();
clickSound = minim.loadFile("mouseClick.mp3");
clickSound.setGain(-20);
key1 = minim.loadFile("keyClick1.mp3");
key2 = minim.loadFile("keyClick2.mp3");
key3 = minim.loadFile("keyClick3.mp3");
key4 = minim.loadFile("keyClick4.mp3");
key5 = minim.loadFile("keyClick5.mp3");
key6 = minim.loadFile("keyClick6.mp3");
enterKey = minim.loadFile("enterKey.mp3");
backSpaceKey = minim.loadFile("backSpaceKey.mp3");
key1.setGain(-20);
key2.setGain(-20);
key3.setGain(-20);
key4.setGain(-20);
key5.setGain(-20);
key6.setGain(-20);
enterKey.setGain(-20);
backSpaceKey.setGain(-20);
```

## 5. `Loading Threads`

### Contributors :

> Main : Joel Jojan
> Editor(s) : N/A

### Brief Description :

When loading our data from the CSV into our [Flight](#3-flightclass-class) objects it prohibits processing from drawing anything leaving the screen blank until its finished loading. To create a less frustrating experience we implemented a loading screen using the `GifAnim` library. For the duration of the loading process a gif of an aeroplane created by Manon will play. When finished it will go to the main program and act as normal. This feature was implemented using Threads in processing.

#### Code:

```java
import gifAnimation.*;
boolean isLoading = true;
Gif loadingGif;

void setup()
{
  loadingGif = new Gif(this, "loading.gif");
  loadingGif.play();
  //Threads to load data while displaying a gif - Joel
  Thread dataLoadingThread = new Thread(new Runnable() {
    public void run() {
      USA = loadShape("USA.svg");
      loadData(); // Load CSV data
      collectData(airline, "1/1/2022", "NY"); // Process data
      getAverageDistance();
      flightStatus();
      currentScreenNumber = 0;

      addWidgetsToSetup();
      interactiveWidgetActions();
      isLoading = false; // Set loading flag to false once data loading is complete
    }
  }
  );
  dataLoadingThread.start()
}

void draw()
{
  synchronized(this) {
    if (isLoading) {
      image(loadingGif, 0, 0);
    } else
    {
      //draw Main screen
    }
  }
}
```



