require 'test_helper'

class ContactControllerTest < ActionController::TestCase
  test "should get company" do
    get :company
    assert_response :success
  end

  test "should get client" do
    get :client
    assert_response :success
  end

end
