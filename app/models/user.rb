class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :shops, dependent: :destroy
  has_many :shops, dependent: :destroy
  validates :given_name, presence: true, length: { minimum: 2 }
  validates :family_name, presence: true, length: { minimum: 2 }
  validates :address, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def current_cart
    Cart.find_or_create_by(user: self, status: 0)
  end

  def user_confirmed_carts
    self.carts.where(status: "confirmed")
  end

  def user_upcoming_carts
    self.user_confirmed_carts.where("pick_up_date >= ?", Date.today)
  end

  def user_past_carts
    self.user_confirmed_carts.where("pick_up_date < ?",  Date.today)
  end
end
