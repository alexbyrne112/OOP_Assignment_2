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
    create();
    speed = 2;
  }
  
  void create()
  {
   shape = createShape();
   shape.beginShape();
   shape.stroke(255);
   shape.fill(240, 200, 250);
   shape.strokeWeight(3);
   shape.vertex(-radius, radius);
   shape.vertex(0, - radius);
   shape.vertex(radius, radius);
   shape.vertex(0, 0);
   shape.endShape(CLOSE);
  }
  
  void render()
  {
   pushMatrix();
   translate(pos.x, pos.y);
   rotate(theta);
   shape(shape, 0, 0);
   //ellipse(0,0,50,50);
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
      
      Bullet b = new Bullet(pos.x, pos.y - 100, theta, 5);
      gameObjects.add(b);
      elapsed = 0;
      ammo --;
    }
    
    elapsed += timeDelta;
    
    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Bullet)
      {
        Bullet b = (Bullet) go;
        if (dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < radius)
        {
          health --;
           gameObjects.remove(b);
        }
      }
    }
  }
}