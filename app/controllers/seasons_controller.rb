class SeasonsController < ApplicationController
  def spring
  	@search = Spot.ransack(params[:q])
  	@spots = @search.result
  	# .where(season: "春")
    # @q = Spot.where(season: "春").ransack(params[:q])
    # @spots = @q.result(distinct: true)
  end

  def summer
    @search = Spot.ransack(params[:q])
    @spots = @search.result
  end

  def autumn
    @search = Spot.ransack(params[:q])
    @spots = @search.result
  end


  def winter
    @search = Spot.ransack(params[:q])
    @spots = @search.result
  end


end
