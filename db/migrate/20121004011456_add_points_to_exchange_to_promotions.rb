class AddPointsToExchangeToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :points_to_exchange, :integer
  end
end
