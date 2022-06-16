class ChangeFieldNameInUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :usernamet
    add_column :users, :username, :string
  end
end
