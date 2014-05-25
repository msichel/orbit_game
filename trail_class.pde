class Trail
{
  ArrayList<PVector> trail = new ArrayList<PVector>();
  
  Trail(PVector pos)
  {
    addPos(pos);
  }
  void addPos(PVector pos)
  {
    PVector pos_ = new PVector(pos.x,pos.y);
    trail.add(pos_);
  }
  void render()
  {
    stroke(255);
    strokeWeight(2);
    for(int i = trail.size()-1; i>0;i--)
    {
      PVector end = trail.get(i);
      PVector start = trail.get(i-1);
      line(start.x,start.y,end.x,end.y);
    }
    noStroke();
  }
}


