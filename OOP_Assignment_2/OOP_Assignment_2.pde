void setup()
{
  fullScreen();
  //background(0);
  smooth(4);
  startscreen = loadImage("startscreen.jpg");
  zombie = loadImage("zombie.jpg");
  flooring = loadImage("floor.jpg");
  font = loadFont("Morethanhuman-130.vlw");
  Player player0 = new Player((float)width/2, (float)height/2,(float) 0, (float)50, 'w', 's', 'a' ,'d', ' ');
  gameObjects.add(player0);
  fill(200,0,0);
  textSize(0);
  textFont(font);
  text("ZOMBIE LAND", 100, 250);
  
  b1.x = 200;
  b1.y = height - height/3;
  b1.bwidth = 400;
  b1.bheight = 200;
  
}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[1000];
float timeDelta = 1.0f / 60.0f;

//gameObjects.add(aiShip);
//

PImage zombie;
PImage startscreen;
PImage flooring;

PFont font;

int backdrop = 0;

Button b1 = new Button();
Menu menu = new Menu();
Location1 l = new Location1();

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

void draw()
{
  if(backdrop == 0)
  {
    menu.display();
  }
  else if(backdrop == 1)
  {
    l.display();
  }
  
  for(int i = 0; i < gameObjects.size(); i ++)
  {
    GameObject go = gameObjects.get(i);
    go.render();
    go.update();
    
  }
}