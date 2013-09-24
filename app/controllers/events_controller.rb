class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @invite = EventInvite.find_by_user_id_and_event_id( current_user.id, @event.id )
    set_counts()
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def rsvp_yes
    @invite = EventInvite.find_or_create_by_user_id_and_event_id( current_user.id, params[ :event_id ] )
    @invite.status = :yes
    @event = Event.find(params[:event_id])
    respond_to do |format|
      if @invite.save  
        set_counts()
        format.js
        format.html { redirect_to @event, notice: 'You are in.' }
        format.json { render action: 'show', status: :created, location: @invite }
      else
        format.js
        format.html { render action: 'show' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end   
  end
  
  def rsvp_no
    @invite = EventInvite.find_or_create_by_user_id_and_event_id( current_user.id, params[ :event_id ] )
    @invite.status = :no
    @event = Event.find(params[:event_id])
    respond_to do |format|
      if @invite.save    
        set_counts()
        format.js
        format.html { redirect_to @event, notice: 'You are out.' }
        format.json { render action: 'show', status: :created, location: @invite }
      else
        format.js
        format.html { render action: 'show' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end   
  end
  
  def rsvp_maybe
    @invite = EventInvite.find_or_create_by_user_id_and_event_id( current_user.id, params[ :event_id ] )
    @invite.status = :maybe
    @event = Event.find(params[:event_id])
    respond_to do |format|
      if @invite.save    
        set_counts()
        format.js
        format.html { redirect_to @event, notice: 'You are now a maybe.' }
        format.json { render action: 'show', status: :created, location: @invite }
      else
        format.js
        format.html { render action: 'show' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end   
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
  
    def set_counts
      @yes = 0
      @no = 0
      @maybe = 0
      yesNames = []
      noNames = []
      maybeNames = []
      
      yesRecs = EventInvite.where(  :event_id => @event.id ).where( :status_cd => 0 )
      for y in yesRecs
        @yes+=1
        name = ""
        profile = UserProfile.find_by_user_id( y.user_id )
        if profile.presence
          name = profile.nickname 
        end
        if !name || name == ""
          name = y.user.name 
        end 
      yesNames.push( name )      
      end
      @yesNames = yesNames.join(", ")
        
      noRecs = EventInvite.where(  :event_id => @event.id ).where( :status_cd => 1 )
      for n in noRecs
        @no+=1
        name = ""
        profile = UserProfile.find_by_user_id( n.user_id )
        if profile.presence
          name = profile.nickname 
        end
        if !name || name == ""
          name = n.user.name 
        end    
        noNames.push( name )
      end
      @noNames = noNames.join(", ")
        
      maybeRecs = EventInvite.where(  :event_id => @event.id ).where( :status_cd => 2 )
      for m in maybeRecs
        @maybe+=1
        name = ""
        profile = UserProfile.find_by_user_id( m.user_id )
        if profile.presence
          name = profile.nickname
        end
        if !name || name == ""
          name = m.user.name 
        end    
        maybeNames.push( name )
      end
      @maybeNames = maybeNames.join(", ")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start_date, :end_date, :is_private, :event_type, :location_id, :game_type_id, :recuring_event_id, :level)
    end
end
