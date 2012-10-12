require 'test_helper'

class PointTest < ActiveSupport::TestCase
  CPF = '1234512323'

  test "should create a new client" do
    Client.expects(:find_or_create_by_cpf).with(CPF).returns(Client.new)
    point = Point.new(:value => 100, :company_id => 1)
    point.cpf = CPF
  end

  test "should have error if cpf is not valid" do
    point = Point.new(:value => 100, :company_id => 1)
    point.cpf = CPF
    assert !point.valid?
  end

end
