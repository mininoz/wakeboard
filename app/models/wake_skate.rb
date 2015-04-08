class WakeSkate < Listing
  validates :wake_skate_brand, presence: true
  validates :wake_skate_size, numericality: { greater_than: 0 }

  def self.policy_class
    ListingPolicy
  end

  def year
    self.wake_skate_year
  end

  def brand
    self.wake_skate_brand
  end

  def size
    self.wake_skate_size
  end

end
