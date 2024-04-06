import processing.event.MouseEvent;
import processing.event.KeyEvent;

// code - Manon 
// The function `actions` performs all the actions of every `MouseActionListener` of the 
// InteractiveWidget that calls it.

interface MouseActionListener {
  void performAction(MouseEvent e, Object s);
} 

// The function `keyActions` performs all the actions of every `KeyActionListener` of 
// the InteractiveWidget that calls it.
interface KeyActionListener {
  void performKeyAction(KeyEvent e, Object s);
}
