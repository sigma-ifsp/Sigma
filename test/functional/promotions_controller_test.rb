require 'test_helper'

class PromotionsControllerTest < ActionController::TestCase
  setup do
    employee = Employee.new
    employee.stubs(:company => Company.new(name: 'Company 1'))
    user = User.new
    user.stubs(:role => Role.new(name: "admin"))
    user.stubs(:employee => employee)
    @controller.stubs(:current_user).returns(user)
    @promotion = promotions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promotion" do
    assert_difference('Promotion.count') do
      post :create, promotion: { description: @promotion.description, ending_date: @promotion.ending_date, initial_date: @promotion.initial_date, name: @promotion.name, points: @promotion.points, value: @promotion.value }
    end

    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should show promotion" do
    get :show, id: @promotion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @promotion
    assert_response :success
  end

  test "should update promotion" do
    put :update, id: @promotion, promotion: { ending_date: @promotion.ending_date, initial_date: @promotion.initial_date, name: @promotion.name, points: @promotion.points, value: @promotion.value }
    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should destroy promotion" do
    assert_difference('Promotion.count', -1) do
      delete :destroy, id: @promotion
    end

    assert_redirected_to promotions_path
  end
end
