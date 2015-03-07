class Board < ActiveRecord::Base
  has_one :product, as: :productable, dependent: :destroy
  accepts_nested_attributes_for :product
end
