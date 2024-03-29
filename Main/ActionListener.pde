import processing.event.MouseEvent;
interface MouseActionListener {
  void performAction(MouseEvent e, Object s);
} 

import processing.event.KeyEvent;

interface KeyActionListener {
  void performKeyAction(KeyEvent e, Object s);
}
