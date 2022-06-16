class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.datetime :order_date
      t.datetime :shipping_date
      t.string :status
      t.string :recipient_name
      t.string :shipping_address_1
      t.string :shipping_address_2
      t.string :postal_code
      t.string :city
      t.string :country
      t.string :phone_number

      t.timestamps
    end
  end
end
