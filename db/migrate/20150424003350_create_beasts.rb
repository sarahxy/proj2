class CreateBeasts < ActiveRecord::Migration
  def change
    create_table :beasts do |t|
      t.string :name
      t.string :type
      t.string :attribute
      t.integer :counters

      t.timestamps
    end
  end
end
