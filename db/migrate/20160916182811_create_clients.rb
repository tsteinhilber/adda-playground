class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 100, index: true
      t.string :category, limit: 50
      t.string :website, limit: 100
      t.boolean :status, index: true
      t.string :created_user
      t.string :updated_user
      t.string :old_id

      t.timestamps
    end
  end
end
