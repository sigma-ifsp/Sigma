class WelcomeController < ApplicationController
  def index
    if current_user
      if current_user.client?
        redirect_to :controller => '/clients', :action => 'points', :id => current_user.client.id
      end
      return
    end
  end
end
