class Topic < ActiveRecord::Base
	belongs_to :user
	has_many :bookmarks

	mount_uploader :thumbnail, ThumbnailUploader

	default_scope { order('created_at DESC') }
    validates :name, presence: true
    validates :user, presence: false
end
