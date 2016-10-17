class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :lead, default: false

      t.timestamps
    end
    add_index :memberships, :lead
  end
end
