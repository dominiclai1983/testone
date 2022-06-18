class AddReference < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_details, :order, foreign_key: true
    add_reference :order_details, :product, foreign_key: true
    add_reference :charges, :order, foreign_key: true
    add_reference :orders, :user, foreign_key: true
  end
end
