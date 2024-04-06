# Documentation : `Wiget`, `Charts`, `Maps`, `Other` and its Descendants

Authors : 
* Manon Galian 

Editors :
* Joel Jojan
* Maria Faro
* Maria Ceanuri
* Nandana Arun
---

## Table of Contents:
1. [`Widget` Class](#1-widget-class)
    1. [`Chyron` Class](#1a-chyron-class)
    2. [`infoSheetInformation` Class](#1b-infosheetinformation-class)
    3. [`MiniScreen` Class](#1c-miniscreen-class)
    4. [`InteractiveWidget` Class](#1d-interactivewidget-class)
        1. [`MouseActionListener` Interface](#1d1-mouseactionlistener-interface)
        2. [`KeyActionListener` Interface](#1d2-keyactionlistener-interface)
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

The `Widget` class is the base class for all user interface classes. 

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
> Editor(s) : Joel Jojan  

#### Brief Description :

The `Chyron` class allows the user to automatically have information scroll up the screen.

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

The `infoSheetInformation` class allows the user to display the information of a certain flight. If the flight exists in the database, the departure/arrival location (state and airport), flight number, departure/arrival time, date and distance will be printed. 
The user is also notified in the case that the flight does not exist or is cancelled.

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

The `MiniScreen` class provides similar functionality to that of its parent, `Widget` but also provide the possibility of a hanging title at the top.

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

#### Brief Description :

The `InteractiveWidget` class allows the user to interact with the widget by providing hooks for listeners of mouse and keyboard events.

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

### Important Methods:

```java
  public void addListn(MouseActionListener listn)
```
 The function `addListn` add a listener to the [`MouseActionListener`](#1d1-mouseactionlistener-interface)

```java
  public void actions(MouseEvent e)
```
The function `actions` performs all the actions of every `MouseActionListener` of the InteractiveWidget that calls it.

```java
  public void addKeyListn(KeyActionListener listn)
```
 The function `addKeyListn` add a listener to the [`KeyActionListener`](#1d2-keyactionlistener-interface)

```java
  public void keyActions(KeyEvent e)
```
The function `keyActions` performs all the actions of every `KeyActionListener` of the InteractiveWidget that calls it.

---

#### 1.d.1. MouseActionListener Interface

##### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

##### Brief Description :

It is a **functional interface** [^1] which allows the user to create flexible callbacks to be performed on a **mouse event** [^2].

[^1]: [For more inforamtion on functional interface in java](https://www.baeldung.com/java-8-functional-interfaces)  
[^2]: [For more information on MouseEvents in processing](https://github.com/processing/processing/blob/master/core/src/processing/event/MouseEvent.java)

##### Interface Summary :

```java
interface MouseActionListener {
  void performAction(MouseEvent e, Object s);
} 
```

##### How to make listener :

A listener can be any **anonymous functions** [^3] adhering to the `MouseActionListener` interface. It takes in two parameter:
 * e (the mouse event) and 
 * w (the interactinve widget calling the event).  

 [^3]: [For more inforamtion on anonymous functions in java](https://www.javatpoint.com/anonymous-function-in-java#:~:text=In%20Java%2C%20anonymous%20functions%2C%20also,define%20a%20class%20or%20interface.)  

```java
  MouseActionListener myMouseListener = (e, w) ->
  {
    println("You can do anything from inside this function!");

    println("You can filter for certain types of MouseEvents:");
    println("Is it a PRESS?:", e.getAction() == MouseEvent.PRESS);

    println("Access information of this widget");
    println("This widget's color:", w.color);
  };
```

---

#### 1.d.2. KeyActionListener Interface

##### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

##### Brief Description :

It is a **functional interface** [^1] which allows the user to create flexible callbacks to be performed on a **key event** [^2].

[^1]: [For more inforamtion on functional interface in java](https://www.baeldung.com/java-8-functional-interfaces)  
[^2]: [For more information on KeyEvents in processing](https://github.com/processing/processing/blob/master/core/src/processing/event/KeyEvent.java)

##### Interface Summary :

```java
interface KeyActionListener {
  void performKeyAction(KeyEvent e, Object s);
}
```
##### How to make listener :

A listener can be any **anonymous functions** [^3] adhering to the `KeyActionListener` interface. It takes in two parameter:
 * e (the mouse event) and 
 * w (the interactinve widget calling the event).  

[^3]: [For more inforamtion on anonymous functions in java](https://www.javatpoint.com/anonymous-function-in-java#:~:text=In%20Java%2C%20anonymous%20functions%2C%20also,define%20a%20class%20or%20interface.)  

```java
  KeyActionListener myKeyListener = (e, w) ->
  {
    println("You can do anything from inside this function!");

    println("You can filter for certain types of MouseEvents:");
    println("Is it a PRESS?:", e.getAction() == KeyEvent.PRESS);

    println("Access information of this widget");
    println("This widget's color:", w.color);
  };
```

---

#### 1.d.3. AnimatedWidget Class

##### Contributors :

> Main : Manon Galian  
> Editor(s) : N/A

##### Brief Description :

The `AnimatedWidget` Class allows the user to perform an animation on a widget.

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

The `ImageWidget` class provides the same functionality to that of its parent `InteractiveWidget`, but allows the user to use an image (instead of the default rectangle shape).

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

The `Slider` class enables the addition of a slider control, allowing users to select a value within the specified range (defined by `minValue` and `maxValue`) by sliding an thumb.

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

TO DO

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
|**gap**|`int`|TO DO|
|**initialState**|`boolean`|flag that TO DO|

---

##### 1.d.6.i. CheckboxExtended Class

###### Contributors :

> Main : Joel Jojan   
> Editor(s) : N/A

###### Brief Description :

TO DO

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
|**gap**|`int`|TO DO|
|**initialState**|`boolean`|flag that TO DO|
|**provider**|`FlightProvider`|TO DO|

---

#### 1.d.7. RadioButton Class

##### Contributors :

> Main : Maria Ceanuri     
> Editor(s) : Manon Galian

##### Brief Description :

TO DO

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
|**gap**|`int`|TO DO|
|**curve**|`int`|curve of the egdes of the radioButton|
|**draw**|`boolean`|flag that determines if the radioButton is drawn|

---

#### 1.d.8. InputBox Class

##### Contributors :

> Main : Maria Faro    
> Editor(s) : Manon Galian

##### Brief Description :

TO DO

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

The `ScrollPage` class allows the user the creation of an inforamtion page, which has to added functionality of beeing able to sort through the information. Additionally, it enables scrolling, allowing users to navigate up and down the page as needed.

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

