class Point < ActiveRecord::Base
  belongs_to :client
  belongs_to :promotion
  belongs_to :company
  attr_accessor :cpf
  attr_accessible :points, :value, :cpf, :promotion_id, :company_id
end
