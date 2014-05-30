final float G = 60;
//Spacecraft ship;
//ArrayList<Body> bodies = new ArrayList<Body>();
int gameMode;
int levelnum = 7;
//PVector dir;
//PVector pos;
ArrayList<Level> levels = new ArrayList<Level>();

void setup()
{
  size(1280, 720);
  imageMode(CENTER);
  textAlign(CENTER);
  rectMode(CENTER);
  setupLevels();
  gameMode = 0;
}

void draw()
{
  if (levelnum <levels.size())
  {
    Level level = levels.get(levelnum); 
    if (gameMode == 0)
    {
      level.update();
    } else if (gameMode == 1)
    {
      textSize(50);
      fill(255, 0, 0);
      text("BOOM! YOU LOSE!", width/2, 100);
    } else if (gameMode == 2)
    {
      textSize(50);
      fill(0, 255, 0);
      text("YOU WIN!", width/2, 100);
    }
  }
  else
  {
    background(0,255,0);
    textSize(50);
    fill(255);
    text("YOU WIN!", width/2,height/2);
  }
}
void setupLevels()
{
  levels.clear();

  ArrayList <Body> bodies = new ArrayList<Body>();
  ArrayList <Zone> zones = new ArrayList<Zone>();
  
  bodies.add(new Body(new PVector(width/2, height/2-100), new PVector(2, 0), 100, 100));
  bodies.add(new Body(new PVector(width/2, height/2+100), new PVector(-2, 0), 100, 100));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1)));
  
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2), new PVector(0, 0), 1, 10));
  bodies.add(new Body(new PVector(width/2-250, height/2), new PVector(0, 0), 1, 10));
  bodies.add(new Body(new PVector(width/2+250, height/2), new PVector(0, 0), 1, 10));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1)));
  
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, -2300), new PVector(0, 0), 4500, 5000));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1)));

  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2-200), new PVector(3, 0), 100, 100));
  bodies.add(new Body(new PVector(width/2, height/2+200), new PVector(-3, 0), 100, 100));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width/2,height/2), new PVector(25, 25), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1)));

  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2-300), new PVector(3, 0), 50, 50));
  bodies.add(new Body(new PVector(width/2, height/2+300), new PVector(-3, 0), 50, 50));
  bodies.add(new Body(new PVector(width/2-300, height/2), new PVector(0, -3), 50, 50));
  bodies.add(new Body(new PVector(width/2+300, height/2), new PVector(0, 3), 50, 50));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1)));
  
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2), new PVector(0, 0 ), 1000, 100));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1)));
  
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2), new PVector(0, 0), 100, 50));
  bodies.add(new Body(new PVector(width/2-100,height/2),new PVector(0,sqrt(60)),10,5));
  bodies.add(new Body(new PVector(width/2+200,height/2),new PVector(0,-sqrt(30)),10*sqrt(2),10*sqrt(2)));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1)));
  
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(150, height/2), new PVector(0, 0), 25, 100));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1)));

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


void mousePressed()
{
  if (levelnum<levels.size())
  {
    Level level = levels.get(levelnum);
    if (gameMode == 0)
    {
      level.click();
    } else if (gameMode == 1)
    {
      setupLevels();
      gameMode = 0;
    } else if (gameMode == 2)
    {
      levelnum++;
      setupLevels();
      gameMode = 0;
    }
  }
}
void keyPressed()
{
  if (key == 'r' || key == 'R')
  {
    setupLevels();
    gameMode = 0;
  }
}

