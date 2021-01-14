class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  validates :shop, presence: true
  validates :content, presence: true
end
