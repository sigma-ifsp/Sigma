class Role < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :users

  def self.client
    where(name: 'client').first
  end

  def to_s
    self.name
  end

  # Returns if user is root
  def root?
    role_is? "root"
  end

  # Returns if user is client
  def client?
    role_is? "client"
  end

  # Return if user is a company admin
  def admin?
    role_is? "admin"
  end

  # Returns if user is a company cashier
  def cashier?
    role_is? "cashier"
  end

  def role_is? role_name
    name == role_name
  end

end
