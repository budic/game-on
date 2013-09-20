GameOn::Application.routes.draw do

  match 'feedbacks' => 'feedbacks#create', :as => :feedback, via: :post
  match 'feedbacks/new' => 'feedbacks#new', :as => :new_feedback, via: :get
  
  resources :rec_event_follows do
    collection do
      get 'mygames'
    end
  end

  resources :event_invites

  resources :events do
    collection do
      get 'rsvp_yes'
      get 'rsvp_no'
      get 'rsvp_maybe'
    end
  end

  resources :game_types
  resources :recurring_events do
    collection do
      get 'nearby'
      get 'follow'
      get 'unfollow'
    end
  end

  resources :locations do
    collection do
      get 'nearby'
    end
  end

  resources :user_profiles do
    collection do
      get 'editself'
    end
  end
  
  resources :home 
  
  authenticated :user do
    root :to => 'home#index', as: 'authorized'
  end
  root :to => "users#index"
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  

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
