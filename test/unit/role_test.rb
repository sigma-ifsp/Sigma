require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  should have_many(:users)
end
