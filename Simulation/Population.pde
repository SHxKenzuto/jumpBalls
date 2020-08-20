//Class that describes a population of balls
class Population
{
  ArrayList<Ball> pop;
  Time time;
  float start_point;                   //starting point for all the balls (it's used to set the "original_pos" variable inside a Ball object)
  boolean fixed_start_point;           //If it's set to true, all the generations of balls will have the same starting point of the first one
  PVector target;                      //Target position (used to set the same variable inside a Ball object)
  int genome_size;
  
  //Constructors
  
  Population()
  {
    genome_size = 2;
    fixed_start_point = false;
    start_point = random(width/2-200);
    target = new PVector((width/2)+500,height-5);
    pop = new ArrayList<Ball>();
    time = new Time();
    for(int i = 0;i < 1000; i++)
    {
      pop.add(new Ball(time,start_point,target,genome_size));
    }
  }
  
  Population(int pop_size, boolean f, float x, int n)     //size of population, starting point fixed or not, starting point for the first gen
  {
    genome_size = n;
    fixed_start_point = f;
    start_point = random(width/2-200);
    target = new PVector(x,height-5);
    time = new Time();
    pop = new ArrayList<Ball>();
    for(int i = 0;i < pop_size; i++)
    {
      pop.add(new Ball(time,start_point,target,genome_size));
    }
  }
  
  //Methods
  
  
  //Returns the sum of all the fitnesses of the balls
  float fitness_sum()
  {
    float counter = 0;
    for(int i = 0; i<pop.size();i++)
    {
      counter += pop.get(i).fitness;
    }
    return counter;
  }
  
  //Checks if all the balls are dead
  boolean everyone_dead()
  {
    boolean stop = false;
    boolean result = true;
    int i = 0;
    while(!stop && i<pop.size())
    {
      if(!pop.get(i).dead)
      {
        stop = true;
        result = false;
      }
      i++;
    }
    return result;
  }
  
  //Selects a breeder for reproduction
  Ball breeder_selection()
  {
    Ball p;
    float sum = 0;
    int i = 0;
    float random_treshold = random(fitness_sum()); //A value between 0 and the sum of al fitnesses
    while(i<pop.size() && sum<random_treshold )    //while there is still pop fitness to sum and the sum is less than the treshold, keep adding
    {                                              //the ball whose fitness excedes the treshold is selected as breeder
      sum += pop.get(i).fitness;                   //in this way the balls with higher fitness are more likely to be selected
      i++;
    }
    p = new Ball(pop.get(i-1).gen, time,start_point, target, genome_size);
    return p;
  }
  
  //Takes two breeders and creates a ball child
  Ball breeding()
  {
    Ball p1, p2;
    p1 = breeder_selection();
    p2 = breeder_selection();
    p1.gen.crossover(p2.gen);
    return p1;
  }
  
  //Selects the ball with the best fitness of the previous generation
  Ball best_fit()
  {
    int best_index = 0;
    Ball best_ball = new Ball(pop.get(0).gen,time,start_point, target, genome_size);
    float best_fit = -1000;
    for(int i = 0;i<pop.size();i++)
    {
      pop.get(i).gen.best = false;
      if(pop.get(i).fitness>best_fit)
      {
        best_fit = pop.get(i).fitness;
        best_ball = new Ball(pop.get(i).gen,time,start_point, target, genome_size);
        best_index = i;
      }
        
    }
    println("BEST FIT: "+best_fit);
    pop.get(best_index).gen.best = true;
    return best_ball;
  }
  
  
  //When everyone is dead, a new generation is created
  void new_pop()
  {
    boolean is_mutated = false;
    ArrayList<Ball> new_pop = new ArrayList<Ball>();
    time.reset_time();                                  //time is reset because the motion of the balls is strictly bound to time (their behaviour would be wrong without this)
    if(!fixed_start_point)
    {
      start_point = random(width/2-200);                //new starting position for next generation if the flag is set true
    }
    new_pop.add(best_fit());                            //The best ball of the previous generation is cloned
    print("NEW POP BEST: ");
    for(int i = 0; i< new_pop.get(0).gen.gene_number;i++)
    {
      print(+new_pop.get(0).gen.g[i]+" ");
    }
    print("\n");
    for(int i = 1; i<pop.size();i++)
    {
      new_pop.add(breeding());                           //Other balls are added using the breeder_selection function
      is_mutated = new_pop.get(i).gen.mutate();          //Each ball has a 4% chance of being mutated
      if(is_mutated)
      {                                                  
        new_pop.get(i).set_vel();                         //If a mutation occurred we have to set the speed again
        new_pop.get(i).gen.best = false;                  
      }
    }
    pop = new_pop;
  }
  
  //Updates the position of all the balls
   void update()
  {
     for(int i = 0;i<pop.size();i++)
    {
      pop.get(i).update();
    }
  }
  
  //Draws the new positions
    void drawing()
  {
    fill(0,255,0);
    ellipse(target.x,target.y,10,10);
    for(int i = 0;i<pop.size();i++)
    {
      pop.get(i).drawing();
    }    
  }
  
}
