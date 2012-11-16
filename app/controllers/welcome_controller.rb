class WelcomeController < ApplicationController
  def index
   if current_user
     if current_user.client?
       redirect_to :controller => '/clients', :action => 'points', :id => current_user.client.id
     elsif current_user.admin? || current_user.cashier?
       redirect_to new_point_path
     end
     return
   end
  end

  def about_us
  end

  def services
  end
end
