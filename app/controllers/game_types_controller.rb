class GameTypesController < ApplicationController
  before_action :set_game_type, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /game_types
  # GET /game_types.json
  def index
    @game_types = GameType.all
  end

  # GET /game_types/1
  # GET /game_types/1.json
  def show
  end

  # GET /game_types/new
  def new
    @game_type = GameType.new
  end

  # GET /game_types/1/edit
  def edit
  end

  # POST /game_types
  # POST /game_types.json
  def create
    @game_type = GameType.new(game_type_params)

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
      params[:game_type].permit(:name)
    end
end
