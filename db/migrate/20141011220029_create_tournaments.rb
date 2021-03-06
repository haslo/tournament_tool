class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|

      t.string :title
      t.text :description
      t.string :show_key
      t.string :admin_key

      t.datetime :tournament_start
      t.datetime :tournament_end
      t.string :signup_url
      t.string :creator_mail

      t.timestamps

    end
  end
end
