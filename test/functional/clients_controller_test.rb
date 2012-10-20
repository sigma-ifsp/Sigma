require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @user = users(:john)
    @user.stubs(:client? => true)
    @controller.stubs(:current_user => @user)

    @client = clients(:john)
    @client.stubs(:user_id => @user.id)
  end

  test "should get show" do
    get :show, :id => @client.id
    assert_response :success
  end

  test "should get points" do
    get :points, :id => @client.id
    assert_response :success
  end

end
