class AddSlugToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :slug, :string, limit: 110
  end
end
