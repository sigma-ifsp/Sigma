class Client < ActiveRecord::Base
  belongs_to :user
  attr_accessible :cpf, :name
  def to_s
  	self.name
  end
end
