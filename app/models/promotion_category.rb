class PromotionCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :promotions

  def self.by_points
    where(name: 'points').first
  end

  def self.by_value
    where(name: 'value').first
  end
end
