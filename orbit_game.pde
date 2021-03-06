final float G = 60;
//Spacecraft ship;
//ArrayList<Body> bodies = new ArrayList<Body>();
int gameMode = -1;
int levelnum = 0;
//PVector dir;
//PVector pos;
ArrayList<Level> levels = new ArrayList<Level>();
Menu menu = new Menu();

void setup()
{
  size(1280, 720);
  imageMode(CENTER);
  textAlign(CENTER);
  rectMode(CENTER);
  setupLevels();
}

void draw()
{
  if (levelnum < levels.size())
  {
    if (gameMode == -1)
    {
      menu.display();
    }
    if (gameMode == -2)
    {
      background(0);
      textSize(30);
      fill(0, 255, 255);
      text("Click in the blue zone to choose the starting point of your spaceship.", width/2, 100);
      text("Click again anywhere to choose the direction of your thrusters.", width/2, 150);
      fill(255, 0, 255);
      text("Your spaceship will launch in the opposite direction.", width/2, 250);
      text("To move onto the next level, navigate to the red zone before your oxygen runs out!", width/2, 300);
      fill(255, 255, 0);
      text("Your fuel, the orange bar, and your oxygen, the light blue bar, are very limited.", width/2, 400);
      text("The longer you click, the more fuel you use.", width/2, 450);
      fill(255, 62, 62);
      text("Click anywhere on the screen if you have lost, or press 'R' at any time to restart.", width/2, 550);
      text("Press the spacebar at any time to return to the menu.", width/2, 600); 
      gameMode = -1;
    }
    Level level = levels.get(levelnum);
    if (gameMode == 0)
    {
      level.update();
    }
    else if (gameMode == 1)
    {
      textSize(50);
      fill(255, 0, 0);
      text("YOU LOSE!", width/2, 100);
    }
    else if (gameMode == 2)
    {
      textSize(50);
      fill(0, 255, 0);
      text("YOU WIN!", width/2, 100);
    }
  }
  else
  {
    background(0, 255, 0);
    textSize(50);
    fill(255);
    text("YOU WIN!", width/2, height/2);
  }
}

void setupLevels()
{
  levels.clear();

  ArrayList <Body> bodies = new ArrayList<Body>();
  ArrayList <Zone> zones = new ArrayList<Zone>();
  //level 0
  
  bodies.add(new Body(new PVector(width/2, height/2-100), new PVector(3.25, 0), 100, 100));
  bodies.add(new Body(new PVector(width/2, height/2+100), new PVector(-3.25, 0), 100, 100));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100, 100), 0));
  zones.add(new Zone(new PVector(width-50, height/2), new PVector(100, 100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),600));
  
  //level 1
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2), new PVector(0, 0), 1, 10));
  bodies.add(new Body(new PVector(width/2-250, height/2), new PVector(0, 0), 1, 10));
  bodies.add(new Body(new PVector(width/2+250, height/2), new PVector(0, 0), 1, 10));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),300));
  
  //level 2
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, -2300), new PVector(0, 0), 4500, 5000));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),1000));

  //level 3
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2-200), new PVector(3, 0), 100, 100));
  bodies.add(new Body(new PVector(width/2, height/2+200), new PVector(-3, 0), 100, 100));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width/2,height/2), new PVector(25, 25), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),600));


  //level 4
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2-300), new PVector(3, 0), 50, 50));
  bodies.add(new Body(new PVector(width/2, height/2+300), new PVector(-3, 0), 50, 50));
  bodies.add(new Body(new PVector(width/2-300, height/2), new PVector(0, -3), 50, 50));
  bodies.add(new Body(new PVector(width/2+300, height/2), new PVector(0, 3), 50, 50));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),600));
  
  float x = 250; 
  float y = x/2-x/12;
  float a = 4.2;
  float b = 1.4;
  //level 5
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2-x, height/2+y), new PVector(b, a), 50, 50));
  bodies.add(new Body(new PVector(width/2-x, height/2-y), new PVector(-b, a), 50, 50));
  bodies.add(new Body(new PVector(width/2+x, height/2+y), new PVector(b, -a), 50, 50));
  bodies.add(new Body(new PVector(width/2+x, height/2-y), new PVector(-b, -a), 50, 50));
  bodies.add(new Body(new PVector(width/2-y, height/2+x), new PVector(a, b), 50, 50));
  bodies.add(new Body(new PVector(width/2-y, height/2-x), new PVector(-a, b), 50, 50));
  bodies.add(new Body(new PVector(width/2+y, height/2+x), new PVector(a, -b), 50, 50));
  bodies.add(new Body(new PVector(width/2+y, height/2-x), new PVector(-a, -b), 50, 50));
  zones.add(new Zone(new PVector(width/2, 50), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width/2,height-50), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),200));
  
  //level 6
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2), new PVector(0, 0), 100, 50));
  bodies.add(new Body(new PVector(width/2-100,height/2),new PVector(0,sqrt(60)),10,5));
  bodies.add(new Body(new PVector(width/2+200,height/2),new PVector(0,-sqrt(30)),10*sqrt(2),10*sqrt(2)));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),900));
    
  //level 7
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(150, height/2), new PVector(0, 0), 25, 100));
  zones.add(new Zone(new PVector(50, height/2), new PVector(100,100), 0));
  zones.add(new Zone(new PVector(width-50,height/2), new PVector(100,100), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),1000));
  
  //level 8
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2), new PVector(0, 0), 25, 100));
  zones.add(new Zone(new PVector(width/2, height/2-100), new PVector(10,10), 0));  
  zones.add(new Zone(new PVector(width/2,height/2+100), new PVector(10,10), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),1000));  
  
  //level 9
  bodies.clear();
  zones.clear();
  bodies.add(new Body(new PVector(width/2, height/2), new PVector(0, 0), 300, 300));
  zones.add(new Zone(new PVector(100, height/2), new PVector(100,500), 0));  
  zones.add(new Zone(new PVector(width/2+150,height/2), new PVector(40,50), 1));
  levels.add(new Level(bodies,zones.get(0),zones.get(1),1000)); 
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
    }
    else if (gameMode == 1)
    {
      setupLevels();
      gameMode = 0;
    }
    else if (gameMode == 2)
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
  if (key == ' ')
  {
    gameMode = -1;
  }
}

