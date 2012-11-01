class ExchangesController < ApplicationController

  def create 
    @exchange = Exchange.new(:promotion_id => params[:exchange][:promotion_id], 
      :client_id => params[:exchange][:client_id])
    respond_to do |format|
      if @exchange.save
        format.html {redirect_to '/points/new', :notice => I18n.t('sigma.exchanges.successful')}
      else
        format.html {redirect_to '/points/new', :notice => I18n.t('sigma.exchanges.not_successful')}
      end
    end
  end

end