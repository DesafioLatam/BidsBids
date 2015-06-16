require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:gonzalo)
  end

  test 'should have bids' do
    assert_equal [bids(:one), bids(:two)], @user.bids, 'User has many bids'
  end

  test 'should have products through bids' do
    assert_equal [products(:one), products(:two)], @user.products
  end
end
