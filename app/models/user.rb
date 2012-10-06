class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :login, :email, :password, :password_confirmation, :remember_me
  # Represents the login, which can be the e-mail
  # or username.
  # By default, username is the CPF of client
  attr_accessor :login

  # Associations
  belongs_to :role
  
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

  # Returns if user is a company employee
  def employee?
    role_is? "employee"
  end

  # Find by login
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value",{:value =>login.downcase}]).first
    else
      where(conditions).first
    end
  end

  private

  def role_is? name
    role && role.name == name
  end
end
