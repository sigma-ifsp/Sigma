class ClientBalance < ActiveRecord::Base
  belongs_to :client
  belongs_to :promotion
  attr_accessible :balance

  def increment_points(points)
    self.balance = self.balance.to_i + ( points )
    self.save
  end

  def ready_to_exchange?
    self.balance >= self.promotion.points_to_exchange
  end

end
