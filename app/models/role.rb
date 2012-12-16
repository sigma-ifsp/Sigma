# The User Role
# Role can be:
#   - Client: a Company costumer
#   - Cashier: an Employee of Company
#   - Admin: an Employee with more privilegies and options of Company
#   - Root: the System Administrator. Can manage companies.
# The permissions details can be found in +Ability+ model
class Role < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :users

  # Returns the client role
  def self.client
    where(name: 'client').first
  end

  # Name is the default +String+ representation
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

  # Check agaist string role_name
  def role_is? role_name
    name == role_name
  end

  # Returns the localized name
  def human_name
    I18n.t("roles.#{self.name}") || self.name
  end
end
