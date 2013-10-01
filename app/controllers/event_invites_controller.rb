class EventInvitesController < ApplicationController
  before_action :set_event_invite, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /event_invites
  # GET /event_invites.json
  def index
    @event_invites = EventInvite.all
    authorize! :index, EventInvite.new, :message => 'Not authorized as an administrator.'
  end

  # GET /event_invites/1
  # GET /event_invites/1.json
  def show
    authorize! :show, @event_invite, :message => 'Not authorized as an administrator.'
  end

  # GET /event_invites/new
  def new
    @event_invite = EventInvite.new
  end

  # GET /event_invites/1/edit
  def edit
    authorize! :edit, @event_invite, :message => 'Not authorized as an administrator.'
  end

  # POST /event_invites
  # POST /event_invites.json
  def create
    @event_invite = EventInvite.new(event_invite_params)
    authorize! :create, @event_invite, :message => 'Not authorized as an administrator.'
    respond_to do |format|
      if @event_invite.save
        format.html { redirect_to @event_invite, notice: 'Event invite was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_invite }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_invites/1
  # PATCH/PUT /event_invites/1.json
  def update

    respond_to do |format|
      if @event_invite.update(event_invite_params)
        format.html { redirect_to @event_invite, notice: 'Event invite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_invites/1
  # DELETE /event_invites/1.json
  def destroy
    authorize! :destroy, @user
    @event_invite.destroy
    respond_to do |format|
      format.html { redirect_to event_invites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_invite
      @event_invite = EventInvite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_invite_params
      params.require(:event_invite).permit(:status, :user_id)
    end
end
