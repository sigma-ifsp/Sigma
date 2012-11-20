class EmployeesController < ApplicationController
  load_and_authorize_resource

  before_filter :load_company
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.where(company_id: params[:company_id]).includes(:user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    @roles = Role.where(name: ['cashier','admin'])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new
    @employee.build_user
    @roles = Role.where(name: ['cashier','admin'])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
    @roles = Role.where(name: ['cashier','admin'])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
    @employee.company = @company
    @roles = Role.where(name: ['cashier','admin'])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to [@company, @employee], notice: t('employees.messages.successfully_created') }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])

    @roles = Role.where(name: ['cashier','admin'])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to [@company,@employee], notice: t('employees.messages.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to company_employees_path(@company) }
      format.json { head :no_content }
    end
  end

  private
  def load_company
    @company ||= Company.find(params[:company_id])
  end
end
