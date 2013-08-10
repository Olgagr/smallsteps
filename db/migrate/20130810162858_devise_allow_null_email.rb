class DeviseAllowNullEmail < ActiveRecord::Migration
  def change
    remove_index :users, :email
    change_column :users, :email, :string, null: true
  end
end
