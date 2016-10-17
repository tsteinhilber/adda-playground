class AddIndexToArtistSlug < ActiveRecord::Migration[5.0]
  def change
    add_index :artists, :slug
  end
end
