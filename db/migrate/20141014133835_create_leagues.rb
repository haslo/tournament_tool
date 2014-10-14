class CreateLeagues < ActiveRecord::Migration
  def change

    create_table :leagues do |t|
      t.references :account, index: true
      t.string :title
      t.text :description
      t.string :league_url
      t.json :league_data
      t.string :type
      t.timestamps
    end

  end
end
