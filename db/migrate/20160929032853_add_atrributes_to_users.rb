class AddAtrributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :name_first, :string, limit: 100
    add_column :users, :name_last, :string, limit: 100
    add_column :users, :rep, :boolean
    add_column :users, :status, :boolean, default: true
    add_index :users, :rep
    add_index :users, :status
  end
end
