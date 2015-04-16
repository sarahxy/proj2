class RenameCharactersTableToCharacters < ActiveRecord::Migration
  def change
    rename_table :characters, :characters
  end
end
