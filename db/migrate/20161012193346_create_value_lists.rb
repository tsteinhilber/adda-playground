class CreateValueLists < ActiveRecord::Migration[5.0]
  def change
    create_table :value_lists do |t|
      t.string :name, limit: 200
      t.integer :value_items_count

      t.timestamps
    end
  end
end
