class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|

      t.string :title
      t.text :description
      t.string :admin_key

      t.datetime :tournament_start
      t.datetime :tournament_end
      t.string :signup_url

      t.timestamps

    end
  end
end
