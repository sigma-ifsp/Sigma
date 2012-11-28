class Promotion < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :promotion_category
  attr_accessible :image, :ending_date, :initial_date, :name, :points, :value, :description, :promotion_category_id, :points_to_exchange
  has_attached_file :image,
    :styles => { :medium => "300x300>", :thumb => "100x100>", :list => "60x60>" }
  
  validates :name, :presence => true
  validates :description, :presence => true

  # Scope promotions by company
  scope :by_company, lambda{|company| where(company_id: company) }

  # Set default point value
  before_save :set_default_point_value
  
  def to_s
    self.name
  end

  # Returns if promotions is by points
  def by_points?
    self.promotion_category.present? and self.promotion_category.name == "points"
  end

  private

  def set_default_point_value
    self.points = 1 unless self.points.present?
  end

end
