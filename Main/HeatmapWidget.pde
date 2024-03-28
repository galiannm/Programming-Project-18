class HeatMapWidget extends InteractiveWidget {

  PImage mapImage;
  HashMap<String, HashMap<String, Integer>> stateDeparturesArrivals;
  ArrayList<String> stateAbbreviations;
  boolean showArrivals;

  HeatMapWidget(int x, int y, int widgetWidth, int widgetHeight,
    PImage mapImage, HashMap<String, HashMap<String, Integer>> stateDeparturesArrivals,
    ArrayList<String> stateAbbreviations, boolean showArrivals) {
    super(x, y, widgetWidth, widgetHeight, "", color(255), null, 0, 0, false);
    this.mapImage = mapImage;
    this.stateDeparturesArrivals = stateDeparturesArrivals;
    this.stateAbbreviations = stateAbbreviations;
    this.showArrivals = showArrivals;
  }

  void draw() {
    image(mapImage, x, y, widgetWidth, widgetHeight);
    colorStates();
  }

  void colorStates() {
    for (String stateAbbrev : states) {
      if (stateDeparturesArrivals.containsKey(stateAbbrev)) {
        int value = showArrivals ?
          stateDeparturesArrivals.get(stateAbbrev).get("Arrivals") :
          stateDeparturesArrivals.get(stateAbbrev).get("Departures");
        int colorState = 255; // Example coloring based on value (test val rn)
        PShape state = USA.getChild(stateAbbrev); // Get the shape for the state

        if (state != null) {
          state.disableStyle();
          fill(colorState);// Set the fill color for the state
          shape(state, 0, 0, width, height); // Draw the state at position (0, 0) with size (width, height)
        } else {
          println("State " + stateAbbrev + " not found!");
        }
      }
    }
  }

  void toggleShowArrivals() {
    showArrivals = !showArrivals;
  }
}
