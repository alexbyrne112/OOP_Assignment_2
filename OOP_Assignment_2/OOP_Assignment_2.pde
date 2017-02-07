void setup()
{
  fullScreen(P3D);
  smooth(4);
  startscreen = loadImage("startscreen.jpg");
  zomb = loadImage("zombie.jpg");
  flooring = loadImage("floor.jpg");
  juggernog = loadImage("health.jpg");
  ammoCola = loadImage("ammo.png");
  endpic = loadImage("end.jpg");
  font = loadFont("Morethanhuman-130.vlw");
  font2 = loadFont("BookAntiqua-Bold-48.vlw");
  Player player0 = new Player((float)width/2, (float)height/2,(float) 0, (float)50, 'w', 's', 'a' ,'d', ' ');
  gameObjects.add(player0);
  fill(200,0,0);
  textSize(0);
  textFont(font);
  text("ZOMBIE LAND", 100, 250);
  
  minim = new Minim(this);
  scare = minim.loadFile("scare.mp3");
  ambiance = minim.loadFile("ambiance.mp3");
  girl = minim.loadFile("girl.mp3");
  
  b1.x = 200;
  b1.y = height - height/3;
  b1.bwidth = 400;
  b1.bheight = 200;
  b2.x = width/2 - 300;
  b2.y = height - 250;
  b2.bwidth = 600;
  b2.bheight = 200;

}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[1000];
float timeDelta = 1.0f / 60.0f;

PImage zomb;
PImage startscreen;
PImage flooring;
PImage juggernog;
PImage ammoCola;
PImage endpic;

PFont font;
PFont font2;

int backdrop = 0;
int money = 0;
int score = 0;
int highScore = 0;

Button b1 = new Button();
Button b2 = new Button();
Menu menu = new Menu();
Location l = new Location();
Perks p = new Perks();
endGame over = new endGame();


//http://soundbible.com/
import ddf.minim.*;
Minim minim;
AudioPlayer scare;
AudioPlayer ambiance;
AudioPlayer girl;


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
    p.display();
    for(int i = 0; i < gameObjects.size(); i ++)
    {
      GameObject go = gameObjects.get(i);
      go.render();
      go.update();
      
    }
 
  }
  else if(backdrop == 2)
  {
    over.display();
  }

}