class SpotsController < ApplicationController
  def top
    @spots = Spot.all
    @spot1 = Spot.find(3)
    @spot2 = Spot.find(4)

  end

  def result

  end

  def show
    @spot = Spot.find(params[:id])
    @comment = Comment.new
    @comments = @spot.comments.all.order(created_at: :desc)
  end

  # GET /spots/1/edit
  def edit
    @spot = Spot.find(params[:id])
  end

  # POST /spots
  def create
    @search = Spot.ransack(params[:q])
    @search_user = User.ransack(params[:q])
    @spots = @search.result.page(params[:spot_page]).per(6)
    @users = @search_user.result.page(params[:user_page]).per(8)
    @spot = Spot.new(spot_params)

    if @spot.save
      flash[:success] = "スポットを追加しました。"
      redirect_to users_path
    else
      flash[:alert] = "スポットの追加に失敗しました。"
      render "users/index"
    end
  end

  # PATCH/PUT /spots/1
  def update
    @spot = Spot.find(params[:id])
    @spots = Spot.page(params[:spot_page]).per(6)
    @users = User.page(params[:user_page]).per(8)
    if @spot.update(spot_params)
      flash[:success] = "スポットを編集しました。"
      redirect_to users_path
    else
      flash[:alert] = "スポットの編集に失敗しました。"
      render "users/index"
    end
  end

  # DELETE /spots/1
  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def spot_params
      params.require(:spot).permit(:images, :spot_name, :description, :season, :prefecture, :spot_address, :latitude, :longitude, :average_star)
    end
end
