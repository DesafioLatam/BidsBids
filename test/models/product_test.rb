require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  setup do
    # @product = Product.new
    # @product.name = 'Nombre del Producto'
    # @product.description = 'Descripcion del producto'
    # @product.price = 19.99
    # @product.imagen = 'images/product.jpg'

    @product = products(:one)
  end

  test 'should have name' do
    @product.name = nil
    assert_not @product.valid?, 'Product name cannot be nil or empty'
  end

  test 'should have description' do
    @product.description = nil
    assert_not @product.valid?, 'Product description cannot be nil or empty'
  end

  test 'should have price' do
    @product.price = nil
    assert_not @product.valid?, 'Product price cannot be nil or empty'
  end

  test 'should have image' do
    @product.imagen = nil
    assert_not @product.valid?, 'Product image cannot be nil or empty'
  end

  test 'should have bids' do
    assert_equal [bids(:one), bids(:three)], @product.bids, 'Products has many bids'
  end

end
