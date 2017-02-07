class endGame
{
  void display()
  {
    image(endpic, 0,0,width, height);
    fill(200,0,0);
    text("GAME    OVER", width/2 - 350, 200);
    
    fill(0);
    stroke(255);
    rect(width/2 - 300, height - 250, 600, 200);
    fill(255);
    text("RESTART", width/2 - 235, height -120);
    

}