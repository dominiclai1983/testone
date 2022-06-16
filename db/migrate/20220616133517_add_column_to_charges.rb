class AddColumnToCharges < ActiveRecord::Migration[6.1]
  def change
    add_column :charges, :checkout_session_id, :string
    add_column :charges, :currency, :string
    add_column :charges, :amount, :decimal
    add_column :charges, :complete, :boolean
  end
end
