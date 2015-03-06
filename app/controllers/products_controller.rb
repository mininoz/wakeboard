class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
    @product = Product.new
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
    params.require(:product).permit(:title, :price, :description, :active, :sold)
  end
end
