require 'test_helper'

class ClientBalancesControllerTest < ActionController::TestCase
  setup do
    @client = clients(:jully)
    @promotion = promotions(:one)
    @balance = ClientBalance.new
    @balance.client = @client
    @balance.promotion = @promotion
    @balance.save
  end

  test "should get balance as json" do
    get :balance, :cpf => @client.cpf, :promotion_id => @promotion.id, :format => :json
    assert_response :success
    assert_not_nil assigns(:balance) 
  end

  test "should all balances as json" do
    get :all_balances, :cpf => @client.cpf, :format => :json
    assert_response :success
    assert assigns(:balances).present?
  end

end
