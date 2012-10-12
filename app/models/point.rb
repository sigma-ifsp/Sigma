class Point < ActiveRecord::Base
  belongs_to :client
  belongs_to :promotion
  belongs_to :company

  attr_accessible :value, :cpf, :promotion_id, :company_id
  validate :check_client_cpf
  before_save :calculate_points

  attr_reader :cpf

  # Find or create a new client based on CPF
  def cpf=(client_cpf)
    @cpf = client_cpf
    client = Client.find_or_create_by_cpf(client_cpf)
    self.client = client
  end

  def calculate_points
    self.points = PointCalculator.new(self.value, self.promotion).points
  end

  private

  def check_client_cpf
    if not Cpf.new(@cpf).valido?
      errors.add :cpf, I18n.t('errors.messages.cpf_is_not_valid')
    end
  end
end
