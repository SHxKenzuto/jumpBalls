//Class that describes a genome
class Genome
{
  float j;
  float k;
  float l;
  float m;
  boolean best;             //checks if it's the best genome of the generation
  
  //Constructors
  
  Genome()
  {
    j = random(-0.1,0.1);
    k = random(-0.1,0.1);
    l = random(-0.1,0.1);
    m = random(-0.1,0.1);
    best = false;
  }
  
  Genome(Genome g)
  {
    this.j = g.j;
    this.k = g.k;
    this.l = g.l;
    this.m = g.m;
    this.best = g.best;
  }
  
  //Methods
  
  //4% chance of genome mutation
  //In case of mutation returns true
  boolean mutate()
  {
    boolean flag = false;
    float val = random(1);
    if(val <= 0.01)
    {
      j = random(-0.1,0.1);
      flag = true;
    }
      
    else if(val >0.01 && val<= 0.02)
    {
      k = random(-0.1,0.1);
      flag = true;
    }
    else if(val >0.02 && val<= 0.03)
    {
      l = random(-0.1,0.1);
      flag = true;
    }
    else if(val >0.03 && val<=0.04)
    {
      m = random(-0.1,0.1);
      flag = true;
    }
    return flag;
  }
  
}
