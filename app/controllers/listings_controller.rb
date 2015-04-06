class ListingsController < ApplicationController
  before_action :get_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_type
  def index
    @listings = Listing.all
  end

  def new
    @listing = type_class.new
    5.times { @listing.photos.build }
  end

  def create
    @listing = type_class.new listing_params
    @listing.seller_id = current_user.id
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def show
  end

  def edit

    (5 - @listing.photos.length).times { @listing.photos.build }
  end

  def update
    if @listing.update listing_params
      redirect_to @listing
    else
      (5 - @listing.photos.length).times { @listing.photos.build }
      render :edit
    end
  end



  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def get_listing
    @listing = type_class.find params[:id]
    # @listing = Listing.find params[:id]
  end

  def listing_params
    if type == 'WakeBoard'
      params.require(type.underscore.to_sym).permit(:title, :price, :description, :active, :sold,
        :wake_board_brand, :wake_board_size, :wake_board_year, :wake_board_material,
        photos_attributes:[:id, :image, :_destroy])
    elsif type == 'WakeSkate'
      params.require(type.underscore.to_sym).permit(:title, :price, :description, :active, :sold,
        :wake_skate_brand, :wake_skate_size, :wake_skate_year, :wake_skate_material,
        photos_attributes:[:id, :image, :_destroy])
    elsif type == 'Boot'
      params.require(type.underscore.to_sym).permit(:title, :price, :description, :active, :sold,
        :boot_brand, :boot_size, :boot_year,
        photos_attributes:[:id, :image, :_destroy])
    elsif type == 'Helmet'
      params.require(type.underscore.to_sym).permit(:title, :price, :description, :active, :sold,
        :helmet_brand, :helmet_size,
        photos_attributes:[:id, :image, :_destroy])
    elsif type == 'Package'
      params.require(type.underscore.to_sym).permit(:title, :price, :description, :active, :sold,
        :wake_board_brand, :wake_board_size, :wake_board_year, :wake_board_material, :boot_brand, :boot_size,
        photos_attributes:[:id, :image, :_destroy])
    else
      params.require(type.underscore.to_sym).permit(:title, :price, :description, :active, :sold,
        photos_attributes:[:id, :image, :_destroy])
    end

  end

   def set_type
    @type = type
  end

  def type
    Listing.types.include?(params[:type]) ? params[:type] : "Other"
  end

  def type_class
    type.constantize
  end

end
