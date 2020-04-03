class Blog < ApplicationRecord
  validates :content, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
end
