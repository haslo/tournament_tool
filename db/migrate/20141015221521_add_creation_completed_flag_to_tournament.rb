class AddCreationCompletedFlagToTournament < ActiveRecord::Migration
  def change

    add_column :tournaments, :creation_completed, :boolean, default: false, null: false

  end
end
