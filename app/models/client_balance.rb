# Client Balance is the representation of
# statements based on promotion and client
class ClientBalance < ActiveRecord::Base
  belongs_to :client
  belongs_to :promotion
  attr_accessible :balance

  # Updates the balance with points.
  # +points+ should respond to "to_i",
  # and it can also be negative.
  def increment_points(points)
    self.balance = self.balance.to_i + points.to_i
    self.save
  end

  # If it's ready for exchange.
  # Return +Boolean+
  def ready_to_exchange?
    self.balance >= self.promotion.points_to_exchange
  end

end
