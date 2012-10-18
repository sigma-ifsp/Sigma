class ClientsController < ApplicationController
  def index
  end

  def show
  end

  # GET /clients/:id/points
  def points
    @client = Client.find(params[:id])
    @points = @client.points
  end
end
