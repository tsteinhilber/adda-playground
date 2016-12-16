class AddArtistIdToJob < ActiveRecord::Migration[5.0]
  def change
  add_reference(:jobs, :artist)
  end
end
