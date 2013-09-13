class RecurringEventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_recurring_event, only: [:show, :edit, :update, :destroy]

  # GET /recurring_events
  # GET /recurring_events.json
  def index
    @recurring_events = RecurringEvent.all
  end

  # GET /recurring_events/1
  # GET /recurring_events/1.json
  def show
    @location = Location.find( @recurring_event.location_id )
    @myevent = RecEventFollow.find_by_user_id_and_recurring_event_id( current_user.id, @recurring_event.id )
  end

  # GET /recurring_events/new
  def new
    @recurring_event = RecurringEvent.new
    @recurring_event.game_type_id = 1
    @recurring_event.location_id = params[:location_id]
    @location = Location.find( params[:location_id] )
  end

  # GET /recurring_events/1/edit
  def edit
    @location = Location.find( @recurring_event.location_id )
  end

  # POST /recurring_events
  # POST /recurring_events.json
  def create
    params[:recurring_event].parse_time_select! :start_time
    params[:recurring_event].parse_time_select! :end_time
    @recurring_event = RecurringEvent.new(recurring_event_params)
    respond_to do |format|
      if @recurring_event.save
        format.html { redirect_to @recurring_event, notice: 'Recurring event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recurring_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @recurring_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recurring_events/1
  # PATCH/PUT /recurring_events/1.json
  def update
    params[:recurring_event].parse_time_select! :start_time
    params[:recurring_event].parse_time_select! :end_time
    respond_to do |format|
      if @recurring_event.update(recurring_event_params)
        format.html { redirect_to @recurring_event, notice: 'Recurring event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recurring_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurring_events/1
  # DELETE /recurring_events/1.json
  def destroy
    @recurring_event.destroy
    respond_to do |format|
      format.html { redirect_to recurring_events_url }
      format.json { head :no_content }
    end
  end

  def nearby
    if !params[:search]
      params[:search] = get_home_address().presence || request.location.address
          #params[:search] = request.location.address
    end
    
    @recurring_events  = RecurringEvent.joins(:location).near(params[:search], 20)
  end

  def follow
    @myevent = RecEventFollow.new
    @myevent.user_id = current_user.id
    @myevent.recurring_event_id = params[ :recurring_event_id ]
    @recurring_event = RecurringEvent.find( params[ :recurring_event_id ] )
 
    respond_to do |format|
      if @myevent.save   
        event = Event.where( 'recurring_event_id = ? ', @myevent.recurring_event_id ).first
        if event.presence
          invite = EventInvite.find_or_create_by( event_id: event.id,  user_id: current_user.id )
        end
        format.js
        format.html { redirect_to @recurring_event, notice: 'Added to your events.' }
        format.json { render action: 'show', status: :created, location: @myevent }
      else
        format.js
        format.html { render action: 'show' }
        format.json { render json: @recurring_event.errors, status: :unprocessable_entity }
      end
    end   
  end
  
  def unfollow
    @myevent = RecEventFollow.find_by_user_id_and_recurring_event_id( current_user.id, params[ :recurring_event_id ] )
    @recurring_event = RecurringEvent.find( params[ :recurring_event_id ] )
    event = Event.where("recurring_event_id = ? AND start_date > ?", @myevent.recurring_event_id, Time.now.beginning_of_day ).first
    if event.presence
      invite = EventInvite.find_by_event_id_and_user_id( event,  @myevent.user_id )
      if invite.presence
        invite.destroy
      end
    end
    
    respond_to do |format|
      if @myevent.destroy   
        @myevent = RecEventFollow.find_by_user_id_and_recurring_event_id( current_user.id, params[ :recurring_event_id ] )
        format.js
        format.html { redirect_to @recurring_event, notice: 'Removed from your events.' }
        format.json { render action: 'show', status: :created, location: @myevent }
      else
        format.js
        format.html { render action: 'show' }
        format.json { render json: @recurring_event.errors, status: :unprocessable_entity }
      end
    end   
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurring_event
      @recurring_event = RecurringEvent.find(params[:id])
    end

    def get_home_address
      profile = UserProfile.find_or_create_by_user_id( current_user.id)
      return profile.home_address
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def recurring_event_params
      params.require(:recurring_event).permit(:name, :location_id, :game_type_id, :start_time, :end_time, :day, :level)
    end
end
