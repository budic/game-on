
  desc "Remove old"
  task removeold: :environment do
    # Get all events more than 1 day old and delete them
    Event.destroy_all(['end_date < ?', 1.days.ago])
    puts 'Old records removed'
  end

  desc "Reset all"
  task resetall: :environment do
    # Get all events more than 1 day old and delete them
    Event.destroy_all
    RecurringEvent.all.each do |r|
      r.next_gen_date = nil
      r.save()
    end
    puts 'Old records removed'
  end

  desc "Add new"
  task addnew: :environment do
    time = Time.zone.now
    RecurringEvent.where('next_gen_date < ? OR next_gen_date IS NULL', time).find_each do |r|
    #RecurringEvent.all.each do |r| 

      doffset =  r.day - time.wday
      if doffset < 0
        doffset = 7 + (r.day - time.wday)
      end
      
      stime = Time.zone.local( time.year, time.month, time.day, r.start_time.hour, r.start_time.min ) + doffset.days
      etime = Time.zone.local( time.year, time.month, time.day, r.end_time.hour, r.end_time.min ) + doffset.days
       
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

  desc "Send Reminder Email"
  task send_reminder_email: :environment do
    #Get all the events taht
    Event.where( 'next_reminder_time <= ? AND next_reminder_type_cd = 0' , Time.new + 5.minutes ).find_each do |e|
      @event = e
      tolist = Array.new
      EventInvite.where( 'event_id = ?' , @event.id ).find_each do |invite|
        tolist.push( User.find( invite.user_id ).email )
      end  
      UserMailer.event_email_reminder( @event, tolist ).deliver
      
      e.next_reminder_time = e.start_date - 3.hours
      e.next_reminder_type_cd = 1
      e.save()
    end
    
  end

  desc "Send Reminder SMS"
  task send_sms_reminder: :environment do
    Event.where( 'next_reminder_time <= ? AND next_reminder_type_cd = 1', Time.new + 5.minutes ).find_each do |e|
      @event = e
      tolist = Array.new
      EventInvite.where( 'event_id = ?' , @event.id ).find_each do |invite|
        userprofile = UserProfile.find( invite.user_id )
        usernumber = userprofile.sms_number
        carriers = ['@txt.att.net', '@vtext.com']
        
        if !usernumber.nil? && !userprofile.sms_carrier_cd.nil?
          usernumber = usernumber + carriers[ userprofile.sms_carrier_cd ]
          tolist.push( usernumber )
        end
        
      end  
      UserMailer.event_sms_reminder( @event, tolist ).deliver
      
      e.next_reminder_time = nil
      e.next_reminder_type_cd = nil
      e.save()
    end
  end
  

