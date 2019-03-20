class SeasonsController < ApplicationController
  def spring
  	@search = Spot.ransack(params[:q])
  	@spots = @search.result
  	# .where(season: "春")

    # @q = Spot.where(season: "春").ransack(params[:q])
    # @spots = @q.result(distinct: true)
  end

  def summer

  end

  def autumn

  end


  def winter

  end


end
