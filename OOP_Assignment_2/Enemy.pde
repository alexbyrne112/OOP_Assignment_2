class Enemy extends GameObject
{
  float speed;
  float theta = 0;
  
  Enemy(float x, float y, float speed, float size)
  {
    pos = new PVector(x, y);
    this.speed = speed;
    this.size = size;
    
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y, 4);
    rotate(theta);
    strokeWeight(3);
    stroke(160, 0, 0);
    fill(100);
    rect(23, -50, 15,40,20, 20, 20, 20);
    rect(-35, -50, 15, 40, 20, 20, 20, 20);
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
        if (dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < 50)
        {
          gameObjects.remove(this);
          death.play();
          death.rewind();
          money += 100;
          score += 15;
        }
        
      }
      if(go instanceof Player)
      {
        Player p = (Player)go;
        theta = atan2(p.pos.y - pos.y, p.pos.x - pos.x) + HALF_PI;
        if(dist(p.pos.x,p.pos.y,pos.x,pos.y) < 50)
        {
          p.health--;
        }
      }
    } 
  }
}