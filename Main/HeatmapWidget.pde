//HEATMAP - class brought to you by Joel

class HeatMapWidget extends InteractiveWidget {

  PShape mapImage;
  HashMap<String, HashMap<String, Integer>> stateDeparturesArrivals;
  ArrayList<String> states;
  boolean showArrivals;

  HeatMapWidget(int x, int y, int widgetWidth, int widgetHeight,
    PShape mapImage, HashMap<String, HashMap<String, Integer>> stateDeparturesArrivals,
    ArrayList<String> states, boolean showArrivals) {
    super(x, y, widgetWidth, widgetHeight, "", color(255), null, 0, 0, false);
    this.mapImage = mapImage;
    this.stateDeparturesArrivals = stateDeparturesArrivals;
    this.states = states;
    this.showArrivals = showArrivals;
  }

  void draw() {
    colorStates();
    labelStates();
  }
 //<>//
  void colorStates() {
    for (String stateAbbrev : states) {
      int value = showArrivals ? stateDeparturesArrivals.get(stateAbbrev).get("arrived") : stateDeparturesArrivals.get(stateAbbrev).get("departed"); //<>//

      int boundary1 = 100, boundary2 = 500, boundary3 = 2500, boundary4 = 10000, boundary5 = 25000, boundary6 = 35000, boundary7 = 50000;
      int colorState;
      if (value >= 0 && value < boundary1) {
        colorState = 30;
      } else if ( value >= boundary1 && value < boundary2) {
        colorState = 60;
      } else if ( value >= boundary2 && value < boundary3) {
        colorState = 90; //<>//
      } else if ( value >= boundary3 && value < boundary4) {
        colorState = 120;
      } else if ( value >= boundary4 && value < boundary5) {
        colorState = 150;
      } else if ( value >= boundary5 && value < boundary6) {
        colorState = 180;
      } else if ( value >= boundary6 && value < boundary7) {
        colorState = 210;
      } else if ( value >= boundary7) {
        colorState = 240;
      } else {
        colorState = 0;
      } //<>//

      PShape state = USA.getChild(stateAbbrev); // Get the shape for the state
      if (state != null) {
        state.disableStyle();
        if (showArrivals) {
          fill(0, 0, colorState);// Set the fill color for the state
        } else {
          fill(colorState, 0, 0);
        }


        shape(state, 0, 0, width, height); // Draw the state at position (0, 0) with size (width, height)
      } else {
        continue;
      }
    }
  }

  void labelStates() {
    for (String stateAbbrev : states) {
      PShape state = USA.getChild(stateAbbrev);
      if (state != null) {
        float minX = Float.MAX_VALUE;
        float maxX = Float.MIN_VALUE;
        float minY = Float.MAX_VALUE;
        float maxY = Float.MIN_VALUE;

        for (int i = 0; i < state.getVertexCount(); i++) {
          float x = state.getVertex(i).x;
          float y = state.getVertex(i).y;
          minX = min(minX, x);
          maxX = max(maxX, x);
          minY = min(minY, y);
          maxY = max(maxY, y);
        }
        // Calculate the scale factors for x and y axes
        float scaleX = width / USA.width;
        float scaleY = height / USA.height;

        // Calculate the center coordinates of the bounding box
        float stateX = (minX + maxX) / 2 * scaleX; // Adjusted for scale
        float stateY = (minY + maxY) / 2 * scaleY; // Adjusted for scale

        String stateLabel = stateAbbrev; // Use the state abbreviation as the label
        fill(255); // Set the fill color for the label
        textAlign(CENTER);
        text(stateLabel, stateX, stateY); // Draw the state label at the calculated position
      }
    }
  }

  void toggleShowArrivals() {
    showArrivals = !showArrivals;
  }
}
