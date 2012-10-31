class Exchange < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :client
  attr_accessible :observation

  scope :by_company,   lambda {|company| joins(:promotion).where(promotions: { company_id: company }) }
  scope :by_promotion, lambda {|promotion| where(promotion_id: promotion) }
  scope :by_client,    lambda {|client| where(client_id: client) }

  #before_save :verify_client_balance

  def verify_client_balance
    @balance = ClientBalance.find_by_promotion_id_and_client_id(self.promotion_id, self.client_id)
    if !@balance.ready_to_exchange?
     errors.add("Saldo Insulficiente para a troca.")
    end
  end

  # Group and count the exchanges by date of creation
  def self.total_daily(start = Date.today.beginning_of_month, ending = Date.today.end_of_month)
    joins(:promotion).
      where(created_at: start.beginning_of_day..ending.end_of_day).
      group("date(exchanges.created_at)").
      select('promotions.name as promotion_name, promotions.id as promotion_id, date(exchanges.created_at) as day, count(*) as total')
  end

end
