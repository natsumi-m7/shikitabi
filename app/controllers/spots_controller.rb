class SpotsController < ApplicationController
  def top
    @spots = Spot.all

  end

  def result

  end

  def show
    @spot = Spot.find(params[:id])
    @comment = Comment.new
    @comments = @spot.comments.all
  end

  # GET /spots/new
  def new
    @spot = Spot.new
  end

  # GET /spots/1/edit
  def edit
  end

  # POST /spots
  def create
    @spot = Spot.new(spot_params)

    if @spot.save
      redirect_to spots_new_path, notice: 'Spot was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /spots/1
  def update
    if @spot.update(spot_params)
      redirect_to @spot, notice: 'Spot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /spots/1
  def destroy
    @spot.destroy
    redirect_to spots_url, notice: 'Spot was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def spot_params
      params.require(:spot).permit(:images, :spot_name, :description, :season, :prefecture, :spot_address, :latitude, :longitude, :average_star)
    end
end
