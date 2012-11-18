class ClientBalancesController < ApplicationController

  # GET /clients/by_cpf/:cpf/promotions/:promotion_id/balance.json
  def balance
    @promotion = Promotion.find(params[:promotion_id])
    @client = Client.find_by_cpf(params[:cpf])
    @balance = ClientBalance.find_by_client_id_and_promotion_id(@client, @promotion)

    respond_to do |format|
      format.json {
        render :json => @balance.to_json(:include => [:promotion, :client => {:include => {:user => { :only => [:name,:username] } } } ])
      }
    end
  end

  # GET /clients/by_cpf/:cpf/balances.json
  def all_balances
    @client = Client.find_by_cpf(params[:cpf])
    @balances = @client.client_balances

    respond_to do |format|
      format.json {
        render :json => @balances.to_json(:include => {:client => {:include => {:user => { :only => [:name,:username] } } } }) 
      }
    end
  end
end
