class User < ApplicationRecord
		has_many :favorites,dependent: :destroy
		has_many :comments,dependent: :destroy
		has_many :went_spots,dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
