# Documentation : `Charts` and `Maps`

Authors :   
* Manon Galian

Editors :  
* Joel Jojan
* Theresa James
* Maria Ceanuri
* Nandana Arun
---

## Table of Contents:
1. [`Chart` Class](#1-chart-class)
    1. [`BarChart` Class](#1a-barchart-class)
    2. [`lineGraph` Class](#1b-linegraph-class)
    3. [`BubbleChart` Class](#1c-bubblechart-class)
2. [`pieChart` Class](#2-piechart-class)
3. [`HeatMapWidget` Class]()#3-heatmapwidget-class
4. [`MapOfFlightPath` Class](#4-mapofflightpath-class)

---

## 1. `Chart` Class


### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

### Brief Description :

The `Chart` class is the parent class of all charts. It has minimal functionality, it displays a frame, title, axis and labels of the chart.

### Class Summary :

```java
class Chart
extends Widget
```

#### Constructor Parameters :

```java
 Chart(int x, 
 int y, 
 int widgetWidth, 
 int widgetHeight, 
 color widgetColor, 
 PFont widgetFont, 
 String title, 
 String xLabel, 
 String yLabel)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the chart (center)|
|**y**|`int`|y coordinate of the chart (center)|
|**widgetWidth**|`int`|width of the chart|
|**widgetHeight**|`int`|height of the chart|
|**widgetColor**|`color`|height of the chart|
|**widgetFont**|`PFont`|height of the chart|
|**title**|`String`|title of the chart|
|**xLabel**|`String`|label for the x-axis of the chart|
|**yLabel**|`String`|label for the y-axis of the chart|

---

### 1.a. `BarChart` Class


#### Contributors :

> Main : Nandana Arun    
> Editor(s) : N/A

#### Brief Description :

##### Class Summary :

```java
class BarChart
extends Chart
```

##### Constructor Parameters :

```java
 BarChart(int x, 
 int y, 
 int widgetWidth, 
 int widgetHeight, 
 color widgetColor,
 PFont widgetFont, 
 int gap, 
 String title, 
 String xLabel, 
 String yLabel, 
 int[] data, 
 ArrayList<String> labels)
```

##### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the barChart (center)|
|**y**|`int`|y coordinate of the barChart (center)|
|**widgetWidth**|`int`|width of the barChart|
|**widgetHeight**|`int`|height of the barChart|
|**widgetColor**|`color`|color of the barChart|
|**widgetFont**|`PFont`|font text for the barChart|
|**gap**|`int`|TO DO|
|**title**|`String`|title of the barChart|
|**xLabel**|`String`|x-axis label for the barChart|
|**yLabel**|`String`|y-axis label for the barChart|
|**data**|`int[]`|data for the barChart|
|**labels**|`ArrayList<String>`|label of each bar of the barChart|

---

### 1.b. `lineGraph` Class


#### Contributors :

> Main : Maria Ceanuri  
> Editor(s) : N/A

#### Brief Description :
The lineGraph class is an extension of the Chart class. It allows the user to display information that changes continuously over time (two dimentions of data). Each point is associated with a x coordinate and y coordinate. 
##### Class Summary :

```java
class lineGraph
extends Chart
```

##### Constructor Parameters :

```java
 lineGraph(int x, 
 int y, 
 int widgetWidth, 
 int widgetHeight, 
 String title, 
 String xCoordinates, 
 String yCoordinates, 
 PFont widgetFont, 
 FlightData data, 
 color widgetColor )
```

##### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the lineGraph (center)|
|**y**|`int`|y coordinate of the lineGraph (center)|
|**widgetWidth**|`int`|width of the lineGraph|
|**widgetHeight**|`int`|height of the lineGraph|
|**title**|`String`|title of the lineGraph|
|**xCoordinates**|`String`|x-axis label for the lineGraph|
|**yCoordinates**|`String`|y-axis label for the lineGraph|
|**widgetFont**|`PFont`|font text for the lineGraph|
|**widgetColor**|`color`|color text for the lineGraph|
|**data**|`FlightData`|data for the lineGraph|

---

### 1.c. `BubbleChart` Class

The `BubbleChart` class is an extension of the `Chart` class. It allows the user to display three dimentions of data. Each point is associated with a x coordinate, y coordinate and a size.

#### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

#### Brief Description :

##### Class Summary :

```java
class BubbleChart
extends Chart
```

##### Constructor Parameters :

```java
 BubbleChart(int x, 
 int y, 
 int widgetWidth, 
 int widgetHeight, 
 color widgetColor,
 PFont widgetFont, 
 String title, 
 int[] dataX, 
 int[] dataY, 
 int[] dataSize, 
 ArrayList<String> dataLabel,
 color[] dataColor, 
 float scale, 
 String xLabel, 
 String yLabel, 
 String legendLabel)
```

##### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the bubbleChart (center)|
|**y**|`int`|y coordinate of the bubbleChart (center)|
|**widgetWidth**|`int`|width of the bubbleChart|
|**widgetHeight**|`int`|height of the bubbleChart|
|**widgetColor**|`color`|height of the bubbleChart|
|**widgetFont**|`PFont`|height of the bubbleChart|
|**title**|`String`|title of the bubbleChart|
|**dataX**|`int[]`|x-axis values for the bubbleChart|
|**dataY**|`int[]`|y-axis values for the bubbleChart|
|**dataSize**|`int[]`|size values for the bubbleChart|
|**dataLabel**|`ArrayList<String>`|label of each point in the bubbleChart|
|**dataColor**|`color[]`|color of each point in the bubbleChart|
|**scale**|`float`|scale adjustment value|
|**xLabel**|`String`|label for the x-axis of the chart|
|**yLabel**|`String`|label for the y-axis of the chart|
|**legendLabel**|`String`|label for the y-axis of the chart|

---

## 2. `pieChart` Class


### Contributors :

> Main : Theresa James    
> Editor(s) : N/A

### Brief Description :
'pieChart' class is an extension of 'Widget' class. It displays information like flights on time, delayed flights, diverted and cancelled flights in pieChart for each airline. 
### Class Summary :

```java
class pieChart
extends Widget
```

#### Constructor Parameters :

```java
 pieChart(ArrayList<Integer> data)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**data**|`ArrayList<Integer>`|the vales of the data|

---

## 2. `HeatMapWidget` Class


### Contributors :

> Main : Joel Jojan    
> Editor(s) : N/A

### Brief Description :  
`HeatmapWidget` is used to generate a heatMap of an SVG of the US. It displays each State in a color according to the number arrivals/departures of said State.

### Class Summary :

```java
class HeatMapWidget
extends InteractiveWidget
```

#### Constructor Parameters :

```java
 HeatMapWidget(int x, 
 int y, 
 int widgetWidth, 
 int widgetHeight,
 PShape mapImage, 
 HashMap<String, HashMap<String, Integer>> stateDeparturesArrivals,
 ArrayList<String> states, 
 boolean showArrivals)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the heatMap |
|**y**|`int`|y coordinate of the heatMap |
|**widgetWidth**|`int`|width of the heatMap|
|**widgetHeight**|`int`|height of the heatMap|
|**mapImage**|`PShape`|Image of Map to be used (.SVG)|
|**stateDeparturesArrivals**|`HashMap<String, HashMap<String, Integer>>`|Hashmap which is used to correlate State: {Departures: x Arrivals: y}|
|**states**|`ArrayList<String>`|An arraylist of the US states|
|**showArrivals**|`boolean`|flag that is toggled to change whether we show arrivals or departures|

---

## 2. `MapOfFlightPath` Class


### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

### Brief Description :

### Class Summary :

```java
class HeatMapWidget
extends InteractiveWidget
```

#### Constructor Parameters :

```java
 HeatMapWidget(int x, 
 int y, 
 int mapWidth, 
 int mapHeight, 
 PImage mapImg, 
 String userInput)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the flightPathMap (center)|
|**y**|`int`|y coordinate of the flightPathMap (center)|
|**mapWidth**|`int`|width of the flightPathMap|
|**mapHeight**|`int`|height of the flightPathMap|
|**userInput**|`String`|user input of the flightPathMap|

---
