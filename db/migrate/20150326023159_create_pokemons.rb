class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.integer :trainer_id

      t.timestamps
    end
  end
end
