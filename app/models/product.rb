class Product < ActiveRecord::Base

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
  # validates :imagen, presence: true

  validates :name, :description, :price, :imagen, presence: true

  has_many :bids
end
