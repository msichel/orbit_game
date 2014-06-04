class Spacecraft
{
  PImage spacecraft;
  PVector pos;
  PVector vel;
  PVector acc;
  PVector direction;
  float mass = 1;
  float fuelMass = 4;
  float thrust = 2;
  int d = 20;
  float o2;
  float o2M;
  Trail trail;

  Spacecraft(PVector pos_, PVector dir,float o2_)
  {
    pos = new PVector(pos_.x, pos_.y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    spacecraft = loadImage("spacecraft.png");
    dir.normalize();
    direction = new PVector(dir.x,dir.y);
    trail = new Trail(pos);
    o2 = o2_;
    o2M = o2;
  }

  void grav(PVector g)
  {
    acc.add(g);
  }

  void show()
  {
    trail.render();
    image(spacecraft, pos.x, pos.y, d, d);
    fill(188,253,255);
    rectMode(CORNER);
    rect(50,height-25,50*o2/o2M,10);
    rectMode(CENTER);
  }

  void move()
  {
    vel.add(acc);
    pos.add(vel);
    trail.addPos(pos);
    acc = new PVector(0, 0);
    direction = new PVector(pos.x-mouseX,pos.y-mouseY);
    direction.normalize();
    o2--;
    
  }

  void addThrust()
  {
    if(fuelMass > 0)
    {
      stroke(255,127.5,0);
      strokeWeight(5);
      direction.mult(20);
      line(pos.x-direction.x,pos.y-direction.y,pos.x,pos.y);
      direction.div(20);
      noStroke();
      direction.mult(thrust/(mass+fuelMass));
      vel.add(direction);
      direction.normalize();
      fuelMass -= 0.5;
    }
  }
}

