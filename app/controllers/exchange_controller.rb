class ExchangeController < ApplicationController

  def create
    @exchange = Exchange.new[params[:exchange]]
    if @exchange.save
      redirect_to '/points/new'
    else
      redirect_to '/points/new'. :notice => "Troca não realizada"
    end
  end

end