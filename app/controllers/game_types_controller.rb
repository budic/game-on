class GameTypesController < ApplicationController
  before_action :set_game_type, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  
  # GET /game_types
  # GET /game_types.json
  def index
    @game_types = GameType.all
    authorize! :index, GameType.new, :message => 'Not authorized as an administrator.'
  end

  # GET /game_types/1
  # GET /game_types/1.json
  def show
    authorize! :show, @game_type.new, :message => 'Not authorized as an administrator.'
  end

  # GET /game_types/new
  def new
    @game_type = GameType.new
    authorize! :create, @game_type.new, :message => 'Not authorized as an administrator.'
  end

  # GET /game_types/1/edit
  def edit
    authorize! :edit, @game_type.new, :message => 'Not authorized as an administrator.'
  end

  # POST /game_types
  # POST /game_types.json
  def create
    @game_type = GameType.new(game_type_params)
    authorize! :create, @game_type.new, :message => 'Not authorized as an administrator.'
    respond_to do |format|
      if @game_type.save
        format.html { redirect_to @game_type, notice: 'Game type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @game_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_types/1
  # PATCH/PUT /game_types/1.json
  def update
    authorize! :update, @game_type.new, :message => 'Not authorized as an administrator.'
    respond_to do |format|
      if @game_type.update(game_type_params)
        format.html { redirect_to @game_type, notice: 'Game type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_types/1
  # DELETE /game_types/1.json
  def destroy
    authorize! :destroy, @game_type.new, :message => 'Not authorized as an administrator.'
    @game_type.destroy
    respond_to do |format|
      format.html { redirect_to game_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_type
      @game_type = GameType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_type_params
      params[:game_type].permit(:name, :level1, :level2, :level3, :level4, :level5)
    end
end
