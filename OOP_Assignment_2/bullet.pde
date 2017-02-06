class Bullet extends GameObject // Gets everything from GameObject
{
  float theta;
  float speed = 750;
  float timeToLive;
  float alive;
  
  Bullet(float x, float y, float theta, float timeToLive)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.theta = theta;
    this.timeToLive = timeToLive;    
    this.alive = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y,1);
    rotate(theta);
    stroke(0);
    strokeWeight(1);
    fill(255,255,0);
    rect(0, 0, 3, 8);
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    
    pos.add(PVector.mult(PVector.mult(forward, speed), timeDelta));

    alive += timeDelta;
    if (alive > timeToLive)
    {
      gameObjects.remove(this);
    }    
  }  
}