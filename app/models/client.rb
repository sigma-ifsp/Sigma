class Client < ActiveRecord::Base
  attr_accessible :cpf, :name
  belongs_to :user

  has_many :points
  has_many :exchanges
  has_many :client_balances

  # Validates CPF using Brazilian Rails
  validates :cpf, :presence => true, :cpf => true, :uniqueness => true

  # Returns name or cpf
  def to_s
    self.name || self.cpf
  end

  # Takes name from user
  def name
    self.user.try(:name)
  end

end
