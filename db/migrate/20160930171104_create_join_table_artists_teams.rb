class CreateJoinTableArtistsTeams < ActiveRecord::Migration[5.0]
  def change
    create_join_table :artists, :teams do |t|
      t.index [:artist_id, :team_id]
      t.index [:team_id, :artist_id]
    end
  end
end
