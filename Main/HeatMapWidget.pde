//HEATMAP - brought to you by Joel //<>// //<>//
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
    checkHover();
  }

  void colorStates() {
    for (String stateAbbrev : states) {
      int value = showArrivals ? stateDeparturesArrivals.get(stateAbbrev).get("arrived") : stateDeparturesArrivals.get(stateAbbrev).get("departed");
      int colorState;

      if (value < 0) {
        colorState = 0;
      } else if (value < 100) {
        colorState = 30 + (int) (value / 100.0 * 30);
      } else if (value < 500) {
        colorState = 60 + (int) ((value - 100) / 400.0 * 30);
      } else if (value < 2500) {
        colorState = 90 + (int) ((value - 500) / 2000.0 * 30);
      } else if (value < 10000) {
        colorState = 120 + (int) ((value - 2500) / 7500.0 * 30);
      } else if (value < 25000) {
        colorState = 150 + (int) ((value - 10000) / 15000.0 * 30);
      } else if (value < 35000) {
        colorState = 180 + (int) ((value - 25000) / 10000.0 * 30);
      } else if (value < 50000) {
        colorState = 210 + (int) ((value - 35000) / 15000.0 * 30);
      } else {
        colorState = 240;
      }

      PShape state = USA.getChild(stateAbbrev); // Get the shape for the state

      if (state != null) {
        state.disableStyle();
        if (showArrivals) {
          fill(0, 0, colorState);// Set the fill color for the state
        } else {
          fill(colorState, 0, 0);
        }

        shape(state, 0, 0, width, height); // Draw the state at position (0, 0) with size (width, height)
        strokeWeight(0);
      } else {
        continue;
      }
    }
  }

  void labelStates() {
    for (String stateAbbrev : states) {
      PShape state = USA.getChild(stateAbbrev);
      if (state != null) {
        try {
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
        catch(NullPointerException e) {
          //println("Error: Vertex count not available for state " + stateAbbrev);
          continue;
        }
      } else {
        //println("Error: Null shape for state " + stateAbbrev);
        continue;
      }
    }
  }

  void checkHover() {
    for (String stateAbbrev : states) {
      PShape state = USA.getChild(stateAbbrev);
      if (state != null && isInside(state, mouseX, mouseY)) {
        // Draw white border on hover
        stroke(255);
        strokeWeight(2);
        noFill();
        shape(state, 0, 0, width, height);

        // Display number of outbound/inbound flights
        int value = showArrivals ? stateDeparturesArrivals.get(stateAbbrev).get("arrived") : stateDeparturesArrivals.get(stateAbbrev).get("departed");
        String message = showArrivals ? "Arrivals: " : "Departures: ";
        message += value;
        fill(255);
        textAlign(LEFT);
        text(message, mouseX + 10, mouseY + 10);
      }
    }
  }

  boolean isInside(PShape shape, float x, float y) {
    if (shape != null) {
      int vertexCount = shape.getVertexCount();
      boolean inside = false;
      for (int i = 0, j = vertexCount - 1; i < vertexCount; j = i++) {
        float xi = shape.getVertex(i).x * width / USA.width; // Adjust for scale
        float yi = shape.getVertex(i).y * height / USA.height; // Adjust for scale
        float xj = shape.getVertex(j).x * width / USA.width; // Adjust for scale
        float yj = shape.getVertex(j).y * height / USA.height; // Adjust for scale
        boolean intersect = ((yi > y) != (yj > y)) &&
          (x < (xj - xi) * (y - yi) / (yj - yi) + xi);
        if (intersect) {
          inside = !inside;
        }
      }
      return inside;
    }
    return false;
  }

  void toggleShowArrivals() {
    showArrivals = !showArrivals;
    checkDrawLegendHeatMap();
  }
}

void checkDrawLegendHeatMap() {
  if (firstHeatMapWidget.showArrivals) {
    HeatmapLegendArrivals.draw = true;
    HeatmapLegendDepartures.draw = false;
  } else {
    HeatmapLegendArrivals.draw = false;
    HeatmapLegendDepartures.draw = true;
  }
}
