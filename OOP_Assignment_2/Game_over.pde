class endGame
{
  void display()
  {
    textFont(font);
    image(endpic, 0,0,width, height);
    fill(200,0,0);
    text("GAME    OVER", width/2 - 350, 200);
    
    fill(0);
    stroke(255);
    rect(width/2 - 300, height - 250, 600, 200);
    fill(255);
    text("RESTART", width/2 - 235, height -120);
    
    pushMatrix();
    translate(0,0,5);
    textFont(font2);
    fill(160,0,0);
    text("Money: " + money, 100, 200);
    text("Points: " + score, 100, 400);
    text("Kills: " +score/15, 100, 600);
    if(score > highScore)
    {
      highScore = score;
    }
    text("High Score: " + highScore, width - 370, 200);
    popMatrix();
    
    // restart button
    if(mouseX > b2.x && mouseX < b2.x + 600 && mouseY > b2.y && mouseY < b2.y + 200)
    {
      strokeWeight(2);
      stroke(200,0,0);
      fill(50,0,0);
      rect(b2.x, b2.y, b2.bwidth, b2.bheight);
      fill(200,0,0);
      textFont(font);
      text("RESTART", width/2 - 235, height -120);
      if(mousePressed == true)
      {
        //backdrop = 0;
        //score = 0;
        money = 0;

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
        textFont(font);
        text("RESTART", width/2 - 235, height -120);
        noFill();
        stroke(255);
        rect(b2.x, b2.y, b2.bwidth, b2.bheight);
    }
    
    //exit button
    if(mouseX > b3.x && mouseX < b3.x + 200 && mouseY > b3.y && mouseY < b3.y + 200)
    {
      strokeWeight(2);
      stroke(200,0,0);
      fill(50,0,0);
      rect(b3.x, b3.y, b3.bwidth, b3.bheight);
      fill(200,0,0);
      textFont(font);
      text("Exit", width - 320, height -120);
      if(mousePressed == true)
      {
        exit();
      }
    }
     else
    {
        strokeWeight(2);
        stroke(255);
        fill(0);
        rect(b3.x, b3.y, b3.bwidth, b3.bheight);
        fill(255);
        stroke(255);
        textFont(font);
        text("Exit", width -320, height -120);
        noFill();
        stroke(255);
        rect(b2.x, b2.y, b2.bwidth, b2.bheight);
    }
  }
}