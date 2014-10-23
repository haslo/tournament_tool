class RenameJsonDataFields < ActiveRecord::Migration
  def change

    rename_column :leagues, :league_data, :json_data
    rename_column :pairings, :pairing_data, :json_data
    rename_column :participants, :participant_data, :json_data
    rename_column :rounds, :round_data, :json_data
    rename_column :stages, :stage_data, :json_data
    rename_column :tournaments, :tournament_data, :json_data

    remove_column :pairings, :participant_1_data, :json
    remove_column :pairings, :participant_2_data, :json

  end
end
