# Documentation : `Wiget`, `Charts`, `Maps`, `Other` and its Descendants

## Table of Contents:
1. [`Widget` Class](#1-widget-class)
    1. [`Chyron` Class](#1a-chyron-class)
    2. [`infoSheetInformation` Class](#1b-infosheetinformation-class)
    3. [`MiniScreen` Class](#1c-miniscreen-class)
    4. [`InteractiveWidget` Class](#1d-interactivewidget-class)
        1. [`MouseActionListener` Interface](#1d1-mouseactionlistener-class)
        2. [`KeyActionListener` Interface](#1d2-keyactionlistener-class)
        3. [`AnimatedWidget` Interface](#1d3-animatedwidget-class)
        4. [`ImageWidget` Class](#1d4-imagewidget-class)
        5. [`Slider` Class](#1d5-slider-class)
        6. [`Checkbox` Class](#1d6-checkbox-class)
            1. [`CheckboxExtended` Class](#1d6i-checkboxextended-class)
        7. [`RadioButton` Class](#1d7-radiobutton-class)
        8. [`InputBox` Class](#1d8-inputbox-class)
        9. [`ScrollPage` Class](#1d9-scrollpage-class)
    3. [`Charts` and `Maps` (and subclasses)](ChartAndMaps.md)
2. [`Other`](Other.md)

---

## 1. `Widget` Class

### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

#### Brief Description :

### Class Summary :

```java
class Widget
extends None
```

#### Constructor Parameters :
```java
Widget(int x, 
int y, 
int widgetWidth, 
int widgetHeight, 
String label, 
color widgetColor, 
PFont widgetFont, 
int gap, 
int curve, 
boolean drawStroke)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the widget (top left corner)|
|**y**|`int`|y coordinate of the widget (top left corner)|
|**widgetWidth**|`int`|width of the widget|
|**widgetHeight**|`int`|height of the widget|
|**label**|`String`|The widget's label|
|**widgetFont**|`PFont`|The font of the widget|
|**gap**|`int`|gap between rows in pixels|
|**curve**|`int`|curve of the egdes of the widget|
|**drawStroke**|`boolean`|flags that determines if the widget draws a with stroke|

---

### 1.a. Chyron Class

#### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

#### Brief Description :


#### Class Summary :

```java
class Chyron
extends Widget
```

##### Constructor Parameters :
```java
Chyron(int x, 
int y, 
int chyronWidth, 
int chyronHeight,
color textColor, 
PFont widgetFont, 
int gap, 
MiniScreen miniScreen, 
String userInput)
```

##### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the widget (top left corner)|
|**y**|`int`|y coordinate of the widget (top left corner)|
|**chyronWidth**|`int`|width of the chyron|
|**chyronHeight**|`int`|height of the chyron|
|**widgetFont**|`PFont`|The font of the chyron|
|**gap**|`int`|alignment correction|
|**miniScreen**|`MiniScreen`|mini screen of the chyron|
|**userInput**|`String`|user input (date, state)|

---

### 1.b. infoSheetInformation Class

#### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

#### Brief Description :

#### Class Summary :

```java
class infoSheetInformation
extends Widget
```

##### Constructor Parameters :
```java
infoSheetInformation(int xImg, 
int yImg, 
int wImg, 
int hImg, 
color textColor, 
PFont textFont)
```

##### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**xImg**|`int`|x coordinate of the infoSheet (top left corner)|
|**yImg**|`int`|y coordinate of the infoSheet (top left corner)|
|**wImg**|`int`|width of the infoSheet|
|**hImg**|`int`|height of the infoSheet|
|**textColor**|`PImage`|The color of the infoSheet|
|**widgetFont**|`PFont`|The font of the infoSheet|

---

### 1.c. MiniScreen Class

#### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

#### Brief Description :

#### Class Summary :

```java
class MiniScreen
extends Widget
```

##### Constructor Parameters :

```java
MiniScreen(int x, 
int y, 
int miniScreenWidth, 
int miniScreenHeight, 
String label,
int textSize, 
int labelHeight, 
color widgetColor, 
PFont widgetFont)
```

##### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the miniScreen (top left corner)|
|**y**|`int`|y coordinate of the miniScreen (top left corner)|
|**miniScreenWidth**|`int`|width of the miniScreen|
|**miniScreenHeight**|`int`|height of the miniScreen|
|**label**|`String`|label of the miniScreen|
|**textSize**|`int`|text size of the miniScreen|
|**labelHeight**|`int`|height of label of the miniScreen|
|**widgetColor**|`color`|color of the miniScreen|
|**widgetFont**|`PFont`|font of text of the miniScreen|

---

### 1.d. InteractiveWidget Class

#### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

#### Class Summary :

```java
class InteractiveWidget
extends Widget
```

#### Constructor Parameters :

```java
 InteractiveWidget(int x, 
 int y, 
 int widgetWidth, 
 int widgetHeight, 
 String label, 
 color widgetColor, 
 PFont widgetFont, 
 int gap, 
 int curve, 
 boolean drawStroke)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the widget (top left corner)|
|**y**|`int`|y coordinate of the widget (top left corner)|
|**widgetWidth**|`int`|width of the widget|
|**widgetHeight**|`int`|height of the widget|
|**label**|`String`|The widget's label|
|**widgetFont**|`PFont`|The font of the widget|
|**gap**|`int`|gap used to correct the widget's position|
|**curve**|`int`|curve of the egdes of the widget|
|**drawStroke**|`boolean`|flags that determines if the widget draws a with stroke|

---

#### 1.d.1. MouseActionListener Interface

##### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

##### Brief Description :

##### Class Summary :

---

#### 1.d.2. KeyActionListener Interface

##### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

##### Brief Description :

##### Class Summary :

---

#### 1.d.3. AnimatedWidget Class

##### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

##### Brief Description :

#### Class Summary :

```java
class AnimatedWidget
extends InteractiveWidget
```

#### Constructor Parameters :

```java
 AnimatedWidget(int x, 
 int y, 
 int amountOfPxToTravel, 
 int widgetWidth, 
 int widgetHeight, 
 String label, 
 color widgetColor, 
 int curve, 
 float speed, 
 boolean drawStroke)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the widget (top left corner)|
|**y**|`int`|y coordinate of the widget (top left corner)|
|**amountOfPxToTravel**|`int`|amout of pixels that the animation has to travel|
|**widgetHeight**|`int`|height of the widget|
|**widgetHeight**|`int`|height of the widget|
|**label**|`String`|label of the widget|
|**widgetColor**|`color`|color of the widget|
|**curve**|`int`|curve of the egdes of the widget|
|**speed**|`int`|speed of the widget|
|**drawStroke**|`boolean`|flags that determines if the widget draws a with stroke|

---

#### 1.d.4. ImageWidget Class

##### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

##### Brief Description :

#### Class Summary :

```java
class ImageWidget
extends InteractiveWidget
```

#### Constructor Parameters :

```java
 ImageWidget(int x, 
 int y, 
 int widgetWidth, 
 int widgetHeight, 
 PImage widgetImg, 
 boolean draw)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the widget (top left corner)|
|**y**|`int`|y coordinate of the widget (top left corner)|
|**widgetHeight**|`int`|height of the widget|
|**widgetHeight**|`int`|height of the widget|
|**widgetImg**|`PImage`|image of the widget (center)|
|**draw**|`boolean`|flag that determines if the widget is drawn|

---

#### 1.d.5. Slider Class

##### Contributors :

> Main : Manon Galian  
> Editor(s) : Nadana Arun

##### Brief Description :

#### Class Summary :

```java
class Slider
extends InteractiveWidget
```

#### Constructor Parameters :

```java
 Slider(int barX, 
 int barY, 
 int thumbWidth, 
 int thumbHeight, 
 int barWidth, 
 int barHeight, 
 String label, 
 int minValue, 
 int maxValue,
 color sliderColor, 
 PFont widgetFont, 
 int gap)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**barX**|`int`|x coordinate of the slider bar (top left corner)|
|**barY**|`int`|y coordinate of the slider bar (top left corner)|
|**thumbWidth**|`int`|width of the thumb of the slider|
|**thumbHeight**|`int`|height of the thumb of the slider|
|**barWidth**|`int`|width of the bar|
|**barHeight**|`int`|height of the bar|
|**label**|`String`|label of the slider|
|**minValue**|`int`|minimum value of the slider|
|**maxValue**|`int`|maximun value of the slider|
|**sliderColor**|`color`|color of the slider|
|**widgetFont**|`PFont`|font of the text of the slider|
|**gap**|`int`|alignment correction|

---

#### 1.d.6. Checkbox Class

##### Contributors :

> Main : Joel Jojan  
> Editor(s) : N/A

##### Brief Description :

#### Class Summary :

```java
class Checkbox
extends InteractiveWidget
```

#### Constructor Parameters :

```java
 Checkbox(int x, 
 int y, 
 int checkboxSize, 
 String label, 
 color widgetColor, 
 PFont widgetFont, 
 int gap, 
 boolean initialState)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the checkbox (top left corner)|
|**y**|`int`|y coordinate of the checkbox (top left corner)|
|**checkboxSize**|`int`|size of the checkbox|
|**label**|`String`|label of the checkbox|
|**widgetFont**|`PFont`|font of the labels of the checkbox|
|**gap**|`int`|...|
|**initialState**|`boolean`|flag that ...|

---

##### 1.d.6.i. CheckboxExtended Class

###### Contributors :

> Main : Joel Jojan   
> Editor(s) : N/A

###### Brief Description :

###### Class Summary :

```java
class CheckboxExtended
extends Checkbox
```

###### Constructor Parameters :

```java
 CheckboxExtended(int x, 
 int y, 
 int checkboxSize, 
 String label, 
 color widgetColor, 
 PFont widgetFont, 
 int gap, 
 boolean initialState, 
 FlightProvider provider)
```

###### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the checkbox (top left corner)|
|**y**|`int`|y coordinate of the checkbox (top left corner)|
|**checkboxSize**|`int`|size of the checkbox|
|**label**|`String`|label of the checkbox|
|**widgetFont**|`PFont`|font of the labels of the checkbox|
|**gap**|`int`|...|
|**initialState**|`boolean`|flag that ...|
|**provider**|`FlightProvider`|...|

---

#### 1.d.7. RadioButton Class

##### Contributors :

> Main : Maria Ceanuri     
> Editor(s) : Manon Galian

##### Brief Description :

#### Class Summary :

```java
class RadioButton
extends InteractiveWidget
```

#### Constructor Parameters :

```java
 RadioButton(int x, int y, int widgetWidth, String label, color widgetColor, PFont widgetFont, int gap, int curve, boolean draw)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the radioButton (top left corner)|
|**y**|`int`|y coordinate of the radioButton (top left corner)|
|**widgetWidth**|`int`|width of the radioButton|
|**label**|`String`|label of the radioButton|
|**widgetColor**|`color`|color of the radioButton|
|**widgetFont**|`PFont`|font of the labels of the radioButton|
|**gap**|`int`|...|
|**curve**|`int`|curve of the egdes of the radioButton|
|**draw**|`boolean`|flag that determines if the radioButton is drawn|

---

#### 1.d.8. InputBox Class

##### Contributors :

> Main : Maria Faro    
> Editor(s) : Manon Galian

##### Brief Description :

#### Class Summary :

```java
class InputBox
extends InteractiveWidget
```

#### Constructor Parameters :

```java
 InputBox(float x, 
 float y, 
 float w, 
 float h, 
 int curve, 
 String textFormat)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the inputBox (top left corner)|
|**y**|`int`|y coordinate of the inputBox (top left corner)|
|**w**|`int`|width of the inputBox|
|**h**|`int`|height of the inputBox|
|**curve**|`int`|curve of the egdes of the inputBox|
|**textFormat**|`String`|curve of the egdes of the inputBox|

---

#### 1.d.9. ScrollPage Class

##### Contributors :

> Main : Manon Galian   
> Editor(s) : N/A

##### Brief Description :

#### Class Summary :

```java
class ScrollPage
extends InteractiveWidget
```

#### Constructor Parameters :

```java
 InputBox(int x, 
 int y, 
 int widgetWidth, 
 int widgetHeight, 
 color widgetColor, 
 int gap, 
 MiniScreen miniScreen)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**x**|`int`|x coordinate of the scrollPage (top left corner)|
|**y**|`int`|y coordinate of the scrollPage (top left corner)|
|**widgetWidth**|`int`|width of the scrollPage|
|**widgetHeight**|`int`|height of the scrollPage|
|**gap**|`int`|gap between rows in pixels|
|**miniScreen**|`MiniScreen`|miniscreen of the scrollPage|

---

