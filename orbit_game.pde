final float G = 60;
//Spacecraft ship;
//ArrayList<Body> bodies = new ArrayList<Body>();
int gameMode;
//PVector dir;
//PVector pos;
Level level;

void setup()
{
  size(displayWidth, displayHeight);
  imageMode(CENTER);
  textAlign(CENTER);
  ArrayList <Body> bodies = new ArrayList<Body>();
  bodies.add(new Body(new PVector(width/2, height/2-100), new PVector(3, 0), 50, 50));
  bodies.add(new Body(new PVector(width/2, height/2+100), new PVector(-3, 0), 50, 50));
  level = new Level(bodies);
  gameMode = 0;
}

void draw()
{
  if (gameMode == 0)
  {
    level.update();
//    background(0);
//    if (ship != null)
//    {
//      ship.show();
//      ship.move();
//    }
//    //apply body-body gravity
//    for (int i = 0; i < bodies.size(); i++)
//    {
//      Body on = bodies.get(i);
//      for (int j = 0; j < bodies.size(); j++)
//      {
//        Body by = bodies.get(j);
//        if (j != i)
//        {
//          on.grav(addGrav(on, by));
//        }
//      }
//    }
//    //rocket propulsion
//    if (mousePressed&& ship != null)
//    {
//      ship.addThrust();
//    }
//    
//    //show and move bodies and apply rocket-body gravity to rocket
//    for (int i = 0; i < bodies.size(); i++)
//    {
//      Body b = bodies.get(i);
//      b.move();
//      b.show();
//      if (ship != null)
//      {
//        ship.grav(addGrav(ship, b));
//        //rocket-body crashes
//        if (dist(ship.pos.x, ship.pos.y, b.pos.x, b.pos.y) <= b.d/2 + ship.d/2)
//        {
//          gameMode++;
//        }
//      }
//    }
  }
  else if (gameMode == 1)
  {
    background(255, 0, 0);
    textSize(50);
    text("BOOM!", width/2, height/2);
  }
}

PVector addGrav(Body on, Body by)
{
  PVector gravity = new PVector(by.pos.x-on.pos.x, by.pos.y-on.pos.y);
  float mag = G * by.mass/pow(gravity.mag(), 2);
  gravity.normalize();
  gravity.mult(mag);
  return gravity;
}

PVector addGrav(Spacecraft on, Body by)
{
  PVector gravity = new PVector(by.pos.x-on.pos.x, by.pos.y-on.pos.y);
  float mag = G * by.mass/pow(gravity.mag(), 2);
  gravity.normalize();
  gravity.mult(mag);
  return gravity;
}

boolean sketchFullScreen()
{
  return true;
}

void mousePressed()
{
  if(gameMode == 0)
  {
    level.click();
  }
  else if (gameMode == 1)
  {
    setup();
  }
//  if (pos == null)
//  {
//    pos = new PVector(mouseX, mouseY);
//  }
//
//  else
//    if (dir == null)
//    {
//      dir = new PVector(pos.x-mouseX, pos.y-mouseY);
//      ship = new Spacecraft(pos, dir);
//    }
}
void keyPressed()
{
  if(key == 'r' || key == 'R')
  {
    setup();
  }
}

