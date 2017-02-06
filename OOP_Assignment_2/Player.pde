class Player extends GameObject
{
  
  float theta;
  PShape shape;
  char up, down, left, right, shoot;
  int health;
  int ammo;
  float radius = 20;
  float fireRate = 2;
  float toPass =1.0 / fireRate;
  float elapsed = toPass;
  float speed;
  
  Player(float x, float y, float theta, float size, char up, char down, char left ,char right, char shoot)
  {
    this.theta = theta;
    this.size = size;
    pos = new PVector(x,y);
    this.left = left;
    this.right = right;
    this.up = up;
    this.down = down;
    this.shoot = shoot;
    this.health = 10;
    this.ammo = 10;
    speed = 8;
  }
  
  void render()
  {
   pushMatrix();
   translate(pos.x, pos.y,2);
   rotate(theta);
   stroke(0);
   strokeWeight(1);
   fill(255,170,0);
   ellipse(0,0,50,50);
   fill(150);
   rect(-5,-35,10,10);
   popMatrix();
  }
  
  void update()
  {
    
    if(checkKey(up))
    {
      pos.y-=speed;
      theta = radians(0);
    }
    if (checkKey(down))
    {
      pos.y+=speed;
      theta = radians(180);
    }
    if (checkKey(left))  
    {
      pos.x-=speed;
      theta = radians(270);
    }
    if (checkKey(right))
    {
      pos.x+=speed;
      theta = radians(90);
    }
    
    if (checkKey(shoot) && elapsed > toPass && ammo > 0)
    {
      
      Bullet b = new Bullet(pos.x, pos.y, theta, 5);
      gameObjects.add(b);
      elapsed = 0;
      ammo --;
    }
    
   if (frameCount % 120 == 0)
    {
      Enemy enemy1 = new Enemy(random(0, width), random(0, height), random(4,10), (float)50, pos.x, pos.y);
      gameObjects.add(enemy1);
    }
    elapsed += timeDelta;
    
    if(pos.x > height - 200 && pos.y < 200)
    {
      if(keyPressed)
      {
        if(key == 'e')
        {
          ammo += 10;
        }
      }
    }
    text(ammo, 300,300,4);
  }
}