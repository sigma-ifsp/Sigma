require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  should validate_presence_of(:email)
  should validate_presence_of(:cnpj)
  should validate_presence_of(:name)
  should validate_format_of(:email).with('email@email.com')
  should validate_format_of(:email).not_with('email.email.com')

  test "should validate cnpj" do
    company = Company.new(:email => "email@email.com", 
                          :name => "Test")
    assert !company.valid?
    company.cnpj = "09358108000206"
    assert company.valid?
  end
end
