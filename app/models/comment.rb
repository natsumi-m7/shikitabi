class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :spot
	mount_uploader :comment_image,ImagesUploader
	validates :comment,presence: true,length: {minimum:4,maximum:90}
end
