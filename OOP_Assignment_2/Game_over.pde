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
    
    if(mouseX > b2.x && mouseX < b2.x + 600 && mouseY > b2.y && mouseY < b2.y + 200)
    {
      strokeWeight(2);
      stroke(200,0,0);
      fill(50,0,0);
      rect(b2.x, b2.y, b2.bwidth, b2.bheight);
      fill(200,0,0);
      text("RESTART", width/2 - 235, height -120);
      if(mousePressed == true)
      {
        backdrop = 0;
      }
    }
     else
    {
        strokeWeight(2);
        stroke(255);
        fill(0);
        rect(b2.x, b2.y, b2.bwidth, b2.bheight);
        fill(255);
        stroke(255);
        text("RESTART", width/2 - 235, height -120);
        noFill();
        stroke(255);
        rect(b2.x, b2.y, b2.bwidth, b2.bheight);
    }
  }
}