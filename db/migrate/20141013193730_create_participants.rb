class CreateParticipants < ActiveRecord::Migration
  def change

    create_table :participants do |t|
      t.references :tournament, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :participant_data
      t.timestamps
    end

    add_column :tournaments, :account_id, :integer
    add_index :tournaments, :account_id

  end
end
