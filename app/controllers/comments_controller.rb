class CommentsController < ApplicationController

  def create
    # 以下spots/showをrenderしている為の記述
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.new
    @comments = @spot.comments.all.order(created_at: :desc)
    # ここまで
    spot = Spot.find(params[:spot_id])
  	comment = current_user.comments.new(comment_params)
  	comment.spot_id = spot.id
    # 以下コメントがセーブされた際にspotのaverage_starも保存される記述
  	if comment.save
        spot.average_star = spot.comments.sum(:star).to_f / spot.comments.count
        flash[:success] = "レビューを投稿しました。"
        spot.save
        redirect_to spot_path(spot.id)
    else
       flash[:alert] = "レビューの投稿に失敗しました。"
       render "spots/show"
    end
  end

  def edit
    comment = Comment.find(params[:id])
  end

  def update
    spot = Spot.find(params[:spot_id])
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
        spot.average_star = spot.comments.sum(:star).to_f / spot.comments.count
        flash[:success] = "レビューを編集しました。"
        spot.save
        redirect_to spot_path(spot.id)
    else
       flash[:alert] = "レビューの編集に失敗しました。"
       render "spots/show"
    end
  end

  def destroy
    spot = Spot.find(params[:spot_id])
    comment = Comment.find(params[:id])
    if comment.destroy
      spot.average_star = spot.comments.sum(:star).to_f / spot.comments.count
      spot.save
    end
    redirect_to spot_path(spot.id)
  end

  private
  def comment_params
      params.require(:comment).permit(:comment, :star, :spot_id, :user_id,:comment_image)
  end
end
