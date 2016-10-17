class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :job_number, limit: 100
      t.string :name, limit: 200
      t.boolean :active, default: true
      t.references :job_status
      t.references :category
      t.references :job_type
      t.text :description
      t.references :job_client
      t.references :job_contact
      t.references :estimate_client
      t.references :estimate_contact
      t.references :billing_client
      t.references :billing_contact

      t.timestamps
    end
    add_index :jobs, :job_number
    add_index :jobs, :active
  end
end
