class Shop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :products, dependent: :destroy

  def confirmed_orders
    self.products.joins(:cart).where(carts: {status: "confirmed"})
  end

  def past_confirmed_orders
    self.confirmed_orders.joins(:cart).where("carts.pick_up_date < ?" , Date.today)
  end

  def upcoming_confirmed_orders
    self.confirmed_orders.joins(:cart).where("carts.pick_up_date >= ?" , Date.today)
  end
end
