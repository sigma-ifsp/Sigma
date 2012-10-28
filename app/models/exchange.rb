class Exchange < ActiveRecord::Base
  belongs_to :promotion
  belongs_to :client
  attr_accessible :observation
  before_save :verify_client_balance

  def verify_client_balance
    @balance = ClientBalance.find_by_promotion_id_and_client_id(self.promotion_id, self.client_id)
  	if !@balance.ready_to_exchange?
  	  errors.add("Saldo Insulficiente para a troca.")
    end
  end

end
