class AddBreaksToStages < ActiveRecord::Migration
  def change

    add_column :stages, :minutes_per_break, :integer

  end
end
