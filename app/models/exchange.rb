class Exchange < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :client
  attr_accessible :observation
end
