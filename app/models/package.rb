class Package < Listing
  validates :wake_board_brand, presence: true
  validates :wake_board_size, numericality: { greater_than: 0 }
  validates :boot_brand, presence: true
  validates :boot_size, numericality: { greater_than: 0 }

end
