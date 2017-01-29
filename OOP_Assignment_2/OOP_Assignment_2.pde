void setup()
{
  fullScreen();
  //background(0);
  smooth(4);
  startscreen = loadImage("startscreen.jpg");
  image(startscreen,0,0,width,height);
  font = loadFont("youmurdererbb_reg.ttf");
  
  fill(200,0,0);
  textSize(110);
  textFont(font);
  text("ZOMBIE LAND", 70, 200);
  
}

PImage startscreen;
PFont font;

void draw()
{

}