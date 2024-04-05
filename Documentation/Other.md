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
> Editor(s) : N/A

### Brief Description :

...

### Class Summary :

```java
class Gradient
extends none
```

#### Constructor Parameters :

```java
 Flight(String[] data)
```

#### Constructor Parameters Explanation:

|Name|Type|Quick Description|
|----|----|-----------|
|**data**|`String[]`|...|

---