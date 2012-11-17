class PointsController < ApplicationController
  load_and_authorize_resource
  before_filter :load_company

  # GET /points
  # GET /points.json
  def index
    @points = Point.by_promotions(@company.promotions)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @points }
    end
  end

  # GET /points/1
  # GET /points/1.json
  def show
    @point = Point.find(params[:id])

    @temp_password = @point.client.try(:user).try(:temporary_password)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @point }
    end
  end

  # GET /points/new
  # GET /points/new.json
  def new
    @point = Point.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @point }
    end
  end

  # GET /points/1/edit
  def edit
    @point = Point.find(params[:id])
  end

  # POST /points
  # POST /points.json
  def create
    @point = Point.new(params[:point])
    @point.company = @company
    respond_to do |format|
      if @point.save
        @balance = ClientBalance.find_by_promotion_id_and_client_id(@point.promotion, @point.client)
        format.js 
        format.html { redirect_to @point, notice: t('sigma.points.successfully_created') }
        format.json { render json: @point, status: :created, location: @point }
      else
        format.html { render action: "new" }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /points/1
  # PUT /points/1.json
  def update
    @point = Point.find(params[:id])

    respond_to do |format|
      if @point.update_attributes(params[:point])
        format.html { redirect_to @point, notice: t('sigma.points.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    respond_to do |format|
      format.html { redirect_to points_url }
      format.json { head :no_content }
    end
  end

  def report
    begin
      @start, @ending = params[:graph_start].to_date, params[:graph_ending].to_date
    rescue
      @start, @ending = Date.yesterday, Date.today
    end

    @promotion = Promotion.find(params[:graph][:promotion_id])
    @company = @promotion.company
    @points_report = Point.by_promotion(@promotion).
      total_daily(@start,@ending)

    respond_to do |format|
      format.html
    end
  end

  private

  def load_company
    @company ||= current_employee.company
  end
end
