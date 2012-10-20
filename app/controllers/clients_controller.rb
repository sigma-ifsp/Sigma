class ClientsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  # GET /clients/:id/points
  def points
    @client = Client.find(params[:id])
    @points = @client.points.by_valid_promotions
  end
end
