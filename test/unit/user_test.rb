require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:phil)
    @user2 = users(:deh)
  end

  test "find using login" do
    assert_equal @user, User.find_first_by_auth_conditions({:login => @user.username})
  end

  test "find using email" do
    assert_equal @user2, User.find_first_by_auth_conditions({:email => @user2.email})
  end

  test "user shoulb be root" do
    @user.role = roles(:root)
    assert @user.root?
    assert !@user.client?
  end

  test "user should be client" do
    @user.role = roles(:client)
    assert @user.client?
  end

  test "user should be admin" do
    @user.role = roles(:admin)
    assert @user.admin?
  end

  test "user should be cashier" do
    @user.role = roles(:cashier)
    assert @user.cashier?
  end

end
