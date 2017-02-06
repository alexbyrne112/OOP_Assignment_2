class Enemy extends GameObject
{
  float speed;
  
  Enemy(float x, float y, float speed, float size)
  {
    pos = new PVector(x, y);
    this.speed = speed;
    this.size = size;
    
  }
  void render()
  {
    pushMatrix();
    
    popMatrix();
  }
  
  void update()
  {
    
  }  
}