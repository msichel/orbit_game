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
}
