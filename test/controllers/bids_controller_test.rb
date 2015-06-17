require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test 'should create bid' do
    @user = users(:pablo)
    sign_in @user

    assert_difference('Bid.count') do
      post :create, bid: { user_id: @user, product_id: products(:one) }, product_id: products(:one)
    end

    assert_redirected_to root_path
    assert_equal 'Tu bids ha sido creado', flash[:notice]
  end

  test 'user cannot bid two consecutives times' do
    @bid = Bid.create(user: users(:gonzalo), product: products(:one))
    @bid2 = Bid.create(user: users(:gonzalo), product: products(:one))

    assert_not @bid2.valid?, 'No puedes ofertar 2 veces consecutivas'
  end

  test 'user can bid if other user bid after him' do
    @bid = Bid.create(user: users(:gonzalo), product: products(:one))
    @bid2 = Bid.create(user: users(:pablo), product: products(:one))
    @bid3 = Bid.create(user: users(:gonzalo), product: products(:one))

    assert @bid3.valid?, "user can bid if another user bid after him but: #{@bid.errors.messages}, #{@bid2.errors.messages}, #{@bid3.errors.messages}"
  end

  test 'user cannot bid after expiration time' do
    @bid = Bid.create(user: users(:gonzalo), product: products(:one), created_at: Time.zone.now)
    assert_not @bid.valid?, "Cannot bid after expiration time: #{@bid.errors.messages}"
  end

  test 'bid add 2 minutes to product expiration time' do
    @product = products(:one)
    assert_equal @product.created_at + 1.hour + 4.minutes, @product.expiration_time
  end

end
