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
