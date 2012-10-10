require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "should validates cpf" do
    client = Client.new(:name => "Zeh")
    assert !client.valid?
    client.cpf = '808.168.454-91'
    assert !client.valid?
    client.cpf = '808.168.454-92'
    assert client.valid?
  end
end
