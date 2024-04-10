// input box code - Maria Faro, later modified by Manon
class InputBox extends InteractiveWidget {
  String allUserInputs, userInput, textFormat; // Variable to store all / current user inputs
  float x, y, w, h;
  int curve;
  boolean typing;
  InputBox(float x, float y, float w, float h, int curve, String textFormat) {
    super((int)x, (int)y, (int)w, (int)h, "", silverBlue, textFont, 0, curve, true);
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.curve = curve;
    this.textFormat = textFormat;
    allUserInputs = "";
    userInput = "";
    typing = false;
  }

  void draw() {
    super.draw();
    stroke(silverBlue);
    fill(silverBlue);
    rect(x, y, w, h, curve);
    fill(darkGray);
    textAlign(CENTER, CENTER);
    text(userInput, x + w/2, y + h/2); // Display user input within the box
    if (!typing)
    {
      textSize(11);
      fill(150, 150, 150);
      text(textFormat, x + w/2, y + h/2);
    }
    if (userInput == "")
    {
      typing = false;
    }
  }
  void keyPressed() {
    // When key is pressed, save the current user input
    if (key == ENTER) {
      enterKey.rewind();
      enterKey.play();
      saveUserInput();
      userInput = ""; // Clear the user input after saving
    }
    // When Backspace key is pressed remove last character from the user input
    else if (key == BACKSPACE && userInput.length() > 0) {
      backSpaceKey.rewind();
      backSpaceKey.play();
      userInput = userInput.substring(0, userInput.length() - 1);
    }
    // If any other key is pressed, append it to the current user input
    else if (key != TAB && key != CODED) {
      float randomKey = random(0, 6);
      switch(int(randomKey)) {
      case 0:
        key1.rewind();
        key1.play();
        break;
      case 1:
        key2.rewind();
        key2.play();
        break;
      case 2:
        key3.rewind();
        key3.play();
        break;
      case 3:
        key4.rewind();
        key4.play();
        break;
      case 4:
        key5.rewind();
        key5.play();
        break;
      case 5:
        key6.rewind();
        key6.play();
      default:
        break;
      }
      userInput += key;
      typing = true;
    }
  }

  void saveUserInput() {
    allUserInputs += userInput; // Link the current input with the existing inputs, separated by a newline
  }
}
