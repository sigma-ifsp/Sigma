require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  setup do
  	@client = clients(:john)
  	@promotion = promotions(:one)
  	@balance = client_balances(:one)
  	@exchange = Exchange.new
  	@exchange.client = @client
  	@exchange.promotion = @promotion
  end
  test "client exchange points" do
  	assert @exchange.save
  end

  test "update client balance" do
  	balance = @client.client_balances.last.balance
  	@exchange.save
  	assert_not_equal balance, @client.client_balances.last.balance
  end

  test "client don't have enough balance" do
  	@promotion.points_to_exchange = 100
  	@promotion.save
  	balance = @client.client_balances.last.balance
  	@exchange.save
  	assert_equal balance, @client.client_balances.last.balance
  end
end
