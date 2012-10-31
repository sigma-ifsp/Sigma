class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
     redirect_to root_url, :alert => I18n.t('sigma.please_sign_in')
  end

  private

  def current_employee
    current_user.employee
  end

  def current_client
    current_user.client
  end

  helper_method :current_employee, :current_client
end
