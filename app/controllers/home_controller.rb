class HomeController < ApplicationController
  respond_to :html, :js
  before_filter :authenticate_user!
  
  def index    
    #@event_invites = EventInvite.includes(:event).where("user_id = ? AND events.start_date > ? ", current_user.id, Time.now.to_date ).references(:event)
    @event_invites = EventInvite.includes(:event).where("user_id = ? AND events.start_date > ? ", current_user.id, Time.now.beginning_of_day ).references(:event).order('events.start_date')
  end
  
  def create
    if !params[:search]
          params[:search] = request.location.address
    end
   
    location = Location.search(params[:search])
    @recurring_events  = RecurringEvent.joins(:location).near(params[:search], 20).order( :day, :start_time )  
      if @recurring_events
        respond_to do |format|
          format.js
          format.html { render :partial => 'recurring_event', :object => @recurring_events, :content_type => 'text/html' }
        end
      end
   end

end
