class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.decimal :price, default: 0
      t.text :description

      # Board
      t.string :wake_board_brand
      t.integer :wake_board_size
      t.string :wake_board_material
      t.integer :wake_board__year

      #boot
      t.string :boot_brand
      t.integer :boot_size

      #skate
      t.string :wake_skate_brand
      t.integer :wake_skate_size
      t.string :wake_board_material
      t.integer :wake_board_year

      #Helmet
      t.string :helmet_brand
      t.string :helmet_size

      #vest
      t.string :vest_brand
      t.string :vest_size

      #other

      t.boolean :active, default: true
      t.boolean :sold, default: false
      t.references :seller, index: true
      t.string :type
      # t.references :listable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :listings, :sellers
  end
end
