class Exchange < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :client
  attr_accessible :observation, :promotion_id, :client_id

  scope :by_company,   lambda {|company| joins(:promotion).where(promotions: { company_id: company }) }
  scope :by_promotion, lambda {|promotion| where(promotion_id: promotion) }
  scope :by_client,    lambda {|client| where(client_id: client) }

  before_save :debit_from_client_balance

  def debit_from_client_balance
    balance = ClientBalance.find_by_promotion_id_and_client_id(self.promotion_id, self.client_id)
    if not balance.decrement_points(balance.promotion.points_to_exchange)
      self.errors.add(:client, "Saldo insuficiente")
    end
  end
end