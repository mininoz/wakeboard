class ListingsController < ApplicationController
  before_action :get_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  after_action :verify_authorized


  def index

    @listings = Listing.where("1=1")

    authorize :listing

    @listings = @listings.where('title like ?', "%#{params[:title]}%") if params[:title].present?
    @listings = @listings.where('price >= ?', params[:price_from]) if params[:price_from].present?
    @listings = @listings.where('price <= ?', params[:price_to]) if params[:price_to].present?

    if type == 'WakeBoard'
      @listings = @listings.where(type: type)
      @listings = @listings.where(wake_board_year: params[:board_year]) if params[:board_year].present?
      @listings = @listings.where(wake_board_brand: params[:board_brand]) if params[:board_brand].present?
      @listings = @listings.where('wake_board_size >= ?', params[:board_size_from]) if params[:board_size_from].present?
      @listings = @listings.where('wake_board_size <= ?', params[:board_size_to]) if params[:board_size_to].present?
    elsif type == 'WakeSkate'
      @listings = @listings.where(type: type)
      @listings = @listings.where(wake_skate_year: params[:board_year]) if params[:board_year].present?
      @listings = @listings.where(wake_skate_brand: params[:board_brand]) if params[:board_brand].present?
      @listings = @listings.where('wake_skate_size >= ?', params[:board_size_from]) if params[:board_size_from].present?
      @listings = @listings.where('wake_skate_size <= ?', params[:board_size_to]) if params[:board_size_to].present?
    elsif type == 'Boot'
      @listings = @listings.where(type: type)
      @listings = @listings.where(boot_year: params[:boot_year]) if params[:boot_year].present?
      @listings = @listings.where(boot_brand: params[:boot_brand]) if params[:boot_brand].present?
      @listings = @listings.where('boot_size >= ?', params[:boot_size_from]) if params[:boot_size_from].present?
      @listings = @listings.where('boot_size <= ?', params[:boot_size_to]) if params[:boot_size_to].present?
    elsif type == 'Package'
      @listings = @listings.where(type: type)
      @listings = @listings.where(wake_board_year: params[:board_year]) if params[:board_year].present?
      @listings = @listings.where(wake_board_brand: params[:board_brand]) if params[:board_brand].present?
      @listings = @listings.where('wake_board_size >= ?', params[:board_size_from]) if params[:board_size_from].present?
      @listings = @listings.where('wake_board_size <= ?', params[:board_size_to]) if params[:board_size_to].present?
      @listings = @listings.where(boot_year: params[:boot_year]) if params[:boot_year].present?
      @listings = @listings.where(boot_brand: params[:boot_brand]) if params[:boot_brand].present?
      @listings = @listings.where('boot_size >= ?', params[:boot_size_from]) if params[:boot_size_from].present?
      @listings = @listings.where('boot_size <= ?', params[:boot_size_to]) if params[:boot_size_to].present?
    elsif type == 'Helmet'
      @listings = @listings.where(type: type)
      @listings = @listings.where(helmet_brand: params[:helmet_brand]) if params[:helmet_brand].present?
      @listings = @listings.where(helmet_size: params[:helmet_size]) if params[:helmet_size].present?
    end


  end

  def new
    @listing = type_class.new

    authorize :listing

    5.times { @listing.photos.build }
  end

  def create
    @listing = type_class.new listing_params

    authorize @listing

    @listing.seller_id = current_user.id
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def show
    authorize @listing
  end

  def edit
    authorize @listing
    (5 - @listing.photos.length).times { @listing.photos.build }
  end

  def update
    authorize @listing
    if @listing.update listing_params
      redirect_to @listing
    else
      (5 - @listing.photos.length).times { @listing.photos.build }
      render :edit
    end
  end

  def destroy
    authorize @listing
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
        :wake_board_brand, :wake_board_size, :wake_board_year, :wake_board_material,:boot_year, :boot_brand, :boot_size,
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
