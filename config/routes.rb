Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"

  get "static_pages/home"

  namespace :api do
    resources :users, only: %i[create index]
    resources :sessions, only: [:create]
    resources :orders, only: [:create]
    resources :order_details, only: [:create]
    #prettier auto format
    get "/products" => "products#index"
    get "/products/:id" => "products#get_product_by_product_id"
    post "/products" => "products#create"

    post "/charge/mark_complete" => "charges#mark_complete"
    post "/charges" => "charges#create"

    get "/authenticated" => "sessions#authenticated"
    delete "/sessions" => "sessions#destroy"

    get "/orders" => "orders#index"

    get "/order_details/:order" => "order_details#get_order_details_by_order_id"
  end
end
