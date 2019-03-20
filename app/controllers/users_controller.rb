class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
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
    redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:lastname,:firstname,:lastname_kana,:firstname_kana,:nickname,:postal,:address,:user_image,:email,:password,:password_confirmation,:user_image)
  end

end
