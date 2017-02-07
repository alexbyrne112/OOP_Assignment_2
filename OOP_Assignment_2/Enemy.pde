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
    translate(pos.x, pos.y, 4);
    rotate(theta);
    strokeWeight(3);
    stroke(255, 0, 0);
    fill(130);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
  
  void update()
  { 
    forward = new PVector(sin(theta), -cos(theta));    
    forward.normalize();
    pos.add(PVector.mult(forward, speed));
    
    
    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Bullet)
      {
        Bullet b = (Bullet) go;
        if (dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < 50)
        {
          gameObjects.remove(this);
          gameObjects.remove(b);
        }
        
      }
      if(go instanceof Player)
      {

      }
    }
    
    
  }
}