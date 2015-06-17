class Topic < ActiveRecord::Base
	belongs_to :user
	has_many :bookmarks


    validates :name, presence: true
    validates :description, presence: true
    validates :user, presence: false
end
