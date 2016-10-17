class ChangeJobCategoryToText < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :category_id
    add_column :jobs, :category, :string, limit: 100
  end
end
