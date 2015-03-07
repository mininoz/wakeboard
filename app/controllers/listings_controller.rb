class ListingsController < ApplicationController
  before_action :get_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_type
  def index
    @listings = Listing.all
  end

  def new
    @listing = type_class.new
  end

  def create
    @listing = type_class.new listing_params
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update listing_params
      redirect_to @listing
    else
      render :edit
    end
  end



  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def get_listing
    @listing = Listing.find params[:id]
  end

  def listing_params

    params.require(type.underscore.to_sym).permit(:title, :price, :description, :active, :sold,
        :wake_board_brand, :wake_board_size, :wake_board_year, :wake_board_material )
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
