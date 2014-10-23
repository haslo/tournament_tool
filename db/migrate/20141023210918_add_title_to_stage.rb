class AddTitleToStage < ActiveRecord::Migration
  def change

    add_column :stages, :title, :string

  end
end
