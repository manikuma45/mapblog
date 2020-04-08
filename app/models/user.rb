class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  mount_uploader :icon, IconUploader
  
  has_many :blogs, dependent: :destroy
end
