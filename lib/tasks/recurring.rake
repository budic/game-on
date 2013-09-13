namespace :recurring do
  desc "Remove old"
  task removeold: :environment do
    # Get all events more than 1 day old and delete them
    Event.destroy_all(['end_date < ?', 1.days.ago])
    puts 'Old records removed'
  end
  
  desc "Clear"  
  task clear: :environment do
    # Get all events more than 1 day old and delete them
    Event.destroy_all()
    puts 'All records removed'
    RecurringEvent.find_each do |r|
      r.next_gen_date = nil
      r.save()
    end
    
  end

  desc "Add new"
  task addnew: :environment do
    time = Time.new
    RecurringEvent.where('next_gen_date < ? OR next_gen_date IS NULL', time).find_each do |r|
    #RecurringEvent.all.each do |r| 

      doffset =  r.day - time.wday
      if doffset < 0
        doffset = 7 + (r.day - time.wday)
      end
      
      stime = Time.new( time.year, time.month, time.day, r.start_time.hour, r.start_time.min ) + doffset.days
      etime = Time.new( time.year, time.month, time.day, r.end_time.hour, r.end_time.min ) + doffset.days
       
      ev = Event.find_or_create_by_recurring_event_id_and_start_date( r.id , stime )
      ev.name = r.name
      rtime = stime - 1.day
      ev.next_reminder_time = rtime
      ev.next_reminder_type = 0
      ev.start_date = stime 
      ev.end_date = etime
      ev.game_type_id = r.game_type_id
      ev.location_id = r.location_id
      ev.save()
      puts 'Added ' + ev.name
      
      RecEventFollow.find_each(:conditions => "recurring_event_id = " + r.id.to_s ) do |f|
        invite = EventInvite.find_or_create_by_event_id_and_user_id( ev.id, f.user_id )
      end
      
      r.next_gen_date = etime
      r.save()
      
    end
  end

end
