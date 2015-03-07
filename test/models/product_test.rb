require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "should not save product without title" do
    product = Product.new
    assert_not product.save, "Saved product without a title"
    assert_equal [:title], product.errors.keys
  end

  test "should not save product with wrong price format" do
    product = Product.new(title: 'Product A', price: 'Xxx')
    assert_not product.valid?
    assert_equal [:price], product.errors.keys

    product = Product.new(title: 'Product A', price: 'x00.23')
    assert_not product.valid?
    assert_equal [:price], product.errors.keys

    product = Product.new(title: 'Product A', price: '20.00x')
    assert_not product.valid?
    assert_equal [:price], product.errors.keys
  end

  test "should not save product with negative price" do
    product = Product.new(title: 'Product A', price: -1)
    assert_not product.valid?
    assert_equal [:price], product.errors.keys
  end

end
