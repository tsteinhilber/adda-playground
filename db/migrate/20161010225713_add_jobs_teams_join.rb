class AddJobsTeamsJoin < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jobs, :teams
  end
end
