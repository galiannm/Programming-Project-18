// code - Manon
// The `Screen` class allows user to create various screen in a program, with each screen 
// being responsible for rendering the widgets present whithin the screen. To manage these 
// widgets efficiently, every widget that is created is added to the ArrayList of widgets 
// of that screen.  
// The `Screen` class only has a single contructor parameter; `backgroundColors` which is 
// an array of `color` type. This parameter is used to set the background color gradient 
// of the screen.

class Screen {
  ArrayList<Widget> widgets;
  Gradient backgroundGradient;
  color[] backgroundColors;
  Screen(color[] backgroundColors)
  {
    this.widgets = new ArrayList<Widget>();
    this.backgroundColors = backgroundColors;
    backgroundGradient = new Gradient(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, backgroundColors);
  }

  void addWidget(Widget widget)
  {
    widgets.add(widget);
  }

  void draw()
  {
    backgroundGradient.setGradient();
    for (Widget widget : widgets)
    {
      widget.draw();
    }

  }

}
