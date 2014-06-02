class Level
{
  Spacecraft ship;
  ArrayList<Body> bodies = new ArrayList<Body>();
  PVector dir;
  PVector pos;
  Zone start;
  Zone end;

  Level(ArrayList<Body> bodies_, Zone start_, Zone end_)
  {
    for (Body b:bodies_)
    {
      bodies.add(b);
    }
    start = start_;
    end = end_;
  }


  void update()
  {
    background(0);
    //apply body-body gravity
    for (int i = 0; i < bodies.size(); i++)
    {
      Body on = bodies.get(i);
      for (int j = 0; j < bodies.size(); j++)
      {
        Body by = bodies.get(j);
        if (j != i)
        {
          on.grav(addGrav(on, by));
        }
      }
    }
    //rocket propulsion
    if (mousePressed && ship != null)
    {
      ship.addThrust();
    }

    //show and move bodies and apply rocket-body gravity to rocket
    for (int i = 0; i < bodies.size(); i++)
    {
      Body b = bodies.get(i);
      b.move();
      b.show();
      if (ship != null)
      {
        ship.grav(addGrav(ship, b));
        //rocket-body crashes
        if (dist(ship.pos.x, ship.pos.y, b.pos.x, b.pos.y) <= b.d/2 + ship.d/2)
        {
          gameMode++;
        }
      }
    }
    if (ship != null)
    {
      if (abs(ship.pos.x - end.center.x) < end.zSize.x/2 && abs(ship.pos.y - end.center.y) < end.zSize.y/2)
      {
        gameMode = 2;
      }
    }
    start.render();
    end.render();
    if (ship != null)
    {
      ship.show();
      ship.move();
    }
    if (ship != null)
    {
      fill(255);
      textSize(30);
      text("Dashboard", 150, height - 125);
      textSize(20);
      textAlign(LEFT);
      text("Position:" + int(ship.pos.x) + ',' + int(height - ship.pos.y), 50, height - 75);
      text("Velocity:" + int(10*ship.vel.x) + ',' + int(-10*ship.vel.y), 50, height - 50);
      textAlign(CENTER,CENTER);
    }
  }
  void click()
  {
    if (pos == null)
    {
      if (abs(mouseX - start.center.x) < start.zSize.x/2 && abs(mouseY - start.center.y) < start.zSize.y/2)
      {
        pos = new PVector(mouseX, mouseY);
      }
    }

    else if (dir == null)
    {
      dir = new PVector(pos.x-mouseX, pos.y-mouseY);
      ship = new Spacecraft(pos, dir);
    }
  }
}

