class AddIndexToClientSlug < ActiveRecord::Migration[5.0]
  def change
    add_index :clients, :slug
  end
end
