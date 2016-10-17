class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string :name, limit: 200, index: true
      t.string :category, limit: 100
      t.string :website, limit: 150
      t.string :slug, limit: 200, index: true
      t.boolean :status, default: true, index: true
      t.string :old_id, limit: 100

      t.timestamps
    end
  end
end
