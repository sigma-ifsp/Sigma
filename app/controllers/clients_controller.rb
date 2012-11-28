class ClientsController < ApplicationController
  
  # GET /clients/:id
  def show
    redirect_to client_points_path(params[:id])
  end

  # GET /clients/:id/points
  def points
    @client = Client.find(params[:id])
    @points = @client.points.by_valid_promotions
  end

end
