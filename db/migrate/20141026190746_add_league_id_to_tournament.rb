class AddLeagueIdToTournament < ActiveRecord::Migration
  def change

    add_column :tournaments, :league_id, :integer

    add_index :tournaments, :league_id
    add_index :tournaments, :position
    add_index :stages, :position
    add_index :rounds, :position

  end
end
