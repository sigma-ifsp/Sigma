class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  attr_accessible :name, :company, :user, :user_attributes
  accepts_nested_attributes_for :user
end
