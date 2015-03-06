require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template partial: "_form"
  end

  test "should show product" do
    @product = products(:one)
    get :show, id: @product.id
    assert_response :success
    assert_equal @product, assigns(:product)
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: {title: 'Product A', price: 20.00}
    end
    assert_redirected_to product_path(assigns(:product))
  end

  test "should render new on create product fail" do
    assert_no_difference('Product.count') do
      post :create, product: {title: nil}
    end
    assert_template :new
  end

  test "should edit product" do
    @product = products(:one)
    get :edit, id: @product.id
    assert_response :success
    assert_equal @product, assigns(:product)
    assert_template partial: "_form"
  end

  test "should update product title" do
    @product = products(:one)
    put :update, id: @product.id, product: { title: 'new title' }
    assert_equal 'new title', assigns(:product).title
    assert_redirected_to product_path(assigns(:product))
  end

  test "should render edit on update product fail" do
    @product = products(:one)
    put :update, id: @product.id, product: { title: nil }
    assert_template :edit
  end


  test "should delete a product" do
    @product = products(:one)
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product.id
    end

    assert_redirected_to products_path

  end
end
