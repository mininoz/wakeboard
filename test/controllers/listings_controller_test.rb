require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new, type: 'Board'
    assert_response :success
    assert_template partial: "_form"
  end

  test "should redirect to listing home if no type passed" do
    get :new
    assert_response :redirect
  end

  test "should show listing" do
    @listing = listings(:one)
    get :show, id: @listing.id
    assert_response :success
    assert_equal @listing, assigns(:listing)
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post :create, listing: {title: 'listing A', price: 20.00}
    end
    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should render new on create listing fail" do
    assert_no_difference('Listing.count') do
      post :create, listing: {title: nil}
    end
    assert_template :new
  end

  test "should edit listing" do
    @listing = listings(:one)
    get :edit, id: @listing.id
    assert_response :success
    assert_equal @listing, assigns(:listing)
    assert_template partial: "_form"
  end

  test "should update listing title" do
    @listing = listings(:one)
    put :update, id: @listing.id, listing: { title: 'new title' }
    assert_equal 'new title', assigns(:listing).title
    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should render edit on update listing fail" do
    @listing = listings(:one)
    put :update, id: @listing.id, listing: { title: nil }
    assert_template :edit
  end


  test "should delete a listing" do
    @listing = listings(:one)
    assert_difference('Listing.count', -1) do
      delete :destroy, id: @listing.id
    end

    assert_redirected_to listings_path

  end
end
