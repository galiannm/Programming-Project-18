class InputBox {
  String allUserInputs = ""; // Variable to store all user inputs
  String userInput = ""; // Variable to store current user input
  float x, y, w, h; 
  
  InputBox(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void draw() {
    stroke(0);
    fill(255);
    rect(x, y, w, h);
    fill(0);
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
  
  void saveUserInput() {
    allUserInputs += userInput + "\n"; // Link the current input with the existing inputs, separated by a newline
    println(userInput);
    println("All user inputs so far:\n" + allUserInputs); // Print all user inputs for verification
  }
}
