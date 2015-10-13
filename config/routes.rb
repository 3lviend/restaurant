Rails.application.routes.draw do

  root 'routes#root'

  devise_for :users, :controllers => {:registrations => "registrations"}
  
  # root 'admin#index'
  
  # Admin
  # resources :admin do
  #   resource :tables
  # end
  get 'admin/quicklink' => 'admin#index'
  # get 'admin/ingredients' => 'ingredients#index'
  get 'admin/orders' => 'admin#orders'
  # get 'admin/items' => 'items#index'
  # get 'admin/tables' => 'tables#index'
  get 'admin/chefs' => 'chefs#all_chef'
  # get 'admin/waitress' => 'waitress#index'
  
  ## resources

  # Customer
  # resource :customers
  get 'customer' => 'customers#index'
  
  #line_items
  resources :line_items do
      collection do
      get 'table/:table_id' => 'line_items#new', as: :new_order_table
    end
  end
  get 'new_order_without_table' => 'line_items#new_order_without_table'
  
  get 'search_item' => 'items#search_item'
  # resources :autocomplete_searches, :only => [:index], :as => 'autocomplete'
  
  #Chefs
  resources :chefs
  post 'update_status_item' => "chefs#update_status_item"

  #Waitress 
  resources :waitress
  
  # Item
  resources :items

  #Table
  
  resources :tables
  
  #Ingredient 
  resources :ingredients  do
      collection do
        get 'warning'        
      end
  end

  #Order
  resources :orders do
    collection do 
      # get 'items_name'=> 'orders#items'
      # get 'table/:id' => 'orders#new', as: :new_order_table
      get 'warning'  
    end
  end

  get 'your_order/:id' => 'orders#your_order', as: :your_order
  get 'orders_table_unpaid' => 'orders#table_order_unpaid'

  post 'update_status_order' => 'orders#update_status_order'
  # get 'admin_get_update_paid/:id' => 'admin#get_update_paid', as: :get_update_paid
  # put 'admin_update_paid/:id' => 'admin#update_paid', as: :update_paid

    
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
