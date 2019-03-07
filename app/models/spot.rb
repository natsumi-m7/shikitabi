class Spot < ApplicationRecord
	has_many :favorites,dependent: :destroy
	has_many :comments,dependent: :destroy
	has_many :went_spots,dependent: :destroy

end
