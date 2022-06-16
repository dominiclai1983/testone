class CreateCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :charges do |t|
      t.string :checkout_session_id
      t.string :currency
      t.decimal :amount, precision: 10, scale: 2
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
