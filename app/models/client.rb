class Client < ActiveRecord::Base
  belongs_to :user
  attr_accessible :cpf, :name

  # Validates CPF using Brazilian Rails
  validates :cpf, :presence => true, :cpf => true, :uniqueness => true

  def to_s
  	self.name
  end
end
