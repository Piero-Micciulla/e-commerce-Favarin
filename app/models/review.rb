class Review < ApplicationRecord
  belongs_to :shop, touch: true
  belongs_to :user

  validates :shop, presence: true
  validates :content, presence: true
end
