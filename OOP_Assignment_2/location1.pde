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
    //background(255);
    background(50, 50, 0);
    xStartWind += 0.01;
    yStartWind += 0.01;
    x +=(noise(xStartWind)*0.5)-0.25; 
    y +=(noise(yStartWind)*0.5)-0.25; 
    xwind = x;
    ywind = y;
    for (int y=0; y<=height; y+=7) 
    {
    ywind +=.2;
    xwind= x;
    for (int x=0; x<=width; x+=6) 
      {
        xwind+=0.1;
        Grass(x, y, noise(xwind, ywind));
      }
    }
    
  }
  
  
 void Grass(float x, float y, float wind)
  {
    pushMatrix();
    translate(x, y);
    rotate(wind*radians(360));
    strokeWeight(1.5);
    stroke(15,100,5);
    line(0, 0, 20, 20);
    popMatrix();
  }
    
}