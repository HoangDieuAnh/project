Rails.application.routes.draw do

  resources :relationships

  resources :events

  resources :societies

  resources :users
  resources :tickets
  #get 'sessions/login,'

  #get 'sessions/home,'

  #get 'sessions/profile,'

  #get 'sessions/setting'
    
    match '/reservations', controller: 'reservations', action: 'destroy', via: :get
    match '/about' , controller: 'pages', action: 'about', via: :get
    match '/contact' , controller: 'pages', action: 'contact', via: :get
    match '/privacy' , controller: 'pages', action: 'privacy', via: :get
    match '/terms' , controller: 'pages', action: 'terms', via: :get
    match'/findEvents', controller:'societies', action: 'findEvents', via: :get
    match '/login_attempt', controller: 'sessions', action: 'login_attempt', via: :post
    match '/new', controller: 'users', action: 'new', via: [:get]
    #match '/:id', controller: 'users', action: 'update', via: [:post]

    #match '/create', controller: 'users', action: 'create', via: :post
    match '/edit', controller: 'users', action: 'edit', via: [:get]

    match '/search', controller:'query', action:'index', via: [:post, :get]

    match '/logout', controller:'sessions', action:'logout', via: [:post, :get]

    #new
    match '/events', controller: 'events', action: 'show', via: :get
    match '/societies', controller: 'societies', action: 'show', via: :get

    #post '/login_attempt'     => 'high_voltage/pages#show', id: 'home'
    get '/home', to: redirect('/')
      resources :reservations

  root :to => 'pages#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root 'welcome#index'

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