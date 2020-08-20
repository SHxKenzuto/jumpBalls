//Class that describes a genome
class Genome
{
  float[] g;
  int gene_number;
  boolean best;             //checks if it's the best genome of the generation
  
  //Constructors
  
  Genome()
  {
    gene_number = 2;
    g = new float[gene_number];
    for(int i = 0; i<gene_number;i++)
    {
      g[i] = random(-0.1,0.1);
    }
    best = false;
  }
  
  Genome(int n)
  {
    gene_number = n;
    g = new float[gene_number];
    for(int i = 0; i<gene_number;i++)
    {
      g[i] = random(-0.1,0.1);
    }
    best = false;
  }
  
  Genome(Genome gen, int n)
  {
    gene_number = n;
    g = new float[gene_number];
    for(int i = 0; i<gen.gene_number;i++)
    {
      this.g[i] = gen.g[i];
    }
    this.best = gen.best;
  }
  
  //Methods
  
  //4% chance of genome mutation
  //In case of mutation returns true
  boolean mutate()
  {
    int i = 0;
    boolean flag = false;
    float val = random(1);
    while(i<gene_number && !flag)
    {
      if(val > (i*0.1) && val<=(i*0.1)+0.1)
      {
        g[i] = random(-0.1,0.1);
        flag = true;
      }
      i++;
    }
    return flag;
  }
  
  void crossover(Genome gen)
  {
    float val = 0;
    for(int i = 0; i<gen.gene_number;i++)
    {
      val = random(gene_number/10);
      if(val > (i*0.1) && val<=(i*0.1)+0.1)
        this.g[i] = gen.g[i];
    }
  }
  
}
