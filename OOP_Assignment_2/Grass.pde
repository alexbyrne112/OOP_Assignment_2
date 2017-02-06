class Grass
{
  float xstep = 5;
float ystep = 10;
float y = 0;
 
float nx = random(100);
float ny = random(100);
float nz = random(1000);
  /*float x;
  float y;
  float grassPosX;
  float grassPosY;
  
 Grass()
 {
   x = 0;
   y = 0;
   grassPosX = 0;
   grassPosY = 0;
 }
 */
 void display()
 {
  /*for (int i = 2; i < width *2; i+=10) 
  {
    for (int j = 5; i < height; i+=5)
    {
      stroke(0,230,0);
      fill(0,230,0);
      line(i,j,i +10, j+10);
    }
    
  }
      
   /*   pushMatrix();
      translate(x, y);
      stroke(41, random(255), 0);
      //fill(random(255), random(255), random(255));
      
       for (int i = 0; i < 100; i++) 
    {
      fill(0, 255, 0);
      line(grassPosX, grassPosY, grassPosX + 30, grassPosY + 30); 

    }
      popMatrix();
      grassPosX += 5;
    grassPosY += 5;
      
    }
  }*/
  stroke(#6C6756);
    for (float k = 0; height+ystep > k; k+=ystep) {
    beginShape();
    vertex(0, k);
    for (float l = 0; l < width+xstep; l+=xstep) {
      nx = l/234;
      ny = k/165;
      y = map(noise(nx, ny, nz), 0, 1, -100, 100)+k;
      curveVertex(l, y);
    }
    
    vertex(width, k);
    endShape();
  }
  stroke(#D3C9A2);
  for (float j = 0; height+ystep > j; j+=ystep) {
    beginShape();
    vertex(0, j);
    for (float i = 0; i < width+xstep; i+=xstep) {
      nx = i/234;
      ny = j/165;
      y = map(noise(nx, ny, nz), 0, 1, -200, 200)+j;
      curveVertex(i, y);
    }
    
    vertex(width, j);
    endShape();
  }
  
  nz+=.01;
}
 }