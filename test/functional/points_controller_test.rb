require 'test_helper'

class PointsControllerTest < ActionController::TestCase
  setup do
    @promotion = promotions(:two)
    @point = points(:one)
    @point.cpf = '41244527807'

    user = User.new
    user.stubs(:employee).returns(Employee.new(:company => Company.new))
    @controller.stubs(:current_user).returns(user)
  
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create point" do
    assert_difference('Point.count') do
      post :create, point: { value: @point.value, cpf: @point.cpf, promotion_id: @promotion.id }
    end

    assert_redirected_to new_point_path()
  end

  test "should show point" do

    get :show, id: @point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @point
    assert_response :success
  end

  test "should update point" do
    put :update, id: @point, point: { value: @point.value, cpf: @point.cpf, promotion_id: @promotion.id }
    assert_redirected_to point_path(assigns(:point))
  end

  test "should destroy point" do
    assert_difference('Point.count', -1) do
      delete :destroy, id: @point
    end

    assert_redirected_to points_path
  end
end
