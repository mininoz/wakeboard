class Product < ActiveRecord::Base
  belongs_to :seller
  belongs_to :productable, polymorphic: true

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}
end
