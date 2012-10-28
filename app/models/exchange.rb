class Exchange < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :client
  attr_accessible :observation

  scope :by_company,   lambda {|company| joins(:promotion).where(promotions: { company_id: company }) }
  scope :by_promotion, lambda {|promotion| where(promotion_id: promotion) }
  scope :by_client,    lambda {|client| where(client_id: client) }
end
