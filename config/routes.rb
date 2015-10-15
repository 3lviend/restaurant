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
        get 'edit_quantity/:line_item_id' => 'line_items#edit_quantity', as: :edit_quantity
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
  get 'order_unpaid_without_table' => 'orders#order_unpaid_without_table'
  
  post 'update_status_order' => 'orders#update_status_order'
  # get 'admin_get_update_paid/:id' => 'admin#get_update_paid', as: :get_update_paid
  # put 'admin_update_paid/:id' => 'admin#update_paid', as: :update_paid

  # for api
  namespace :api, constraints: {format: :json} do
    # match '/sessions' => 'sessions#create', via: [:post, :options ]
    resources :sessions, only:[:create, :delete]
  end
  
end
