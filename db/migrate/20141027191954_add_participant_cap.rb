class AddParticipantCap < ActiveRecord::Migration
  def change

    add_column :stages, :maximum_number_of_participants, :integer

  end
end
