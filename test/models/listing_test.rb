require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  test "should not save listing without title" do
    listing = Listing.new
    assert_not listing.save, "Saved listing without a title"
    assert_equal [:title], listing.errors.keys
  end

  test "should not save listing with wrong price format" do
    listing = Listing.new(title: 'Listing A', price: 'Xxx')
    assert_not listing.valid?
    assert_equal [:price], listing.errors.keys

    listing = Listing.new(title: 'Listing A', price: 'x00.23')
    assert_not listing.valid?
    assert_equal [:price], listing.errors.keys

    listing = Listing.new(title: 'Listing A', price: '20.00x')
    assert_not listing.valid?
    assert_equal [:price], listing.errors.keys
  end

  test "should not save listing with negative price" do
    listing = Listing.new(title: 'Listing A', price: -1)
    assert_not listing.valid?
    assert_equal [:price], listing.errors.keys
  end

end
