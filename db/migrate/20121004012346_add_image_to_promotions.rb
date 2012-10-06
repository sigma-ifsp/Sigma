class AddImageToPromotions < ActiveRecord::Migration
  def change
    add_attachment :promotions, :image
  end
end
