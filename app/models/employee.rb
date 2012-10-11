class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  attr_accessible :name, :company, :user
end
