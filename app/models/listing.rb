class Listing < ActiveRecord::Base
  scope :wake_boards, -> { where(type: 'WakeBoard') }
  belongs_to :seller, class_name: :User
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: proc { |attributes| attributes['image'].blank? } , allow_destroy: true

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}
  validates :seller_id, presence: true
  validates :photos, length: { maximum: 5, too_long: "The Photo could not be uplead more than 5 images." }
  # validate :maximum_photos

  def self.types
    %w[WakeBoard WakeSkate Package Boot Helmet]
  end

  def year
  end

  def brand
  end

  # private
  # def maximum_photos
  #   errors.add(:base, "You must provide at least two options") if photos.length > 3
  # end
end
