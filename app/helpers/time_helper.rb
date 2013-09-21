module TimeHelper
  
  def get_timestring( start_time, end_time )
    time = ""
    sday = Date.today
    stime = Time.new( sday.year, sday.month, sday.day, start_time.hour, start_time.min)
    etime = Time.new( sday.year, sday.month, sday.day, end_time.hour,end_time.min)
    if start_time 
      time += stime.in_time_zone.strftime("%l:%M %P")
      if end_time
        time += " - " + etime.in_time_zone.strftime("%l:%M %P") 
      end 
    end
    return time 
  end  
  
end
