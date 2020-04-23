class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :blog
  belongs_to :user
end
