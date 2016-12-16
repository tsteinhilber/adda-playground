class CreateLegals < ActiveRecord::Migration[5.0]
  def change
    create_table :legals do |t|
      t.string :title, limit: 100, index: true
      t.text :content
      t.references :company
      t.boolean :active, default: true, index: true

      t.timestamps
    end
  end
end
