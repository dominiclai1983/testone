class RemoveReference < ActiveRecord::Migration[6.1]
  def change
    remove_reference :order_details, :orders, foreign_key: true
    remove_reference :order_details, :products, foreign_key: true
    remove_reference :charges, :orders, foreign_key: true
    remove_reference :orders, :users, foreign_key: true
  end
end
