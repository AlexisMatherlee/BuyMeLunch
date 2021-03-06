BuyMeLunch::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users
  root :to => 'pages#index'
  match '/signup',   to: 'users#new',            via: 'get'
  match '/user/:id' => 'users#comparequeue',       via: 'get'
  match '/random',   to: 'users#random',         via: 'get'
  match '/edit',     to: 'users#edit',           via: 'get'
  match '/location', to: 'users#location',       via: 'get'
  match '/message',  to: 'users#message',        via: 'get'
  match '/addtoqueue_a/:id/:targetid' => 'users#addtoqueue_a',        via: 'get'
  match '/addtoqueue_b/:id/:targetid' => 'users#addtoqueue_b',        via: 'get'
  match '/comparequeue:id' => 'users#comparequeue',        via: 'get'
  match '/resetallmatches/', to: 'users#resetallmatches',       via: 'get'

  #devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

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
