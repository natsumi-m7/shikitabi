class FavoritesController < ApplicationController
	def create
		spot = Spot.find(params[:spot_id])
		favorite = current_user.favorites.new(spot_id:spot.id)
		if favorite.save
			flash[:success]="お気に入りに追加しました。"
		end
		redirect_to spot_path(spot)
	end

	def destroy
		spot = Spot.find(params[:spot_id])
		favorite = current_user.favorites.find_by(spot_id:spot.id)
		if favorite.destroy
			flash[:success]="お気に入りを削除しました。"
		end
		redirect_to spot_path(spot)
	end
end
