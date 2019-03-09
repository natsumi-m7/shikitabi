class SeasonsController < ApplicationController
  def spring
  	@spots = Spot.where(season: "春")

  end

  def summer

  end

  def autumn

  end


  def winter

  end
end
