class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :edit, :update, :destroy]
  # before_action :set_productable
  def index
    @products = Product.all
  end

  def new
    get_productable
    @productable = @klass.new
    @productable.build_product
  end

  def create
    @product = Product.new product_params
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def show
  end

  def update
    if @product.update product_params
      redirect_to @product
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def get_product
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit(:title, :price, :description, :active, :sold,
        board_attribures: [:id, :size, :year, :material]
      )
  end

  def set_productable
    klass = [Board].detect { |c| params[:type]}
    @proudctable = klass.new
  end

  def get_productable
    @klass = params[:type].singularize.classify.constantize
  end
end
