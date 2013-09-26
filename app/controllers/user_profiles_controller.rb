class UserProfilesController < ApplicationController

  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /user_profiles
  # GET /user_profiles.json
  def index
    authorize! :index, @user_profile, :message => 'Not authorized as an administrator.'
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    authorize! :show, @user_profile, :message => 'Not authorized to view this profile.'
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
    authorize! :edit, @user_profile, :message => 'Not authorized to edit this profile.'
  end
  
  def editself
    @user_profile = UserProfile.find_or_create_by_user_id( current_user.id )
    redirect_to edit_user_profile_path( @user_profile )
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(user_profile_params)
    authorize! :create, @user_profile, :message => 'Not authorized to create this profile.'
    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    authorize! :edit, @user_profile, :message => 'Not authorized to update this profile.'
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to root_path, notice: 'User profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    authorize! :destroy, @user_profile, :message => 'Not authorized to delete this profile.'
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:nickname, :sms_number, :sms_carrier, :user_id, :home_address)
    end
end
