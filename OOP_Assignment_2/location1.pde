class Location
{
  float x = random(1000);
  float xwind = x; 
  float y ;
  float ywind = random(1000);
  float xStartWind = random(1000);
  float yStartWind = random(20);
  
  void display()
  {
    background(150,100,50);
  }
  
  
 void Grass(float x, float y, float wind)
  {
    pushMatrix();
    translate(x, y);
    rotate(wind*radians(360));
    stroke(0,255,0);
    line(0, 0, 20, 20);
    popMatrix();
  }
    
}