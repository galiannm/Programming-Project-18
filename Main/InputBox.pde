// input box code - Maria Faro, later modified by Manon
class InputBox extends InteractiveWidget {
  String allUserInputs = ""; // Variable to store all user inputs
  String userInput = ""; // Variable to store current user input
  float x, y, w, h;
  int curve;
  ArrayList<KeyActionListener> keyEventListn;
  InputBox(float x, float y, float w, float h, int curve) {
    //(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int gap, int curve, boolean drawStroke)
    super((int)x, (int)y, (int)w, (int)h, "", silverBlue, textFont, 0, curve, true);
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.curve = curve;
    keyEventListn = new ArrayList<KeyActionListener>();
  }

  void draw() {
    super.draw();
    stroke(silverBlue);
    fill(silverBlue);
    rect(x, y, w, h, curve);
    fill(darkGray);
    textAlign(CENTER, CENTER);
    text(userInput, x + w/2, y + h/2); // Display user input within the box
  }

  void keyPressed() {
    // When key is pressed, save the current user input
    if (key == ENTER) {
      saveUserInput();
      userInput = ""; // Clear the user input after saving
    }
    // When Backspace key is pressed remove last character from the user input
    else if (key == BACKSPACE && userInput.length() > 0) {
      userInput = userInput.substring(0, userInput.length() - 1);
    }
    // If any other key is pressed, append it to the current user input
    else if (key != TAB && key != CODED) {
      userInput += key;
    }
  }

  public void addKeyListn(KeyActionListener listn)
  {
    keyEventListn.add(listn);
  }
  
  public void keyActions(KeyEvent e)
  {
    for (KeyActionListener listn : keyEventListn)
    {
      listn.performKeyAction(e, this);
    }
  }

  void saveUserInput() {
    allUserInputs += userInput; // Link the current input with the existing inputs, separated by a newline
    //println(userInput);
    //println("All user inputs so far:\n" + allUserInputs); // Print all user inputs for verification
  }
}
