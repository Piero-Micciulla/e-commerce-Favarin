class Product < ApplicationRecord
  belongs_to :shop
  validates :name, presence: true
  has_one_attached :photo
end
