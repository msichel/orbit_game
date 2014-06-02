class Body
{
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float d;
  float rv;

  Body(PVector pos_, PVector vel_, float mass_, float d_)
  {
    pos = new PVector(pos_.x, pos_.y);
    vel = new PVector(vel_.x, vel_.y);
    acc = new PVector(0, 0);
    mass = mass_;
    d = d_;
  }

  void grav(PVector g)
  {
    acc.add(g);
  }

  void move()
  {
    acc.mult(delta);
    vel.add(acc);
    vel.mult(delta);
    pos.add(vel);
    vel.div(delta);
    acc = new PVector(0, 0);
  }
  void show()
  {
    fill(255);
    ellipse(pos.x, pos.y, d, d);
  }
}

