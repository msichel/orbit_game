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

  Spacecraft(PVector pos_, PVector dir)
  {
    pos = new PVector(pos_.x, pos_.y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    spacecraft = loadImage("spacecraft.png");
    dir.normalize();
    direction = new PVector(dir.x,dir.y);
  }

  void grav(PVector g)
  {
    acc.add(g);
  }

  void show()
  {
    image(spacecraft, pos.x, pos.y, d, d);
  }

  void move()
  {
    vel.add(acc);
    pos.add(vel);
    acc = new PVector(0, 0);
  }

  void addThrust()
  {
    if(fuelMass >0)
    {
      stroke(255,127.5);
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

