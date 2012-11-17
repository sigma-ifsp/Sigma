class Company < ActiveRecord::Base
  attr_accessible :cnpj, :email, :name, :phone, :website, :image

  validates :name  , :presence => true
  has_many :promotions

  # Validation of e-mail with regex
  validates :email , :presence => true, :format => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  # Validation of CNPJ using brazilian rails
  validates :cnpj  , :presence => true, :cnpj => true

  has_attached_file :image,
    :path => ":rails_root/public/system/companies/:attachment/:id/:style/:filename",
    :url => "/system/companies/:attachment/:id/:style/:filename",
    :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def to_s
    self.name
  end
end
