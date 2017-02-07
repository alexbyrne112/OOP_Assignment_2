class Perks
{
 void display()
 {
   pushMatrix();
   translate(width - 200, 0, 2);
   
   strokeWeight(3);
   image(juggernog,0,0,200,200);
   popMatrix();
   
   pushMatrix();
   translate(0, 0, 2);
   fill(0,0,130);
   rect(0,0,200,200);
   popMatrix();
   
 }
}