class AddBootYearToListing < ActiveRecord::Migration
  def change
    add_column :listings, :boot_year, :integer
  end
end
