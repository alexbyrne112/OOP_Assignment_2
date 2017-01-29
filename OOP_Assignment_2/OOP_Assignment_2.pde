void setup()
{
  fullScreen();
  //background(0);
  smooth(4);
  startscreen = loadImage("startscreen.jpg");
  zombie = loadImage("zombie.jpg");
  image(startscreen,0,0,width,height);
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
PFont font;

Button b1 = new Button();

void draw()
{
  if(mouseX > 200 && mouseX < 600 && mouseY > height - height/3 && mouseY < height - height/3 + 200)
  {
    strokeWeight(2);
    stroke(200,0,0);
    fill(50,0,0);
    rect(b1.x, b1.y, b1.bwidth, b1.bheight);
    fill(200,0,0);
    text("START", 235, height - 225);
    image(zombie,width / 2 - 200, height - 400, 400, 400);
  }
  else
  {
    strokeWeight(2);
    stroke(255);
    fill(0);
    rect(b1.x, b1.y, b1.bwidth, b1.bheight);
    fill(255);
    text("START", 235, height - 225);
    fill(0);
    stroke(0);
    rect(width / 2 - 200, height - 400, 400, 400);
  }
}