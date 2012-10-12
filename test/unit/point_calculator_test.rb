require 'test_helper'

class PointCalculatorTest < ActiveSupport::TestCase
  def setup
    @promotion = promotions(:one)
  end

  test "should be equal promotions points" do
    @promotion.stubs(:by_points?).returns(true) 

    @calc = PointCalculator.new(150.00, @promotion)
    assert_equal(@promotion.points, @calc.points)
  end

  test "should calculate points by value" do
    @promotion.stubs(:value => 10.0)
    @calc = PointCalculator.new(190.00,@promotion)
    assert_equal(19, @calc.points)
  end
end
