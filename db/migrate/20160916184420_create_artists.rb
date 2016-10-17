class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name_first, limit: 50, index: true
      t.string :name_last, limit: 50, index: true
      t.string :email, limit: 75
      t.string :website, limit: 100
      t.string :category, limit: 50
      t.boolean :status, index: true
      t.date :date_start
      t.string :created_user
      t.string :updated_user
      t.string :old_id

      t.timestamps
    end
  end
end
