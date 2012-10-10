require 'test_helper'

class PointTest < ActiveSupport::TestCase
  CPF = '64478783314'

  test "should create a new client" do
    Client.expects(:find_or_create_by_cpf).with(CPF)
    point = Point.new(:points => 10, :value => 100, :company_id => 1)
    point.cpf = CPF
  end
end
