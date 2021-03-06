class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

 def admin?
   role == 'admin'
 end
 
 def moderator?
   role == 'moderator'
 end

 def liked?(bookmark)
 	likes.where(bookmark_id: bookmark.id).first
 end

 default_scope {order('name ASC')}
 
end
