class FeedbackMailer < ActionMailer::Base
  default :from => 'noreply@leftcoastal.com'

  def feedback(feedback)
    @feedback = feedback
    mail(:to => 'leftcoastalgames@gmail.com', 
      :subject => 'Game-on! Feedback: + feedback.subject})
  end
end
