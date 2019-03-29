class UsersController < ApplicationController
  before_action :admin_validate!, only: [:index]
  before_action :correct_user, only: [:show]
  before_action :create_user, only: [:update]
  def index
    @spots = Spot.page(params[:spot_page]).per(6)
    @users = User.page(params[:user_page]).per(8)
    @spot = Spot.new
  end

  def show
    @user = User.find(params[:id])
    @user_followers = @user.followers
    @user_followings = @user.followings
    @comments = @user.comments.page(params[:page])
    @favorites = current_user.favorite_spots.order(id: "desc")
  end
  def follows
    user = User.find(params[:id])
  end

  def followers
    user = User.find(params[:id])
    @user_followers = user.followers111
  end
  def edit

  end

  def update
    @user = User.find(params[:id])
    @user_followers = @user.followers
    @user_followings = @user.followings
    @comments = @user.comments.page(params[:page])
    @favorites = current_user.favorite_spots.order(id: "desc")
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を編集しました。"
      sign_in(@user, bypass: true) if current_user.id == @user.id
      #　パスワードを編集すると、deviseの特性上自動的にログアウトしてしまうので、それを防ぐ為の記述。
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "ユーザー情報の編集に失敗しました。"
      render "show"
    end

  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:lastname,:firstname,:lastname_kana,:firstname_kana,:nickname,:postal,:address,:user_image,:email,:password,:password_confirmation,:user_image,:introduction)
  end
  def admin_validate!
    if user_signed_in? && current_user.admin?
    else
      redirect_to root_path
    end
  end
  def correct_user
    if user_signed_in?
    else
      redirect_to root_path
    end
  end
  def create_user
    user = User.find(params[:id])
    if user_signed_in? && current_user = user
    else
      redirect_to root_path
    end
  end

end
