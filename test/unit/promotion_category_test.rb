require 'test_helper'

class PromotionCategoryTest < ActiveSupport::TestCase

  def setup
    @by_value = promotion_categories(:value)
    @by_points = promotion_categories(:points)
  end

  test "should return points category" do
    @promotion_category = PromotionCategory.by_points
    assert_equal("points", @promotion_category.name)
  end

  test "should return value category" do
    @promotion_category = PromotionCategory.by_value
    assert_equal("value", @promotion_category.name)
  end
end
