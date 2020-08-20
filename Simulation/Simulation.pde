int iteration = 0; //<>//
Population pop;

void setup()
{
  size(1080,720);
  frameRate(120);
  background(255);
  pop = new Population(1000,true, width/2+500,2);
}

void draw()
{
  background(255);
  fill(0);
  rect(width/2,height/2,25,400);
  pop.drawing();
  pop.update();
  if(pop.everyone_dead())
  {  
     pop.new_pop(); //<>//
     iteration++;
     println("ITERATION: "+iteration);
  }
}
