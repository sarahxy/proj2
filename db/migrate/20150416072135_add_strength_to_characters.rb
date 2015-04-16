class AddStrengthToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :strength, :integer
    add_column :characters, :magic, :integer
    add_column :characters, :experience, :integer
  end
end
