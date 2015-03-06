class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, default: 0
      t.text :description
      t.boolean :active, default: true
      t.boolean :sold, default: false
      t.references :seller, index: true
      t.references :productable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :sellers
  end
end
