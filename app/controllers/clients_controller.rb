class ClientsController < ApplicationController
  
  def index
  end

  def show
  end

  # GET /clients/:id/points
  def points
    @client = Client.find(params[:id])
    @points = @client.points.by_valid_promotions
  end

  # GET /clients/:cpf/promotions/:promotion_id/balance.json
  def balance
    @client = Client.find_by_cpf(params[:cpf])
    @balance = ClientBalance.find_by_promotion_id_and_client_id(params[:promotion_id], @client.id)
    respond_to do |format|
      format.json { render json: @balance}
    end
  end

  

end
