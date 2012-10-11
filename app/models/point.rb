class Point < ActiveRecord::Base
  belongs_to :client
  belongs_to :promotion
  #encoding: utf-8
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
    if @cpf.present? && !Cpf.new(@cpf).valido?
      errors.add :cpf, I18n.t('errors.messages.cpf_is_not_valid')
    end
  end
end
