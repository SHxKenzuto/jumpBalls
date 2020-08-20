//Class that describe a single ball
class Ball
{
  PVector vel;
  PVector pos;
  float original_pos;              //starting position - it's implied that y coordinate is fixed at height-5
  float distance_from_target;
  boolean dead;
  Genome gen;
  PVector target;
  float fitness;
  Time time;

//Constructors  
  Ball()
  {
    dead = false;
    fitness = 0;
    time = new Time();
    original_pos = random(width/2-200);
    target = new PVector((width/2)+500,height-5);
    pos = new PVector (original_pos,height-5);
    float velx = 0; 
    float vely = 0;
    gen = new Genome();
    distance_from_target = dist(pos.x,pos.y,target.x,target.y);
    for(int i = 0; i< gen.gene_number/2;i++)
    {
      velx = velx + gen.g[i*2]*distance_from_target;                    //the speed vector is built using the distance between the ball and the target (adjusted with coefficients)
      vely = vely + gen.g[(i*2)+1]*distance_from_target;
    }
   
    vel = new PVector(velx,vely);
    

  }
  
  Ball(Time t, float op, PVector tgt, int n)
  {
    dead = false;
    fitness = 0;
    original_pos = op;
    time = t;
    target = tgt;
    pos = new PVector (original_pos,height-5);
    float velx = 0;
    float vely = 0;
    gen = new Genome(n);
    distance_from_target = dist(pos.x,pos.y,target.x,target.y);
    for(int i = 0; i< gen.gene_number/2;i++)
    {
      velx = velx + gen.g[i*2]*distance_from_target;                    
      vely = vely + gen.g[(i*2)+1]*distance_from_target;
    }
    vel = new PVector(velx,vely);
    
  }
  
   Ball(Genome g, Time t, float op, PVector tgt, int n)
  {
    dead = false;
    fitness = 0;
    original_pos = op;
    time = t;
    target = tgt;
    pos = new PVector (original_pos,height-5);
    float velx = 0;
    float vely = 0;
    gen = new Genome(g,n);
    distance_from_target = dist(pos.x,pos.y,target.x,target.y);
    for(int i = 0; i< gen.gene_number/2;i++)
    {
      velx = velx + gen.g[i*2]*distance_from_target;               
      vely = vely + gen.g[(i*2)+1]*distance_from_target;
    }
    vel = new PVector(velx,vely);
   
  }
  
  //Methods
  
  //Sets the new speed of the ball (used when its genome is changed)
  void set_vel()
  {
     float velx = 0;
     float vely = 0;
     for(int i = 0; i< gen.gene_number/2;i++)
    {
      velx = velx + gen.g[i*2]*distance_from_target;                  
      vely = vely + gen.g[(i*2)+1]*distance_from_target;
    }
     vel = new PVector(velx,vely);
  }
  
//Describes parabolic motion
  void move()
  {
    float t = time.get_time();
    float vt = (float) this.vel.y*t*10;                //All the values are multiplied by a factor of 10 for the simulation
    float gt2 =(float) 1/2 * 9.8 * pow(t,2)*10;
    
    this.pos.y = (height-5) - vt + gt2;
    this.pos.x = original_pos + (this.vel.x * t * 10);
  }
  
 
  // Updates the position of the ball if it's not dead (has been stopped) and checks for collisions.
  //When the ball stops its fitness is calculated
  void update()
  {
    if(!dead)
    {
      move();
      if(this.pos.x<5 || this.pos.y<5 || this.pos.x >width-5 || this.pos.y > height-5 || this.pos.x>(width/2)-5 && this.pos.y>(height/2) && this.pos.x<(width/2)+30)
        dead = true;
        fitness = (1/(dist(pos.x,pos.y,target.x,target.y)*dist(pos.x,pos.y,target.x,target.y)))*1000000; // 1 over the sqare of distance multiplied by 1000000 because the values are too small.
    }
  }
  
  //Draws the balls using their positions
  void drawing()
  {
    if(gen.best)
    {
      fill(0,0,255);
    }
    else
    {
     fill(255,0,0);
    }
    ellipse(this.pos.x,this.pos.y,10,10);
  }
  
}
