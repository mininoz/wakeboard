class Listing < ActiveRecord::Base
  scope :wake_boards, -> { where(type: 'WakeBoard') }
  belongs_to :seller

  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}

  def self.types
    %w[WakeBoard Boot]
  end
end
