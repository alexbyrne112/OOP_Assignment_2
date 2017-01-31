abstract class GameObject
{
  PVector pos;
  PVector forward;
  float size;
  
  GameObject()
  {
    //println("In GameObject default constructor");
  }
  
  abstract void update();  
  abstract void render();
}