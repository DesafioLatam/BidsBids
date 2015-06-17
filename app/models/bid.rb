class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validate :consecutive, :product_expired, on: :create

  def consecutive
    return if self.product.nil?
    return if self.product.bids.empty?

    if self.user_id == self.product.bids.last.user_id
      errors.add(:consecutive, 'Cannot bid twice in a row')
    end
  end

  def product_expired
    return if self.product.nil?
    self.created_at ||= Time.zone.now # fix for time before save

    if self.created_at >= self.product.expiration_time
      errors.add(:expired, 'cannot bid if expired')
    end
  end

end
