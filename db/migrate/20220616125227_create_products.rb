class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :sku
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
