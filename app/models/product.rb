class Product < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 64 }
  validates :description, presence: true, length: { minimum: 8, maximum: 64 }
  validates :sku, presence: true, length: { minimum: 5, maximum: 500 }
  validates :price,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0
            },
            format: {
              with: /\A\d{1,3}(\.\d{1,2})?\z/
            }

  t.string :title
  t.string :description
  t.string :sku
  t.decimal :price
  t.integer :quantity
end
