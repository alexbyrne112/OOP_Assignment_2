class Perks
{
 void display()
 {
   pushMatrix();
   translate(width - 200, 0, 2);
   strokeWeight(3);
   stroke(0);
   fill(255, 0, 0);
   rect(0, 0, 200, 200);
   popMatrix();
   
   pushMatrix();
   translate(0, 0, 2);
   fill(0,0,255);
   rect(0,0,200,200);
   popMatrix();
   
 }
}