class Bullet extends GameObject // Gets everything from GameObject
{
  float theta;
  float size;
  float speed = 200;
  float timeToLive;
  float alive;
  
  Bullet(float x, float y, float theta, float size, float timeToLive)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.theta = theta;
    this.size = size;
    this.timeToLive = timeToLive;    
    this.alive = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y,+5);
    rotate(theta);
    stroke(255);
    fill(0);
    ellipse(0,0,20, 20);
    popMatrix();
  }
  
  void update() // Overrides the method in the base class
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    //PVector bp = PVector.add(pos, PVector.mult(forward, 40));
      //text(theta, width/2, height/2);
      text(pos.x + "  "+pos.y,width/2, height/2);
    pos.add(PVector.mult(PVector.mult(forward, speed), timeDelta));
    if (pos.x > width)
    {
      pos.x = 0;
    }
    if (pos.x < 0)
    {
      pos.x = width;
    }
    if (pos.y > height)
    {
      pos.y = 0;
    }
    if (pos.y < 0)
    {
      pos.y = height;
    }
    
    alive += timeDelta;
    if (alive > timeToLive)
    {
      gameObjects.remove(this);
    }    
  }  
}