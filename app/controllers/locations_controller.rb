class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /locations
  # GET /locations.json
  def index
      @locations = Location.all 
      authorize! :index, Location.new, :message => 'Not authorized as an administrator.'
  end
  
  # GET /locations/1
  # GET /locations/1.json
  def show
    authorize! :show, @location, :message => 'Not authorized as an administrator.'
  end

  # GET /locations/new
  def new
    @location = Location.new
    authorize! :create, @location, :message => 'Not authorized as an administrator.'
  end

  # GET /locations/1/edit
  def edit
    authorize! :edit, @location, :message => 'Not authorized as an administrator.'
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    authorize! :create, @location, :message => 'Not authorized as an administrator.'
    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    authorize! :update, @location, :message => 'Not authorized as an administrator.'
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    authorize! :destroy, @location, :message => 'Not authorized as an administrator.'
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
  
  def nearby
    authorize! :nearby, Location.new, :message => 'Not authorized as an administrator.'
    @has_distance = true
    if !params[:search] || params[:search] == ""
      params[:search] = get_home_address().presence || request.location.address
    end   
    
    @locations  = Location.paginate(:page => params[:page]).near(params[:search], 20) 
    if @locations.count.zero?
      @locations = Location.paginate(:page => params[:page]).find(:all)
      @has_distance = false
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    def get_home_address
      profile = UserProfile.find_or_create_by_user_id( current_user.id)
      return profile.home_address
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params[:location]
    end
end
