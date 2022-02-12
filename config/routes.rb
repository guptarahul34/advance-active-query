Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "products#index"
  get "/homepage", to: "products#index"
  get "/notdefaultscope", to: "products#not_default"
  get "//allscopedata", to: "products#all_scope_data"
  resources :products

  get "/quantity/sum", to: "products#quantity_product"
  #=============== routes for customers ======================
  resources :customers
  
  #=========== routes for orders =================
  resources :orders

  post "/orders/name", to: "orders#search_by_name"

end
