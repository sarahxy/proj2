class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :characters, :trainer_id, :player_id
  end
end
