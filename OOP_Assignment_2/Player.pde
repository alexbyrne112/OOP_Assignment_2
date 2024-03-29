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
  
  //player constructor
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
    this.health = 100;
    this.ammo = 100;
    speed = 15;
  }
  
  //player design
  void render()
  {
   pushMatrix();
   translate(pos.x, pos.y,3);
   rotate(theta);
   stroke(0);
   strokeWeight(1);
   fill(150,100,10);
   ellipse(0,0,50,50);
   fill(150);
   rect(-5,-35,10,10);
   popMatrix();
  }
  
  //key press checks
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
    //shooting
    if (checkKey(shoot) && elapsed > toPass && ammo > 0)
    {
      
      Bullet b = new Bullet(pos.x, pos.y, theta, 4);
      gameObjects.add(b);
      elapsed = 0;
      ammo --;
      shot.play();
      shot.rewind();
    }
    //enemy spawning
   if (frameCount % 40 == 0)
    {
      Enemy enemy1 = new Enemy(random(0, width), random(0, height), random(4,10), (float)50);
      gameObjects.add(enemy1);
    }
    elapsed += timeDelta;
    
    
    //ensure player stays in the boundries of the screen
    if(pos.y < 25)
    {
      pos.y = 25;
    }
    else if(pos.y > height -25)
    {
      pos.y = height - 25;
    }
    else if(pos.x < 25)
    {
      pos.x = 25;
    }
    else if(pos.x > width - 25)
    {
      pos.x = width - 25;
    }
    
    
    //buying juggernog
    if(pos.x > width - 200 && pos.y < 200 && money >= 3000)
    {
      if(keyPressed)
      {
        if(key == 'e')
        {
          health = 150;
          money -= 3000;
        }
      }
    }
    
    //buying ammo
    if(pos.x < 200 && pos.y < 200 && money >= 3000)
    {
      if(keyPressed)
      {
        if(key == 'e')
        {
          ammo = 100;
          money -= 3000;
        }
      }
    }
    
    //red low health warning
    if(health < 30)
    {
      noFill();
      strokeWeight(30);
      stroke(255,0,0);
      rect(0,0,width,height);
    }
    //dead game over 
    if(health <= 0)
    {
      backdrop = 2;
      health = 100;
      ammo = 100;
      pos.x = width/2;
      pos.y = height/2;
      
      //removes all enemies affter death
      for(int i = 2; i < gameObjects.size(); i ++)
      {
        gameObjects.remove(i);
      }
    }
    
    //displays all information on end screen
    pushMatrix();
    translate(0,0,5);
    textFont(font2);
    fill(160,0,0);
    text("Ammo: " + ammo, width - 280, height - 25);
    text("health: " + health, 25, height - 25);
    text("$" + money,width - width/3 + 250, 50);
    text(score + " points", width/3 -300, 50);
    popMatrix();
  }
}