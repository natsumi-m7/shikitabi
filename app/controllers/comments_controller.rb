class CommentsController < ApplicationController
  def index

  end


  def create
    spot = Spot.find(params[:spot_id])
  	comment = current_user.comments.new(comment_params)
  	comment.spot_id = spot.id
  	if comment.save
        # puts "--------------"
        # puts spot.comments.sum(:star)
        # puts "--------------"
        puts "--------------"
        puts spot.average_star
        puts "--------------"
        spot.average_star = spot.comments.sum(:star).to_f / spot.comments.count
        spot.save
    end
  	redirect_to spot_path(spot.id)
  end

  def destroy
  end

  private
  def comment_params
      params.require(:comment).permit(:comment, :star, :spot_id, :user_id)
  end
end
