class RecEventFollowsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_rec_event_follow, only: [:show, :edit, :update, :destroy]

  # GET /rec_event_follows
  # GET /rec_event_follows.json
  def index
    @rec_event_follows = RecEventFollow.all
  end

  # GET /rec_event_follows/1
  # GET /rec_event_follows/1.json
  def show
  end

  # GET /rec_event_follows/new
  def new
    @rec_event_follow = RecEventFollow.new
  end

  # GET /rec_event_follows/1/edit
  def edit
  end

  # POST /rec_event_follows
  # POST /rec_event_follows.json
  def create
    @rec_event_follow = RecEventFollow.new(rec_event_follow_params)

    respond_to do |format|
      if @rec_event_follow.save
        format.html { redirect_to @rec_event_follow, notice: 'Rec event follow was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rec_event_follow }
      else
        format.html { render action: 'new' }
        format.json { render json: @rec_event_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rec_event_follows/1
  # PATCH/PUT /rec_event_follows/1.json
  def update
    respond_to do |format|
      if @rec_event_follow.update(rec_event_follow_params)
        format.html { redirect_to @rec_event_follow, notice: 'Rec event follow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rec_event_follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rec_event_follows/1
  # DELETE /rec_event_follows/1.json
  def destroy
    @rec_event_follow.destroy
    respond_to do |format|
      format.html { redirect_to rec_event_follows_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rec_event_follow
      @rec_event_follow = RecEventFollow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rec_event_follow_params
      params.require(:rec_event_follow).permit(:recurring_event_id, :user_id)
    end
end
