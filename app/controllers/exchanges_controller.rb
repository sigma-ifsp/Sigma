class ExchangesController < ApplicationController

  # POST /exchanges/create
  def create
    @exchange = Point.new
    @promotion = Promotion.find(params[:exchange_promotion_id])
    @exchange.cpf = params[:exchange_client_cpf]
    @exchange.promotion = @promotion
    @exchange.points = @promotion.points_to_exchange * -1

    if @exchange.save
      redirect_to '/points/new', :notice => t('sigma.exchanges.successful')
    else
      redirect_to '/points/new', :notice => I18n.t('sigma.exchanges.not_successful')
    end
  end

  # GET /exchanges
  def index
    @company = current_employee.company

    respond_to do |format|
      format.html
    end
  end

  # POST /exchanges/report
  def report
    begin
      @start, @ending = params[:graph_start].to_date, params[:graph_ending].to_date
    rescue
      @start, @ending = Date.yesterday, Date.today
    end

    @promotion = Promotion.find(params[:graph][:promotion_id])
    @company = @promotion.company
    @exchanges = Exchange.by_promotion(@promotion).
      total_daily(@start, @ending) rescue []

    respond_to do |format|
      format.html
    end
  end
end
