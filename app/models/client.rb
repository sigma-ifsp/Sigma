class Client < ActiveRecord::Base
  belongs_to :user
  attr_accessible :cpf, :name

  # Validates CPF using Brazilian Rails
  validates :cpf, :presence => true, :cpf => true, :uniqueness => true
  after_create :create_user

  def to_s
    self.name || self.cpf
  end

  private

  def create_user
    if not self.user
      password = rand(36**9).to_s(36)
      self.user = User.new(username: self.cpf,
                           email: "#{self.cpf}@sigma.com.br",
                           password: password,
                           password_confirmation: password,
                           temporary_password: password)
      self.user.role = Role.client
      self.save
    end
  end
end
