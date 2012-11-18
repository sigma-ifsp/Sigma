require 'test_helper'

class ClientBalanceTest < ActiveSupport::TestCase
  setup do 
  	@balance = ClientBalance.new
  	@promotion = Promotion.new(:points_to_exchange => 100)
  end

  test "increment points" do      
    points = 5
    @balance.increment_points(points)
    assert_equal(points, @balance.balance)
  end

  test "ready_to_exchange" do
  	@balance.promotion = @promotion
  	@balance.increment_points(5)
  	assert !@balance.ready_to_exchange?
  	@balance.increment_points(400)
  	assert @balance.ready_to_exchange?
  end

end
