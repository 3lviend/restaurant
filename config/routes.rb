Rails.application.routes.draw do

  root 'routes#root'

  devise_for :users, :controllers => {:registrations => "registrations"}
  
  get 'admin/quicklink' => 'admin#index'
  get 'admin/orders' => 'admin#orders'
  get 'admin/chefs' => 'chefs#all_chef'
  get 'admin/reports' => 'admin#reports'

  #line_items
  resources :line_items do
      collection do
      get 'edit_quantity/:line_item_id' => 'line_items#edit_quantity', as: :edit_quantity
      get 'table/:table_id' => 'line_items#new', as: :new_order_table
    end
  end
  get 'new_order_without_table' => 'line_items#new_order_without_table'
  
  get 'search_item' => 'items#search_item'
  
  #Chefs
  resources :chefs
  post 'update_status_item' => "chefs#update_status_item"

  # Payment Method
  resources :payment_methods

  # Additional
  resources :additionals

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
      get 'warning'  
    end
  end
  
  get 'orders_today' => 'orders#orders_today'
  get 'your_order/:id' => 'orders#your_order', as: :your_order
  get 'order_unpaid_without_table' => 'orders#order_unpaid_without_table'
  
  # Payment
  post 'update_status_order' => 'orders#update_status_order'
  get 'get_payment_discount/:payment_type' => 'orders#get_payment_discount'
  post 'update_payment_method/:id' => 'orders#update_payment_method'
  get 'get_additional' => 'orders#get_additional'
 

  # for api
  namespace :api, constraints: {format: :json} do
    # match '/sessions' => 'sessions#create', via: [:post, :options ]
    resources :sessions, only:[:create, :delete]
    resources :orders
    get 'order_without_table' => 'orders#order_without_table'
    get 'order_without_table/:id' => 'orders#show_detail_order_without_table'
    get 'order_with_table' => 'orders#order_with_table'
    get 'order_with_table/:id' => 'orders#show_detail_order_with_table'
    resources :items
    match '/items/:id' => 'items#update', via: [:put, :options ]
  end
  
end
