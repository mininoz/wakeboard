class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :size
      t.integer :year
      t.text :material

      t.timestamps null: false
    end
  end
end
