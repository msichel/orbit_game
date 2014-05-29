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
  rectMode(CENTER);
  ArrayList <Body> bodies = new ArrayList<Body>();
  bodies.add(new Body(new PVector(width/2, height/2-100), new PVector(3, 0), 50, 50));
  bodies.add(new Body(new PVector(width/2, height/2+100), new PVector(-3, 0), 50, 50));
  Zone start = new Zone(new PVector(50, height/2), new PVector(100,100), 0);
  Zone end = new Zone(new PVector(width-50,height/2), new PVector(100,100), 1);
  level = new Level(bodies,start,end);
  gameMode = 0;
}

void draw()
{
  if (gameMode == 0)
  {
    level.update();
  }
  else if (gameMode == 1)
  {
    background(255, 0, 0);
    textSize(50);
    fill(255);
    text("BOOM!", width/2, height/2);
  }
  else if (gameMode == 2)
  {
    background(0,255,0);
    textSize(50);
    fill(255);
    text("YOU WIN!", width/2, height/2);
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

