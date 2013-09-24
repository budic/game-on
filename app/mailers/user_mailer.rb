class UserMailer < ActionMailer::Base
  default from: "leftcoastalgames@gmail.com"
  
  def test_email(user)
    @user = user
    @url = 'http://goplay.herokuapp.com/'
    mail(to: '8586997329@mms.att.net', subject:  'Test SMS')
  end
  
  def event_email_reminder( event, tolist )
    @event = event
    @url = 'http://goplay.herokuapp.com/'
    
    mail(to: tolist.join(","), subject:  'Game Reminder Email from Game-on')
  end
  
  def event_sms_reminder( event, tolist )
    @event = event
    @url = 'http://goplay.herokuapp.com/'
    
    mail(to: tolist.join(","), subject:  'Game-On reminder')
  end
  
end
