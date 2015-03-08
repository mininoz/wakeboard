class Listing < ActiveRecord::Base
  scope :wake_boards, -> { where(type: 'WakeBoard') }
  belongs_to :seller, class_name: :User


  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}
  validates :selling_id, presence: true

  def self.types
    %w[WakeBoard WakeSkate Package]
  end
end
