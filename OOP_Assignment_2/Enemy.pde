class Enemy extends GameObject
{
  float speed;
  PVector playerPos;
  float theta = 0;
  
  Enemy(float x, float y, float speed, float size, float x1, float y1)
  {
    pos = new PVector(x, y);
    playerPos = new PVector(x1, y1);
    this.speed = speed;
    this.size = size;
    
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y, 3);
    rotate(theta);
    strokeWeight(3);
    stroke(255, 0, 0);
    fill(130);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
  
  void update()
  { 
    theta = atan2(playerPos.y - pos.y, playerPos.x - pos.x) + HALF_PI;
    forward = new PVector(sin(theta), -cos(theta));    
    forward.normalize();
    pos.add(PVector.mult(forward, speed));
  }
}