class Point < ActiveRecord::Base
  belongs_to :client
  belongs_to :promotion
  belongs_to :company
  attr_reader :cpf
  attr_accessible :points, :value, :cpf, :promotion_id, :company_id

  validate :check_client_cpf

  # Find or create a new client based on CPF
  def cpf=(client_cpf)
    client = Client.find_or_create_by_cpf(client_cpf)
    self.client = client
  end

  private

  # TODO: Validates CPF on this virtual attribute
  def check_client_cpf
  end
end
