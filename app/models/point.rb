class Point < ActiveRecord::Base
  belongs_to :client
  belongs_to :promotion
  belongs_to :company
  attr_accessible :value, :cpf, :promotion_id, :company_id
  validate :check_client_cpf
  before_save :calculate_points
  after_save :update_balance

  scope :by_promotions, lambda {|promotions| {
    :include => :promotion, :conditions => { :promotion_id => promotions }
  }}

  scope :by_promotion, lambda{|promotion| where(promotion_id: promotion) }

  scope :by_valid_promotions,
    lambda {  { :include => :promotion, :conditions => ['promotions.ending_date >= ?', Date.today] } }

  # Represents the client document
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

  # Group and count the points by date of creation
  def self.total_daily(start = Date.today.beginning_of_month, ending = Date.today.end_of_month)
    joins(:promotion).
      where(created_at: start.beginning_of_day..ending.end_of_day).
      group("date(points.created_at)").
      select('date(points.created_at) as day,
              count(*) as clients_count,
              sum(points.points) as total')
  end

  private

  def check_client_cpf
    if not Cpf.new(@cpf).valido?
      errors.add :cpf, I18n.t('errors.messages.cpf_is_not_valid')
    end
  end

  def update_balance
    balance = ClientBalance.find_or_create_by_client_id_and_promotion_id(self.client_id, self.promotion_id)
    balance.increment_points(self.points)
  end

end
