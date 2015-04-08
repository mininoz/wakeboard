class Helmet < Listing
  validates :helmet_brand, presence: true
  validates :helmet_size, numericality: { greater_than: 0 }

  def self.policy_class
    ListingPolicy
  end

  def brand
    self.helmet_brand
  end

  def size
    self.helmet_size
  end

end
