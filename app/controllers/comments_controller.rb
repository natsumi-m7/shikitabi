class CommentsController < ApplicationController
  def index

  end


  def create
    spot = Spot.find(params[:spot_id])
  	comment = current_user.comments.new(comment_params)
  	comment.spot_id = spot.id
  	comment.save
  	redirect_to spot_path(spot.id)
  end

  def destroy
  end

  private
  def comment_params
      params.require(:comment).permit(:comment, :star, :spot_id, :user_id)
  end
end
