class AddSlugToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :slug, :string, limit: 110
  end
end
