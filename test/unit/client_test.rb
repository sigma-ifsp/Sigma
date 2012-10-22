require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "should validates cpf" do
    client = Client.new
    assert !client.valid?
    client.cpf = '808.168.454-91'
    assert !client.valid?
    client.cpf = '808.168.454-92'
    assert client.valid?
  end

  test "#to_s" do
    client = Client.new(:cpf => '123')
    assert_equal('123', client.to_s)
  end

  test "create client should create user" do
    client = Client.new(:cpf => '37132373870')
    assert_difference('User.count') do
      client.save
    end
    assert_equal(Role.client, client.user.role)
  end
end
