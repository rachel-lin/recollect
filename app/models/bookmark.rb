class Bookmark < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic

	has_many :likes, dependent: :destroy

	default_scope { order('created_at DESC') }

    validates :name, presence: true
    validates :url, presence: true
    validates :topic, presence: true
    validates :user, presence: true
	

end
