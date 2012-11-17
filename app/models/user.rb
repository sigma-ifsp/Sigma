class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :username, :login, :email, :password, :password_confirmation, :remember_me, :temporary_password, :role_id
  # Represents the login, which can be the e-mail
  # or username.
  # By default, username is the CPF of client
  attr_accessor :login

  # Associations
  belongs_to :role
  has_one :client
  has_one :employee

  before_save :erase_temporary_password!

  delegate :root?, :cashier?, :admin?, :client?, to: :role, allow_nil: true

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

  def erase_temporary_password!
    if self.sign_in_count > 0
      self.temporary_password = nil
    end
  end
end
