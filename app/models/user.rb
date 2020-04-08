class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  mount_uploader :icon, IconUploader
  
  has_many :blogs, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_blogs, through: :likes, source: :blog
end
