class OrderDetail < ApplicationRecord
  validates :order, presence: true
  validates :product, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true }
end
