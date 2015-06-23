class Topic < ActiveRecord::Base
	belongs_to :user
	has_many :bookmarks

	mount_uploader :thumbnail, ThumbnailUploader


    validates :name, presence: true
    validates :user, presence: false
end
