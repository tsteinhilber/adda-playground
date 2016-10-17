class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name_first, limit: 100, index: true
      t.string :name_last, limit: 100, index: true
      t.string :title, limit: 100
      t.string :email, limit: 100
      t.string :old_id
      t.string :old_parent_id
      t.string :old_address_id
      t.string :slug, limit: 200, index: true
      t.boolean :status, index: true

      t.timestamps
    end
  end
end
