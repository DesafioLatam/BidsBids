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

end
