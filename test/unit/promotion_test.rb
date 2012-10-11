require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:description)
end
