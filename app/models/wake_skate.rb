class WakeSkate < Listing
  validates :wake_skate_brand, presence: true
  validates :wake_skate_size, numericality: { greater_than: 0 }
end
