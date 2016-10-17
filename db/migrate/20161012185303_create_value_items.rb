class CreateValueItems < ActiveRecord::Migration[5.0]
  def change
    create_table :value_items do |t|
      t.references :value_list
      t.string :name, limit: 200
      t.integer :position

      t.timestamps
    end
  end
end
