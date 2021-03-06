Sigma::Application.routes.draw do
  get "contact/company"
  post "contact/send_to_sigma"

  get "contact/client"
  resources :employees

  get "welcome/index"

  get "client_balances/balance"
  get "client_balances/all_balances"

  match 'about_us' => 'welcome#about_us'
  match 'services' => 'welcome#services'
  match 'clients/:id' => 'clients#show'
  match 'clients/:id/points' => 'clients#points', as: 'client_points'
  match 'clients/by_cpf/:cpf/balances' => 'client_balances#all_balances'
  match 'clients/by_cpf/:cpf/promotions/:promotion_id/balance' => 'client_balances#balance'

  resources :points do
    collection do
      get '/report'
    end
  end

  resources :promotions

  devise_for :users

  resources :companies do
    resources :employees
  end

  resources :exchanges do
    collection do
      get '/report'
    end
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
