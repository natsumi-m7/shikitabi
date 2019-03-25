class UsersController < ApplicationController
  def index
    @spots = Spot.all
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

  def new
  end

  def edit
    @user = current_user
  end

  def create
  end

  def update
    @user = current_user
    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      #　パスワードを編集すると、deviseの特性上自動的にログアウトしてしまうので、それを防ぐ為の記述。
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:lastname,:firstname,:lastname_kana,:firstname_kana,:nickname,:postal,:address,:user_image,:email,:password,:password_confirmation,:user_image,:introduction)
  end

end
