class RelationsController < ApplicationController
  def create
    follow = current_user.active_relations.build(follower_id: params[:user_id])
    if follow.save
      flash[:success]="フォローしました。"
    end
    redirect_to user_path(params[:user_id])
  end

  def destroy
    follow = current_user.active_relations.find_by(follower_id: params[:user_id])
    if follow.destroy
      flash[:success]="フォローを外しました。"
    end
    redirect_to user_path(params[:user_id])
  end
end
