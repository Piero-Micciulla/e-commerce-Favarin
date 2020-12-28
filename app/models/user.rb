class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :shops, dependent: :destroy
  validates :given_name, presence: true, length: { minimum: 2 }
  validates :family_name, presence: true, length: { minimum: 2 }
  validates :address, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
