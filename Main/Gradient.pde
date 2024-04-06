// gradient code - manon
// The `Gradient` class provides the funtionality of creating customisable esthetic 
// gradients. The user may enter as many or as litle colors as needed.

class Gradient
{
  int x, y;
  float gradientWidth, gradientHeight;
  color[] colors;
  Gradient(int x, int y, float gradientWidth, float gradientHeight, color[] colors)
  {
    this.x = x;
    this.y = y;
    this.gradientWidth = gradientWidth;
    this.gradientHeight = gradientHeight;
    this.colors = colors;
  }

  void setGradient()
  {
    if (colors != null)
    {
      if (colors.length == 1)
      {
        background(colors[0]);
      } 
      else
      {
        for (int i = y; i <= y+gradientHeight; i++)
        {
          float amt = map(i, y, y+gradientHeight, 0, 1); 
          float scaledAmt = amt * (colors.length - 1); 
          int index = int(scaledAmt);
          index = constrain(index, 0, colors.length - 2);
          float localAmt = scaledAmt - index; 
          color gradientColor = lerpColor(colors[index], colors[index + 1], localAmt);
          stroke(gradientColor);
          line(x, i, x+gradientWidth, i);
        }
      }
    }
  }
}
