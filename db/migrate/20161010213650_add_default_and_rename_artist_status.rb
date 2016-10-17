class AddDefaultAndRenameArtistStatus < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :status, :boolean
    add_column :artists, :active, :boolean, default: true
  end
end
