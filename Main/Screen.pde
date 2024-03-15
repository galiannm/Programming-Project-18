class Screen {
  ArrayList<Widget> widgets;
  color backgroundColor;
  Screen(color backgroundColor)
  {
    this.widgets = new ArrayList<Widget>();
    this.backgroundColor = backgroundColor;
  }

  void addWidget(Widget widget)
  {
    widgets.add(widget);
  }

  void draw()
  {
    background(backgroundColor);
    for (Widget widget : widgets)
    {
      widget.draw();
    }

  }

}
