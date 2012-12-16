# Calculate points
# by given value end promotion
class PointCalculator

  # Represents the monetary value of points
  attr_reader :value
  # The promotions associated with the point
  attr_reader :promotion

  # Receives:
  # value: +Integer+
  # promotion: +Promotion+
  def initialize(value, promotion)
    @value = value
    @promotion = promotion
  end

  # The amount of points
  def points
    if promotion.by_points?
      points_by_points
    else
      points_by_value.to_i
    end
  end

  private

  # Calculates the amount of points
  # if the promotion is by "value"
  def points_by_value
    value / promotion.value 
  end

  def points_by_points
    promotion.points
  end

end
