# A +Company+ employee
#
# It can have two user roles:
#   - Admin: can create promotions and see the reports;
#   - Cashier: can create points and see client balances.
class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  attr_accessible :name, :company, :user, :user_attributes
  accepts_nested_attributes_for :user

  delegate :name, to: :user, :allow_nil => true
end
