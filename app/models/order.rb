class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  has_many :charges
  has_many :rpdoucts, through: :order_details

  validates :order_date, presence: true
  validates :status, presence: true
  validates :recipient_name, presence: true, length: { maximum: 120 }
  validates :shipping_address_1, presence: true, length: { maximum: 250 }
  validates :postal_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true, length: { maximum: 25 }
  validates :payment_status, presence: true
  validates :user, presence: true
end
