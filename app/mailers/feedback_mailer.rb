class FeedbackMailer < ActionMailer::Base
  default :from => 'noreply@leftcoastal.com'

  def feedback(feedback)
    @feedback = feedback
    mail(:to => 'leftcoastalgames@gmail.com', 
         :subject => '[Feedback for YourSite] #{feedback.subject}')
  end
end
