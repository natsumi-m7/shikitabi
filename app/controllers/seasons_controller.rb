class SeasonsController < ApplicationController
  def spring
  	@spots = Spot.all
  	@spot = Spot.find(6)
  end

  def summer

  end

  def autumn

  end


  def winter

  end
end
