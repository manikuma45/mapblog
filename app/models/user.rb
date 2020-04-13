class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  mount_uploader :icon, IconUploader
  
  has_many :blogs, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_blogs, through: :likes, source: :blog

  has_many :active_relationships, foreign_key: 'follower_id', 
                                  class_name: 'Relationship', 
                                  dependent: :destroy

  has_many :passive_relationships, foreign_key: 'followed_id', 
                                   class_name: 'Relationship', 
                                   dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :followers, through: :passive_relationships, source: :follower

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
