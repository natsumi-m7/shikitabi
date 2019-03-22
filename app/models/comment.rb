class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :spot
	mount_uploader :comment_image,ImagesUploader
end
