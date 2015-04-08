class Boot < Listing
  validates :boot_brand, presence: true
  validates :boot_size, numericality: { greater_than: 0 }

  def self.policy_class
    ListingPolicy
  end

  def year
    self.boot_year
  end

  def brand
    self.boot_brand
  end

  def size
    self.boot_size
  end

end
