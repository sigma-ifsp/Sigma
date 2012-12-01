require 'test_helper'

class ExchangesControllerTest < ActionController::TestCase
  setup do
    promotion = promotions(:one)
    employee = stub(:company => stub(:promotions => [promotion]))
    @controller.stubs(:current_employee => employee)
  end

  test "employee can access the exchanges report form" do
    get :index
    assert_response 200
    assert_not_nil assigns(:company)
  end

  test "employee can access the exchanges report" do
    get :report, :graph_start => '21/01/2011', :graph_ending => '21/12/2012', :graph => {:promotion_id => 1 }
    assert_response 200
    assert_not_nil assigns(:exchanges)
  end


  test "employee can access the exchanges report even if dates are not valids" do
    get :report, :graph_start => 'blabla', :graph_ending => 'blabla', :graph => {:promotion_id => 1 }
    assert_response 200
    assert_equal Date.yesterday, assigns(:start)
    assert_equal Date.today, assigns(:ending)
  end
end
