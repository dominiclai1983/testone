class AddingForeignKey < ActiveRecord::Migration[6.1]
  def change

    add_reference :order_details, :orders, foreign_key: true
    add_reference :order_details, :products, foreign_key: true
    add_reference :charges, :orders, foreign_key: true
    add_reference :orders, :users, foreign_key: true
    add_reference :sessions, :users, foreign_key: true
    add_column :orders, :payment_status, :string

  end
end
