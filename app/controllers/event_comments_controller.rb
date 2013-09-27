class EventCommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_comment = @event.event_comments.new(event_comment_params)
    @event_comment.user_id = current_user.id
    @event_comment.event_id = @event.id
    
    respond_to do |format|
      if @event_comment.comment && @event_comment.comment != ""
        if @event_comment.save   
          format.js 
          format.html { redirect_to @event, notice: 'Comment added.' }
          format.json { render action: 'show', status: :created, location: @event }
        else
          format.js
          format.html { render action: 'show' }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end  
    end 
    
    
  end
 
  private
  def event_comment_params
    params.require(:event_comment).permit(:comment)
  end

end
