require 'test_helper'

class AbilityTest < ActiveSupport::TestCase

  test "user cashier should be able to view promotions" do
    user = User.new
    user.stubs(:role).returns(Role.new(:name => "cashier"))
    ability = Ability.new(user)

    assert ability.cannot?(:update, Promotion.new), "User cashier should not update promotions"
    assert ability.can?(:read, Promotion.new)
  end
end
