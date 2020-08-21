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
