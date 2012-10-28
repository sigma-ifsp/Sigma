class ExchangeController < ApplicationController

  def create
    @exchange = Exchange.new(params[:exchange])
    if @exchange.save
      redirect_to '/points/new'
    else
      redirect_to '/points/new', :notice => I18n.t('sigma.exchanges.not_successful')
    end
  end

end
