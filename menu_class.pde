class Menu
{
  Menu()
  {
  }

  void display()
  {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(75);
    fill(80, 247, 145);
    text("ORBIT GAME", width/2, 125);
    rectMode(CENTER);
    for (int i = 0; i < 5; i++)
    {
      fill(255, 40, 40);
      rect(width/2 - 300, 275+125*i, 200, 75);
      rect(width/2 + 300, 275+125*i, 200, 75);
      textSize(40);
      fill(255);
      text("Level " + (i+1), width/2 - 300, 275+125*i);
      text("Level " + (i+6), width/2 + 300, 275+125*i);
      if (mousePressed)
      {
        if (checkButton(width/2 - 300, 275+125*i, 200, 75))
        {
          levelnum = i;
          gameMode = 0;
        }
      }
    }
  }
  boolean checkButton(float x, float y,float w, float h)
  {
    return mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2;
  }
}

