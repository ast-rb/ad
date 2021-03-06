Advertisement::Application.routes.draw do
  resources :images

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}

  #resources :index, :only => [:index, :show]
  root :to => 'index#index'
  get 'show/(:id)', to: 'index#show', :as => :show
  post :search, to: 'index#index', as: :search
  get :search, to: 'index#index'

  resources :ads do
    collection { get :autocomplete }
  end


  resources :manage_users, except: [:new, :create]

  #resources :manage_ads, only: [:index, :destroy, :edit, :update,  ] do
  resources :manage_ads, except: [:show, :new, :create] do
    collection { post :search, to: 'manage_ads#index' }
    collection { get :search, to: 'manage_ads#index' }
  end

  resources :manage_types, only: [:index, :new, :create, :destroy]

  # get "index/show"
  # get "index/index"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
