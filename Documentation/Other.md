# Documentation : `Screen`, `Gradient` and `FlightClass`

Authors :  
* Manon Galian
* Joel Jojan
   
---

## Table of Contents:
1. [`Screen` Class](#1-screen-class)
2. [`Gradient` Class](#2-gradient-class)
3. [`FlightClass` Class](#3-flightclass-class)

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
|**data**|`String[]`|A ``` List ``` of data which should be in the format above.|
|**flightDate**|`String`| A string of the date of the flight |
|**provider**|`String`| A string of the provider of the flight |
|**flightNumber**|`int`| A int of the flight number of the flight |
|**originAirport**|`String`| A string of the origin airport of the flight |
|**originCity**|`String`| A string of the origin city of the flight |
|**originWAC**|`String`| A string of the origin WAC of the flight |
|**destAirport**|`String`| A string of the destination airport of the flight |
|**destCity**|`String`| A string of the destination city of the flight |
|**destState**|`String`| A string of the destination state of the flight |
|**destWAC**|`String`| A string of the destiniation WAC of the flight |
|**expectedDepTime**|`int`| An int of the expected departure time of the flight |
|**depTime**|`String`| A string of the actual departure time of the flight |
|**expectedArrTime**|`int`| An int of the expected arrival time of the flight |
|**arrTime**|`String`| A string of the actual arrival time of the flight |
|**cancelled**|`boolean`| A booelean value indicating if the flight is cancelled |
|**diverted**|`boolean`| A booelean value indicating if the flight is diverted |
|**distance**|`int`| An int of the distance travelled by the flight |



