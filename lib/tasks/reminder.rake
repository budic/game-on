namespace :reminder do
  desc "Send Reminder Email"
  task send_email: :environment do
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
  task send_sms: :environment do
    Event.where( 'next_reminder_time <= ? AND next_reminder_type_cd = 1', Time.new + 7.days ).find_each do |e|
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

end
