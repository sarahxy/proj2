class AddHealthToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :health, :integer
  end
end
