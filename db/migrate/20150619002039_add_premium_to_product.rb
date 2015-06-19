class AddPremiumToProduct < ActiveRecord::Migration
  def change
    add_column :products, :premium, :boolean
  end
end
