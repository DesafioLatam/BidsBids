class Product < ActiveRecord::Base

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
  # validates :imagen, presence: true

  validates :name, :description, :price, :imagen, presence: true

  has_many :bids
  has_many :users, through: :bids

  scope :premium, -> {where(premium: true)}

  scope :ofertados, -> { joins(:bids) }

  def expiration_time
    self.created_at + 1.hour + self.bids.count * 2.minutes
  end

end
