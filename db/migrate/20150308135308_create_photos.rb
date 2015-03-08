class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :listing, index: true
      t.attachment :image

      t.timestamps null: false
    end
    add_foreign_key :photos, :listings
  end
end
