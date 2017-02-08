 class Bullet extends GameObject
{
  float theta;
  float speed = 2500;
  float timeToLive;
  float alive;
  //bullet constructor
  Bullet(float x, float y, float theta, float timeToLive)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.theta = theta;
    this.timeToLive = timeToLive;    
    this.alive = 0;
  }
   // bullet design
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y,1);
    rotate(theta);
    stroke(0);
    strokeWeight(1);
    fill(255,140,0);
    rect(-5, -50, 10, 20);
    popMatrix();
  }
  
  void update()
  {
    //bullet movement
    forward.x = sin(theta);
    forward.y = - cos(theta);
    
    pos.add(PVector.mult(PVector.mult(forward, speed), timeDelta));

    alive += timeDelta;
    if (alive > timeToLive)
    {
      //killing enemies
      gameObjects.remove(this);
    }    
  }  
}