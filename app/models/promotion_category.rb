# Represents the promotion category
class PromotionCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :promotions

  # Fixed points
  def self.by_points
    where(name: 'points').first
  end

  # By value means that points will be
  # calculated based on some monetary value
  def self.by_value
    where(name: 'value').first
  end
end
