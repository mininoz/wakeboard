class WakeBoard < Listing
  validates :wake_board_brand, presence: true
  validates :wake_board_size, numericality: { greater_than: 0 }


  def year
    self.wake_board_year
  end

  def brand
    self.wake_board_brand
  end

  def size
    self.wake_board_size
  end

end
