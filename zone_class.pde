class Zone
{
  PVector center;
  PVector zSize;
  int type;
  Zone(PVector center_, PVector zSize_, int type_)
  {
    center = new PVector(center_.x,center_.y);
    zSize = new PVector(zSize_.x,zSize_.y);
    type = type_;
  }
  void render()
  {
    if(type == 0)
    {
      fill(0,0,255,50);
    }
    else if(type == 1)
    {
      fill(255,0,0,50);
    }
    rect(center.x,center.y,size,x,size,y);
  }
}
