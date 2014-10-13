class CreateRounds < ActiveRecord::Migration
  def change

    remove_column :tournaments, :creator_mail, :string
    add_column :tournaments, :doors_open_time, :datetime
    add_column :tournaments, :tournament_data, :json
    add_column :tournaments, :type, :string

    remove_column :participants, :participant_data, :string
    add_column :participants, :participant_data, :json

    create_table :stages do |t|
      t.references :tournaments, index: true
      t.datetime :stage_start
      t.datetime :stage_end
      t.datetime :doors_open_time
      t.integer :number_of_rounds
      t.integer :minutes_per_round
      t.string :type
      t.json :stage_data
      t.timestamps
    end

    create_table :rounds do |t|
      t.references :stages, index: true
      t.datetime :round_start_override
      t.datetime :round_end_override
      t.boolean :has_started, default: false, null: false
      t.boolean :has_ended, default: false, null: false
      t.json :round_data
      t.timestamps
    end

    create_table :pairings do |t|
      t.references :rounds
      t.integer :participant_1_id
      t.integer :participant_2_id
      t.string :result
      t.json :participant_1_data
      t.json :participant_2_data
      t.json :pairing_data
      t.timestamps
    end

    add_index :pairings, :participant_1_id
    add_index :pairings, :participant_2_id

  end
end
