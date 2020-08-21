/* Copyright (C) 2020 SHxKenzuto
    This file is part of jumpingBalls.
    jumpingBalls is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    jumpingBalls is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with jumpingBalls.  If not, see <http://www.gnu.org/licenses/>.
*/


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
  
  //gene_number% chance of genome mutation
  //In case of mutation returns true
  boolean mutate()
  {
    int i = 0;
    boolean flag = false;
    float val = random(1);
    while(i<gene_number && !flag)
    {
      if(val > (i*0.01) && val<=(i*0.01)+0.01)
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
