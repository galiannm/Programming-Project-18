// gradient code - manon
class Gradient
{
  int x, y;
  float w, h;
  color[] colors;
  Gradient(int x, int y, float w, float h, color[] colors)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = colors;
  }

  void setGradient()
  {
    if (colors != null)
    {
      if (colors.length == 1)
      {
        background(colors[0]);
      } else
      {
        for (int i = y; i <= y+h; i++)
        {
          float inter = map(i, y, y+h, 0, 1);
          // Calculate the position of `inter` within the gradient segments
          float scaledInter = inter * (colors.length - 1); // Scale interpolation to span all color segments
          int index = int(scaledInter); // Determine the starting color index
          // Ensure that the index does not exceed the bounds of the colors array
          index = constrain(index, 0, colors.length - 2);
          float localInter = scaledInter - index; // Calculate local interpolation value
          color gradientColor = lerpColor(colors[index], colors[index + 1], localInter);
          stroke(gradientColor);
          line(x, i, x+w, i);
        }
      }
    }
  }
}
