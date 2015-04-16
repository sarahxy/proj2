class RenameTrainersTableToPlayers < ActiveRecord::Migration
  def change
    rename_table :trainers, :players
  end
end
