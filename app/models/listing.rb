class Listing < ActiveRecord::Base
  scope :wake_boards, -> { where(type: 'WakeBoard') }
  belongs_to :seller, class_name: :User
  has_many :photos
  accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes['image'].blank? }

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}
  validates :seller_id, presence: true

  def self.types
    %w[WakeBoard WakeSkate Package Boot Helmet]
  end
end
