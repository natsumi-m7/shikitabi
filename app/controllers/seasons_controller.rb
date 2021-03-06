class SeasonsController < ApplicationController
  def spring
  	@search = Spot.ransack(params[:q])
  	@spots = @search.result.where(season: "春").order(created_at: :desc)
  end

  def summer
    @search = Spot.ransack(params[:q])
    @spots = @search.result.where(season: "夏").order(created_at: :desc)
  end

  def autumn
    @search = Spot.ransack(params[:q])
    @spots = @search.result.where(season: "秋").order(created_at: :desc)
  end

  def winter
    @search = Spot.ransack(params[:q])
    @spots = @search.result.where(season: "冬").order(created_at: :desc)
  end


end
