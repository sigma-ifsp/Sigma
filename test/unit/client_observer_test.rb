require 'test_helper'

class ClientObserverTest < ActiveSupport::TestCase
  setup do
    @client = Client.new(:cpf => '887.577.938-40')
    @observer = ClientObserver.instance
  end

  test "create client should create user" do
    @client.expects(:save)
    @observer.after_create(@client)
    assert_equal(Role.client, @client.user.role)
  end
end
