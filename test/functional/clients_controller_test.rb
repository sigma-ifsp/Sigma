require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:john)
  end

  test "should get index" do
    get :index
    assert_response :success
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
