class AddPromotionCategoryIdToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :promotion_category_id, :integer
	add_index :promotions, :promotion_category_id
  end
end
