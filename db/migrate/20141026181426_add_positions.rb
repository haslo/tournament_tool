class AddPositions < ActiveRecord::Migration
  def change

    add_column :tournaments, :position, :integer
    add_column :stages, :position, :integer
    add_column :rounds, :position, :integer

  end
end
