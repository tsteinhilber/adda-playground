class AddCompanyRefToTeams < ActiveRecord::Migration[5.0]
  def change
    add_reference :teams, :company, foreign_key: true
  end
end
