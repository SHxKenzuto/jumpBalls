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

//Class that handles time
class Time
{
  float current_time;
  float start_time;
 
  //Constructors
  Time()
  {
    start_time = (float) millis()/1000;
    current_time = 0.0;
  }
  //Methods
  
  //Resets the elapsed time (current_time) and sets "now" as the new start time
  void reset_time()
  {
    current_time = 0.0;
    start_time = (float) millis()/1000;
  }
  
  //Gets the current time from a defined start time
  float get_time()
  {
    return (((float) millis()/1000)-start_time);
  }
  
}
