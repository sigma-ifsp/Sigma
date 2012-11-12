require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @user = User.new
    @user.stubs(:root?).returns(true)
    @controller.stubs(:current_user).returns(@user)
    @employee = employees(:one)
    @company = companies(:one)
  end

  test "should get index" do
    get :index, :company_id => @company.id
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new, :company_id => @company.id
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: {  },:company_id => @company.id
    end

    assert_redirected_to company_employee_path(assigns(:company), assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee, :company_id => @company.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee, :company_id => @company.id
    assert_response :success
  end

  test "should update employee" do
    put :update, id: @employee, employee: {  }, :company_id => @company.id
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee,:company_id => @company.id
    end

    assert_redirected_to employees_path
  end
end
