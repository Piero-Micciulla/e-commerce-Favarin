class Cart < ApplicationRecord
  belongs_to :user
  enum status: [:pending, :confirmed]
  validates :pick_up_date, presence: true, if: :confirmed?

  def pick_up_date_cannot_be_in_the_past
    if pick_up_date.present? && pick_up_date < Date.today
      errors.add(:pick_up_date, 'pick up date can’t be in the past')
    end
  end

  def calculate_price
    sum = 0
    self.products.each do |product|
      item_sum = product.price
      sum += item_sum
    end
    return sum.round(2)
  end

end
