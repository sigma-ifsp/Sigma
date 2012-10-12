class Promotion < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :promotion_category
  attr_accessible :image, :ending_date, :initial_date, :name, :points, :value, :description, :promotion_category_id, :points_to_exchange
  has_attached_file :image
  
  validates :name, :presence => true
  validates :description, :presence => true

  def self.by_company(company)
    where(company_id: company)
  end
  
  def to_s
    self.name
  end

  def by_points?
    self.promotion_category.present? and self.promotion_category.name == "points"
  end

end
