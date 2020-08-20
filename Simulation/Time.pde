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
