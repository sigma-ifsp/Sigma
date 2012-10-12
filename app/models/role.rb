class Role < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :users

  def self.client
    where(name: 'client').first
  end

end
