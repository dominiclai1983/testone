class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
