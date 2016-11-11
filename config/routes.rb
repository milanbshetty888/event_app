Rails.application.routes.draw do

root 'users#home', as: :home
  get '/lsignup' => 'users#new', as: :user_signin

  post '/user' => 'users#create', as: :user_log

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create', as: :login_post
  get '/logout' => 'sessions#destroy', as: :login_destroy


  get '/event/new/:user_id' => 'events#new', as: :event_new
  post '/event/create/:user_id' => 'events#create', as: :event_create
  get '/event/index' => 'events#index', as: :event_index

  get "/event/:id/edit" => "events#edit", as: :event_edit
  put "/event/:id/edit" => "events#update", as: :event_update
  get "event/:id" => "events#show", as: :event_show















  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
