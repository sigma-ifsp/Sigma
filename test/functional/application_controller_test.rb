require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  test "current employee user is an employee" do
    employee = Employee.new(:company => Company.new)
    @controller.stubs(:current_employee).returns(employee)
    assert_equal employee, @controller.send(:current_employee)
  end
end
