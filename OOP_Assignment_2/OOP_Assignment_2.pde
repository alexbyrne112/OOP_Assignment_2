void setup()
{
  fullScreen();
  //background(0);
  smooth(4);
  startscreen = loadImage("startscreen.jpg");
  zombie = loadImage("zombie.jpg");
  flooring = loadImage("floor.jpg");
  font = loadFont("Morethanhuman-130.vlw");
  
  fill(200,0,0);
  textSize(0);
  textFont(font);
  text("ZOMBIE LAND", 100, 250);
  
  b1.x = 200;
  b1.y = height - height/3;
  b1.bwidth = 400;
  b1.bheight = 200;
  
}

PImage zombie;
PImage startscreen;
PImage flooring;

PFont font;

int backdrop = 0;

Button b1 = new Button();
Menu menu = new Menu();
Location1 l = new Location1();

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
}