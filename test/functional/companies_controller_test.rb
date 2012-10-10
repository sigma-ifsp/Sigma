require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @user = User.new
    @user.stubs(:root?).returns(true)
    @controller.stubs(:current_user).returns(@user)
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { cnpj: @company.cnpj, email: @company.email, name: @company.name, phone: @company.phone, website: @company.website }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    put :update, id: @company, company: { cnpj: @company.cnpj, email: @company.email, name: @company.name, phone: @company.phone, website: @company.website }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end
    assert_redirected_to companies_path
  end

  test "should get increase_points" do
    get :increase_points, :id => @company.id
    assert_response :success
  end
end
