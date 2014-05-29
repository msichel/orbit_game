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
  Trail trail;

  Spacecraft(PVector pos_, PVector dir)
  {
    pos = new PVector(pos_.x, pos_.y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    spacecraft = loadImage("spacecraft.png");
    dir.normalize();
    direction = new PVector(dir.x,dir.y);
    trail = new Trail(pos);
  }

  void grav(PVector g)
  {
    acc.add(g);
  }

  void show()
  {
    trail.render();
    image(spacecraft, pos.x, pos.y, d, d);
  }

  void move()
  {
    vel.add(acc);
    pos.add(vel);
    trail.addPos(pos);
    acc = new PVector(0, 0);
    direction = new PVector(pos.x-mouseX,pos.y-mouseY);
    direction.normalize();
    
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

