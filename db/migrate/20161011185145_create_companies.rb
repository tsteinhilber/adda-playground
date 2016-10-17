class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :account_number, limit: 100
      t.string :name, limit: 200
      t.string :name_legal, limit: 200
      t.string :old_id, limit: 100
      t.string :tax_id, limit: 100
      t.string :website, limit: 200
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
