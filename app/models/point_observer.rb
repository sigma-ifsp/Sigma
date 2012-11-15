class PointObserver < ActiveRecord::Observer
  def before_save(point)
    point.points = PointCalculator.new(point.value, point.promotion).points
  end

  def after_save(point)
    balance = ClientBalance.find_or_create_by_client_id_and_promotion_id(point.client_id, point.promotion_id)
    balance.increment_points(point.points)
  end
end
