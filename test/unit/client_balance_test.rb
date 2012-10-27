require 'test_helper'

class ClientBalanceTest < ActiveSupport::TestCase
  test "increment points" do
     balance = ClientBalance.new
     points = 5
     balance.increment_points(points)
     assert_equal(5,balance.balance)
  end
end
